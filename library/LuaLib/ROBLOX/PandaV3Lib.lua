local PandaAuth = {}

-- User Customizations

getgenv().AllowLibNotification = true
getgenv().CustomLogo = "14317130710"
getgenv().DebugMode = false

-- ( Experimental ) If this Method Set to false, Premium Key Identifier could be executed and requires additional modification to the
-- Key System.
getgenv().CompatibleMode = true

-- Roblox Lua Services

local http_service = game:GetService("HttpService")
local rbx_analytics_service = cloneref(game:GetService("RbxAnalyticsService"))
local starter_gui_service = cloneref(game:GetService("StarterGui"))
local players_service = cloneref(game:GetService("Players"))

print('gib me robux')
-- Server Domain
local server_configuration = "https://auth.pandadevelopment.net"

-- Lua Lib Version
local LibVersion = "2.0.9b"

-- Validation Services
local validation_service = server_configuration.. "/validate"

function DebugText(text)
    if getgenv().DebugMode then
        print("[ DEBUG ] - "..text)
    end
end

local _tostring = clonefunction(tostring)

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
            return client_id
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

function PandaAuth:GetLink(Exploit)
    local user_link = server_configuration .. "/getkey?service=" .. Exploit .. "&hwid=" .. GetHardwareID(Exploit);
    PandaLibNotification(user_link)
    DebugText("Get Key: "..user_link)
    return user_link
end

-- SHA256 Hashing Serverside Algorithm
local function PandaSHA256(service, stringbrub)
    DebugText("[+] Command Hashing: ".. stringbrub)
    local hashed = game:HttpGet(server_configuration ..  "/serviceapi?service=" .. service .. "&command=hashed&param="..stringbrub)
    return hashed
end

-- Premium Key Value
local function PremiumKeyStatus(brub)
    DebugText("[+] Premium Key: ".. brub)
    if brub ==  string.upper(PandaSHA256(service_name, "the key is premium")) then
        return true
    else
        return false
    end
end

-- (Patch / Fix) - For JSON Parsing Issue
function extractFields(jsonString)
    local httpService = game:GetService("HttpService")
    
    -- Parse JSON string
    local success, jsonData = pcall(function() return httpService:JSONDecode(jsonString) end)

    -- Check if parsing was successful
    if success then
        -- Extract specific fields
        local key = jsonData.KEY or "N/A"
        local devId = jsonData.DEV_ID or "N/A"
        local status = jsonData.STATUS or "N/A"
        local isPremium = jsonData.ISPREMIUM or "N/A"

        -- Return the extracted values
        return key, devId, status, isPremium
    else
        warn("Error parsing JSON:", jsonData)
        return nil
    end
end

function PandaAuth:ValidateKey(service_name, Key)
    local combined_url = validation_service .. "?service=" .. service_name .. "&key=" .. Key .. "&hwid=" .. GetHardwareID(service_name)
    local response = game:HttpGet(combined_url) 
    writefile("Encrypted.txt", tostring(response))
    DebugText("Encrypted Data: "..response)
    local decryption = game:HttpGet(server_configuration .. "/serviceapi?service=" .. service_name .. "&command=decrypt&param="..response)
    writefile("Decrypted.txt", tostring(decryption))
    DebugText("Decrypted Data: "..decryption) 

    -- local jsonTable = game:GetService("HttpService"):JSONDecode(decryption)
    -- Call the function and print the results
    local key, devId, status, isPremium = extractFields(decryption)

    local uppercaseString = string.upper(PandaSHA256(service_name, "authenticated"))
    local hardwareid_auth = string.upper(PandaSHA256(service_name, GetHardwareID(service_name)))


    local PremiumKey = PremiumKeyStatus(jsonTable.ISPREMIUM)

    if status == uppercaseString and devId == hardwareid_auth then
        DebugText("Key is Authenticated")
        if getgenv().CompatibleMode then
            return true
        else
            return true, PremiumKey, "authenticated"
        end
    else
        DebugText("Key is Not Authenticated")
        PandaLibNotification("Unable to Validate the Key, See for Developer Console") 
        if getgenv().CompatibleMode then 
            return false
        else  
            return false, PremiumKey, "not_authenticated"
        end
    end
end


return PandaAuth
