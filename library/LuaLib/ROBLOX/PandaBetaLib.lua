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
local LibVersion = "[ 2.1.3_alpha ] - Panda-Pelican Development"
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
            return _tostring(players_service.LocalPlayer.UserId) .."_MOBILE"
        elseif jsonData.AuthMode == "hwidplayer" then
            local hashedata = _tostring(game:HttpGet(server_configuration.."/serviceapi?service="..service.."&command=Hashed&param=".. players_service.LocalPlayer.UserId..client_id, true))
            return hashedata
        elseif jsonData.AuthMode == "hwidonly" then
            return client_id
        elseif jsonData.AuthMode == "iponly" then       
            return jsonData.IPToken
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

local function EncryptionSaveDisk(Data)
    local dick = Data
end

function PandaAuth:ValidateKey(serviceID, Key)
    local service_name = string.lower(serviceID)
    local result = game:HttpGet(validation_service .. "?service=" .. service_name .. "&key=" .. Key .. "&hwid=" .. GetHardwareID(service_name))

    if result == nil then
        DebugText("Failed to fetch Data from Server, Caught off-guard tbh")
    end
    local jsonTable = http_service:JSONDecode(result)
    if jsonTable == nil then
        DebugText("Something isn't right [ Didn't JSON Decoding Work? ]")
    end

    if jsonTable.status == "success" and jsonTable.service == serviceID then        
        DebugText("----- Key is Authenticated -----")
        writefile("Premium.txt", tostring(jsonTable.isPremium))
        return true
    elseif jsonTable.status == "unsupported" then
        DebugText("----- Executor Unsupported -----")
        return "unsupported"
    else
        DebugText("----- Regular Key is Not Authenticated -----")
        PandaLibNotification("Unable to Validate the Key, See for Developer Console") 
        return false
    end
end

function PandaAuth:ValidatePremiumKey(serviceID, Key)
    local service_name = string.lower(serviceID)
    if PandaAuth:ValidateKey(service_name, Key) == true then
        wait(1)
        if readfile("Premium.txt") == tostring(true) then 
            return true
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


return PandaAuth