print('seems worked lmfao xD')
local PandaAuth = {}

-- User Customizations

getgenv().AllowLibNotification = true
getgenv().CustomLogo = "14317130710"
getgenv().DebugMode = false

local TemporaryAccess = false

-- Roblox Lua Services
local http_service = cloneref(game:GetService("HttpService"))
local rbx_analytics_service = cloneref(game:GetService("RbxAnalyticsService"))
local starter_gui_service = cloneref(game:GetService("StarterGui"))
local players_service = cloneref(game:GetService("Players"))
local _tostring = clonefunction(tostring)


-- Server Domain
local server_configuration = "https://auth.pandadevelopment.net"

-- Lua Lib Version
local LibVersion = "v2.1.5_Release"
-- warn("Panda-Pelican Libraries Loaded ( "..LibVersion.." )")
-- Validation Services
local validation_service = server_configuration.. "/failsafeValidation"


function DebugText(text)
    if getgenv().DebugMode then
        print("[ Developer Mode ] - "..text)
    end
end


local function GetHardwareID(service)
        -- Replace with Request
        local response = request({
            Url = server_configuration .. "/serviceapi?service=" .. service .. "&command=getconfig",
            Method = "GET"
        })
        if response.StatusCode == 200 then
            local success, data = pcall(function()
                return http_service:JSONDecode(response.Body)
            end)
            if success then
                if data["AuthMode"] == "hwidonly" then
                    return rbx_analytics_service:GetClientId()
                elseif data["AuthMode"] == "playerid" then
                    return _tostring(players_service.LocalPlayer.UserId)
                else
                    local success, result = pcall(function()
                        return game:HttpGet("https://pandadevelopment.net/serviceapi?service=pandadevkit&command=getuseripaddress")
                    end)
                    
                    if success then
                        return result
                    else
                        print("Error occurred:", result)
                        return _tostring(players_service.LocalPlayer.UserId)
                    end                    
                end
            end
        else
            PandaLibNotification("Error: Check your Dev-Console")
            print("********************************************")
            warn("GetHardwareID() - ".. data)
            print("********************************************")
            return rbx_analytics_service:GetClientId()
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
    if TemporaryAccess then
        local TempKey = server_configuration .. "/getkey?service=" .. Exploit .. "&hwid=" .. players_service.LocalPlayer.UserId;
        return TempKey
    end
    local user_link = server_configuration .. "/getkey?service=" .. Exploit .. "&hwid=" .. GetHardwareID(Exploit);
    PandaLibNotification(user_link)
    DebugText("Get Key: "..user_link)
    return user_link
end
function PandaAuth:GetLink(Exploit)
    if TemporaryAccess then
        local TempKey = server_configuration .. "/getkey?service=" .. Exploit .. "&hwid=" .. players_service.LocalPlayer.UserId;
        return TempKey
    end
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
    if TemporaryAccess then
        return true
    end
    local Service_ID = string.lower(serviceID)
    local response = request({
        Url = "https://pandadevelopment.net/failsafeValidation?service=" .. Service_ID .. "&hwid=" ..GetHardwareID(Service_ID) .. "&key="..ClientKey,
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
    elseif response.StatusCode == 403 then
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

-- Contributed from [ Hub Member: asrua ]
function PandaAuth:ResetHardwareID(ServiceID, oldKey)
    local service_name = string.lower(serviceID)
    for i,v in pairs(http_service:JSONDecode(request({Url = "https://pandadevelopment.net/serviceapi/edit/hwid/?service="..service_name.."&key=" .. oldKey .. "&newhwid=" .. game:GetService("RbxAnalyticsService"):GetClientId(), Method = "POST"}).Body)) do
        print(i, v)
    end
end


function PandaAuth:SetHTTPProtocol(IPv4)
local No_Execute = "No_Data_Set_Here"
if IPv4 == "" or IPv4 == nil then
    warn("[Unable to Start HTTP-Protocol] - Missing IP Address / Port")
    return
end
task.spawn(function() 
    while true do
        wait(0.1)
        local content = game:HttpGet(IPv4.."/readcontent")     
        if content ~= No_Execute then
            local success, result = pcall(function()
                runcode(content)
                local a = tostring(game:HttpGet(IPv4.."/clear"))
            end)
    
            if not success then
                -- Handle the exception here
                warn("Error executing loaded code:", result)
                local b = tostring(game:HttpGet(IPv4.."/clear"))
            end        
        end
    end
end) 
end

function PandaAuth:SetWebsocket(IpAddress)
    warn("This Feature is not available yet... Sorry")
    print("Hi -> "..tostring(IpAddress))
end

return PandaAuth
