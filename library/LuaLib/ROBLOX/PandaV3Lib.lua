 local PandaAuth = {}

-- User Customizations

getgenv().AllowLibNotification = true
getgenv().CustomLogo = "14317130710"
getgenv().DebugMode = false


-- Roblox Lua Services
local http_service = cloneref(game:GetService("HttpService"))
local rbx_analytics_service = cloneref(game:GetService("RbxAnalyticsService"))
local starter_gui_service = cloneref(game:GetService("StarterGui"))
local players_service = cloneref(game:GetService("Players"))
local _tostring = clonefunction(tostring)

-- Server Domain
local server_configuration = "https://auth.pandadevelopment.net"

-- Lua Lib Version
local LibVersion = "[ 2.1.4_testMode ] - Panda-Pelican Development"
-- warn("Panda-Pelican Libraries Loaded ( "..LibVersion.." )")
-- Validation Services
local validation_service = server_configuration.. "/failsafeValidation"


function DebugText(text)
    if getgenv().DebugMode then
        print("[ Developer Mode ] - "..text)
    end
end


local function GetHardwareID(service)
        local jsonData = http_service:JSONDecode(game:HttpGet(server_configuration .. "/serviceapi?service=" .. service .. "&command=getconfig", true))
        local client_id = rbx_analytics_service:GetClientId()
    
        if jsonData.AuthMode == "playerid" then
            return _tostring(players_service.LocalPlayer.UserId)
        elseif jsonData.AuthMode == "hwidplayer" then
            local stringWithoutHyphens = string.gsub(client_id, "-", "")
            local hashedata = client_id..stringWithoutHyphens
            return hashedata
        elseif jsonData.AuthMode == "hwidonly" then
            return client_id
        else
            return players_service.LocalPlayer.UserId
        end
end

local function PandaLibNotification(message)
    if AllowLibNotification then
        starter_gui_service:SetCore("SendNotification", {
            Title = "Key System ",
            Text = user_link,
            Duration = 6,
            Icon = "rbxassetid://"..CustomLogo
        })
    end
end

function PandaAuth:Version()
    return LibVersion
end

function PandaAuth:GetKey(Exploit)
    local user_link = server_configuration .. "/getkey?service=" .. Exploit .. "&hwid=" .. GetHardwareID(Exploit);
    PandaLibNotification(user_link)
    DebugText("Get Key: "..user_link)
    return user_link
end
function PandaAuth:GetLink(Exploit)
    local user_link = server_configuration .. "/getkey?service=" .. Exploit .. "&hwid=" .. GetHardwareID(Exploit);
    PandaLibNotification(user_link)
    DebugText("Get Key: "..user_link)
    return user_link
end

local function GetInfoJSON(command, jsonString)
    -- Assuming you have a JSON library or function to decode the JSON string
    local decodedJson = http_service:JSONDecode(jsonString)
    
    if command == "get_premiumvalue" then
        if decodedJson and decodedJson.isPremium ~= nil then
            local isPremiumValue = decodedJson.isPremium
            return isPremiumValue
        else
            return false
        end
    elseif command == "get_note" then
        if decodedJson and decodedJson.note ~= nil then
            local GetNote = decodedJson.note
            return GetNote
        else
            return "No Message"
        end
    else
        return nil
    end
end

-- New Function ( GetResponseSummary() )
local function CreateResponseCode(ServiceID, code, MessageCause)    
    local data = {
        Identifier = tostring(ServiceID),
        code = code,
        Message = tostring(GetInfoJSON("get_note", MessageCause)),
        IsPremium = GetInfoJSON("get_premiumvalue", MessageCause)
    }
    local encodedData = http_service:JSONEncode(data)
    writefile("Panda_AuthSummary.json", encodedData)
end

-- New Function ( GetResponseSummary() )
function PandaAuth:GetResponseSummary()
    local success, data = pcall(function()
        return http_service:JSONDecode(readfile("Panda_AuthSummary.json"))
    end)

    if success then
        return data["code"]
    else
        warn("Failed to Get Summary Result :skull:")
        return ""
    end
end

function PandaAuth:ValidateKey(serviceID, ClientKey)
    local Service_ID = string.lower(serviceID)
    local response = request({
        Url = "https://pandadevelopment.net/failsafeValidation?service=" .. Service_ID .. "&hwid=" ..GetHardwareID(service_name) .. "&key="..ClientKey,
        Method = "GET"
    })
    CreateResponseCode(Service_ID, response.StatusCode, response.Body)
    if response.StatusCode == 200 then
        -- Instead of fucking finding a string true... why do this
        local success, data = pcall(function()
            return http_service:JSONDecode(response.Body)
        end)
        if success and data["status"] == "success" then
            return true
        end
        return false
    elseif response.StatusCode == 406 then
        -- Especific Hardware / IP Address got Banned
        return false
    elseif response.StatusCode == 204 then
        -- Invalid Key 
        return false
    elseif response.StatusCode == 429 then
        -- Rate Limiter kicked ( Cloudflare limits for 10seconds. )
        return false
    end
end

function PandaAuth:ValidatePremiumKey(serviceID, Key)
    local service_name = string.lower(serviceID)
    if PandaAuth:ValidateKey(service_name, Key) == true then
        wait(1)
        local success, data = pcall(function()
            return http_service:JSONDecode(readfile("Panda_AuthSummary.json"))
        end)    
        if success then
            return data["IsPremium"]
        else
            return false
        end
    else
        return false
    end
end

function PandaAuth:ValidateNormalKey(service_name, Key)
    local bruh = PandaAuth:ValidateKey(service_name, Key)
    return bruh
end



return PandaAuth