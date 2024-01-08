-- [[]
--=====================================================================
-- Panda-Beta-Library
--=====================================================================
-- Original Developers: Skie & Encrypted (PandaAuth Developers)
-- Rewritten By: Mr. Lolegic (With Minor Security Improvements)
--=====================================================================

-- Definition format
--  - Locals    | camelCase
--  - Globals   | PascalCase
--  - Func Args | PascalCase

--- We define the PandaAuth module and set its metatable
local PandaAuth = setmetatable(
    {},
    { -- Metatables
        __index = function(self, key)
            return rawget(self, key)
        end,
        __metatable = false
    }
)


-- Roblox Lua Services
local http_service = cloneref(game:GetService("HttpService"))
local rbx_analytics_service = cloneref(game:GetService("RbxAnalyticsService"))
local starter_gui_service = cloneref(game:GetService("StarterGui"))
local players_service = cloneref(game:GetService("Players"))
local Server = "https://auth.pandadevelopment.net"

--- This is just for debugging purposes so people can basically power it off and on
--- @param msg string Basically the message to output
--- @param type string The type e.i. Warn, Print, Error
local function debug(msg, type)
    if getgenv().Debugging == true then
        if type == "warn" then
            getfenv()["warn"](msg)
        elseif type == "print" then
            getfenv()["print"](msg)
        elseif type == "error" then
            getfenv()["error"](msg, 2)
        end
    elseif getgenv().Debugging == nil then
        warn("You never defined the debugging setting.")
    end
end

--- We're encrypting a string using XOR
--- @param  Key  string   The key used in the encryption (Needed for decryption)
--- @param  Data string   The data which gets encrypted and decrypted
--- @return string result The encrypted result (Needed for decryption ofc)
function PandaAuth:Encrypt(plainText, shift)
    local encrypted = {}

    for i = 1, #plainText do
        local char = plainText:byte(i)

        if char >= 65 and char <= 90 then
            char = (char - 65 + shift) % 26 + 65
        elseif char >= 97 and char <= 122 then
            char = (char - 97 + shift) % 26 + 97
        end

        encrypted[i] = string.char(char)
    end

    return table.concat(encrypted)
end


local function GetHardwareID(service)
    local jsonData = http_service:JSONDecode(game:HttpGet(Server .. "/serviceapi?service=" .. service .. "&command=getconfig", true))
    local client_id = rbx_analytics_service:GetClientId()

    if jsonData.AuthMode == "playerid" then
        return _tostring(players_service.LocalPlayer.UserId) .."_MOBILE"
    elseif jsonData.AuthMode == "hwidplayer" then
        local hashedata = _tostring(game:HttpGet(Server.."/serviceapi?service="..service.."&command=Hashed&param=".. players_service.LocalPlayer.UserId..client_id, true))
        return hashedata
    elseif jsonData.AuthMode == "hwidonly" then
        return client_id
    elseif jsonData.AuthMode == "iponly" then       
        return jsonData.IPToken
    else
        return players_service.LocalPlayer.UserId
    end
end

--- We use this functiont to basically generate a link which gets the users key
--- @return string
function PandaAuth:GetLink(Service)
    return tostring(Server .. "/getkey?service=" .. Service .. "&hwid=" .. GetHardwareID(Service))
end

--- Panda-Pelican's Serverside ( Validation Decryption ), Decrypt the Serverside Data on Clientside
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

local function calculateSHA256(input) 
    -- Make a request to an external API that calculates SHA256
    local response = http_service:RequestAsync({
        Url = "https://api.pwnedpasswords.com/range/" .. http_service:SHA256(input):sub(1, 5),
        Method = "GET",
    })
    -- Check if the request was successful
    if response.Success then
        -- Extract the SHA256 hash from the response
        local sha256Hash = http_service:SHA256(input):upper()
        return sha256Hash
    else
        warn("Error calculating SHA256 hash:", response.StatusMessage)
        return nil
    end
end
--- This is our validate function which we use for obviously validating the key and service
--- @param Service string
--- @param Key string
--- @return string encrypted_key
function PandaAuth:ValidateKey(Service, Key)
    local Response = game:HttpGet(Server .. "/validate?service=" .. Service .. "&key=" .. Key .. "&hwid=" .. GetHardwareID(Service), false, {
        ["User-Agent"] = "Mobile-Auth-Client/1.0"
    })

    local Data = game:GetService("HttpService"):JSONDecode(vigenereDecrypt(Response, "PANDA_DEVELOPMENT"))

    local AuthMasterStatus = calculateSHA256("authenticated") -- Hashed the Word to SHA256 ( why? idk )
    local hardwareid_auth = calculateSHA256(GetHardwareID(Service))
    
    if jsonTable.STATUS == AuthMasterStatus and jsonTable.DEV_ID == hardwareid_auth then
        debug("--> Successfully Authenticated <--", "print")
        local key = "Mr. Lolegic"
        return encrypt(Service, key)
    else
        debug("--! Failed to Authenticate !--", "warn")
        return false
    end
end

--- This will save the users current key
--- @param Filename string
--- @param Key string
function PandaAuth:SaveKey(Filename, Key)
    writefile(Filename, Key)

    game.StarterGui:SetCore("SendNotification", {
        Title = "PandaAuth",
        Text = "Saving Key!",
        Duration = 1,
        Icon = "rbxassetid://14317130710"
    })
end

--- This will load the users key from a file
--- @param Filename string
--- @return string users_key
function PandaAuth:LoadKey(Filename)
    return readfile(Filename)
end

--- This basically just lets us know when the key expires
--- @param Service string
--- @param Key string
--- @return string expiresAt
function PandaAuth:Time_Expiration(Service, Key)
    local serverCmd = game:HttpGet(Server .. "/validate?service=" .. Service .. "&hwid=" .. GetHardwareID(Exploit) .. "&key=" .. Key)
    local jsonData = game.HttpService:JSONDecode(serverCmd)
    return tostring(jsonData.expiresAt)
end

return PandaAuth

 --]]

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
        Url = "https://pandadevelopment.net/failsafeValidation?service=" .. Service_ID .. "&hwid=" ..game:GetService("Players").LocalPlayer.UserId .. "&key="..ClientKey,
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