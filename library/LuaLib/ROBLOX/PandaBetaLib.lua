local PandaAuth = {}

-- User Customizations

getgenv().AllowLibNotification = true
getgenv().CustomLogo = "14317130710"
getgenv().DebugMode = false

-- ( Experimental ) If this Method Set to false, Premium Key Identifier could be executed and requires additional modification to the
-- Key System.
getgenv().CompatibleMode = true

-- Roblox Lua Services
local http_service = cloneref(game:GetService("HttpService"))
local rbx_analytics_service = cloneref(game:GetService("RbxAnalyticsService"))
local starter_gui_service = cloneref(game:GetService("StarterGui"))
local players_service = cloneref(game:GetService("Players"))

-- Server Domain
local server_configuration = "https://auth.pandadevelopment.net"

-- Lua Lib Version
local LibVersion = "2.1.0_alpha"
warn("Panda-Pelican Libraries Loaded ( "..LibVersion.." )")
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

function PandaAuth:GetLink(Exploit)
    local user_link = server_configuration .. "/getkey?service=" .. Exploit .. "&hwid=" .. GetHardwareID(Exploit);
    PandaLibNotification(user_link)
    DebugText("Get Key: "..user_link)
    return user_link
end

-- SHA256 Hashing Serverside Algorithm
local function PandaSHA256(service, stringbrub)
    -- DebugText("[+] Command Hashing: ".. stringbrub)
    local hashed = game:HttpGet(server_configuration ..  "/serviceapi?service=" .. service .. "&command=hashed&param="..stringbrub)
    return hashed
end

-- Premium Key Value
local function PremiumKeyStatus(brub)
    DebugText("[+] Premium Key: ".. brub)
    return brub ==  string.upper(PandaSHA256(service_name, "the key is premium")) 
end

local function vigenereDecrypt(ciphertext, key)
    local decryptedText = ""
    local keyIndex = 1

    for i = 1, #ciphertext do
        local char = ciphertext:sub(i, i)
        local keyChar = key:sub(keyIndex, keyIndex)
        if char:match("%a") then
            local charCode = char:byte()
            local keyCharCode = keyChar:byte()
            local decryptedCharCode = (charCode - keyCharCode + 26) % 26 + 65
            decryptedText = decryptedText .. string.char(decryptedCharCode)
            keyIndex = keyIndex % #key + 1
        else
            decryptedText = decryptedText .. char
        end
    end

    return decryptedText
end

function PandaAuth:ValidateKey(serviceID, Key)
    local service_name = string.lower(serviceID)

    local combined_url = validation_service .. "?service=" .. service_name .. "&key=" .. Key .. "&hwid=" .. GetHardwareID(service_name)
    local response = game:HttpGet(combined_url) 
    -- DebugText("Encrypted Data: "..response)

    local decryption = vigenereDecrypt(response, "PANDA_DEVELOPMENT")

    -- DebugText("Decrypted Data: "..decryption) 
    local jsonTable = http_service:JSONDecode(decryption)

    local uppercaseString = string.upper(PandaSHA256(service_name, "authenticated"))
    local hardwareid_auth = string.upper(PandaSHA256(service_name, GetHardwareID(service_name)))
    DebugText("-----------------------------------------------------")
    DebugText("---------------- [ Debug Summaries ] ----------------")
    DebugText("-----------------------------------------------------")
    DebugText("[ Server Status: "..jsonTable.STATUS)
    DebugText("[ Client Status: "..uppercaseString)
    DebugText("-----------------------------------------------------")
    DebugText("------------- [ Hardware ID Summaries ] -------------")
    DebugText("-----------------------------------------------------")
    DebugText("(Server) Info: "..jsonTable.DEV_ID)
    DebugText("(Client) Info: "..hardwareid_auth)
    DebugText("-----------------------------------------------------")

    if jsonTable.STATUS == uppercaseString and jsonTable.DEV_ID == hardwareid_auth then
        DebugText("----- Key is Authenticated -----")
        if getgenv().CompatibleMode then            
            return true
        else
            
            return true, PremiumKeyStatus(jsonTable.isPremium), "authenticated"
        end
    else
        DebugText("----- Key is Not Authenticated -----")
        PandaLibNotification("Unable to Validate the Key, See for Developer Console") 
        if getgenv().CompatibleMode then 
            return false
        else  
            return false, PremiumKeyStatus(jsonTable.isPremium), "not_authenticated"
        end
    end
end


return PandaAuth
