--[[
PandaAuth authentification library version : 4.0.0
ETA : Under Development
Developer: Sponsoparnordvpn
--]]





local PandaAuth = {} 
getgenv().LibVersion = "Panda AAL"
local req  = clonefunction(request)
local Internal= {}
function PandaAuth:Set(Settings)
     Internal.Service  = string.lower(Settings.Service) or game.Players.LocalPlayer:Kick("Please make sure to set your service ! ")
     Internal.APIToken = Settings.APIToken or game.Players.LocalPlayer:Kick("Please make sure to set APIToken")
     Internal.TrueEndpoint = string.lower(Settings.TrueEndpoint) or "true"
     Internal.FalseEndpoint = string.lower(Settings.FalseEndpoint) or "false"
     getgenv().Debug = Settings.Debug or false
     Internal.ViginereKey = Settings.ViginereKey
    warn("=======================================")
    warn("Welcome to PandaAuth Development!")
    warn("Library Version: " .. (getgenv().LibVersion or "unknown"))
    warn("Utility : " .. tostring(identifyexecutor()))
    warn("=======================================")
end

local http_service = cloneref(game:GetService("HttpService"))

local rbx_analytics_service = cloneref(game:GetService("RbxAnalyticsService"))

local starter_gui_service = cloneref(game:GetService("StarterGui"))

local players_service = cloneref(game:GetService("Players"))

local Server = "https://auth.pandadevelopment.net"

local function GetHardwareID()
    local jsonData = http_service:JSONDecode(game:HttpGet(Server .. "/serviceapi?service=" .. Internal.Service .. "&command=getconfig"))
    local client_id = rbx_analytics_service:GetClientId()

    if jsonData.AuthMode == "playerid" then
        return tostring(players_service.LocalPlayer.UserId)
    elseif jsonData.AuthMode == "hwidplayer" then
        return client_id
    elseif jsonData.AuthMode == "hwidonly" then
        return client_id
    else
        return tostring(players_service.LocalPlayer.UserId)
    end
end

function PandaAuth:Debug(message)
if getgenv().Debug then
warn("[DEBUG] "..tostring(message))
end
end

function PandaAuth:SHA256(stringbrub)
    local hashed = game.HttpGet(Server ..  "/serviceapi?service=" .. Internal.Service .. "&command=hashed&param="..stringbrub)
    

    if hashed then
    PandaAuth:Debug("Successfully hashed the data to : "..string.upper(hashed))
        return string.upper(hashed)
    else
    PandaAuth:Debug("Couldn't hash the data ")
        return nil
    end
end

function encryptC(plainText, key)
    plainText = string.upper(plainText)
    key = string.upper(key)

    local encryptedText = ""

    for i = 1, #plainText do
        local char = string.byte(plainText, i)

        if char >= 65 and char <= 90 then
            encryptedText = encryptedText .. string.char(
                ((char + key:byte(i % #key + 1) - 2 * 65) % 26) + 65
            )
        else
            encryptedText = encryptedText .. string.char(char)
        end
    end

    return encryptedText
end
function CompareDate(givenDateStr)
    local givenYear, givenMonth, givenDay, givenHour, givenMin, givenSec =
        givenDateStr:match("(%d+)-(%d+)-(%d+)T(%d+):(%d+):(%d+).%d+Z")

    givenYear, givenMonth, givenDay, givenHour, givenMin, givenSec =
        tonumber(givenYear), tonumber(givenMonth), tonumber(givenDay),
        tonumber(givenHour), tonumber(givenMin), tonumber(givenSec)

    local currentYear, currentMonth, currentDay, currentHour, currentMin, currentSec =
        os.date("!%Y,%m,%d,%H,%M,%S"):match("(%d+),(%d+),(%d+),(%d+),(%d+),(%d+)")

    currentYear, currentMonth, currentDay, currentHour, currentMin, currentSec =
        tonumber(currentYear), tonumber(currentMonth), tonumber(currentDay),
        tonumber(currentHour), tonumber(currentMin), tonumber(currentSec)

    local isToday = givenYear == currentYear and givenMonth == currentMonth and givenDay == currentDay

    if isToday then
        return true
    elseif givenYear < currentYear or
        (givenYear == currentYear and (givenMonth < currentMonth or
                                       (givenMonth == currentMonth and (givenDay < currentDay or
                                                                      (givenDay == currentDay and
                                                                       (givenHour < currentHour or
                                                                        (givenHour == currentHour and
                                                                         (givenMin < currentMin or
                                                                          (givenMin == currentMin and
                                                                           givenSec < currentSec))))))))) then
        return false
    else
        return true
    end
end


local givenDateStr = "2027-01-21T00:00:00.000Z"
CompareDate(givenDateStr)

function bitxor(a, b)
    local xor_result = 0
    local bitval = 1
    while a > 0 or b > 0 do
        local a_bit = a % 2
        local b_bit = b % 2
        if a_bit ~= b_bit then
            xor_result = xor_result + bitval
        end
        bitval = bitval * 2
        a = math.floor(a / 2)
        b = math.floor(b / 2)
    end
    return xor_result
end

function xorDecrypt(encrypted, key)
    local decrypted = ''
    for i = 1, #encrypted do
        decrypted = decrypted .. string.char(bitxor(string.byte(encrypted, i), string.byte(key, (i - 1) % #key + 1)))
    end
    return decrypted
end

function PandaAuth:ValidateKey(key)
    local response = req({
        Url = "https://auth.pandadevelopment.net/validate?service="..Internal.Service.."&hwid="..GetHardwareID().."&key="..key,
        Method = "GET"
    })
    
    local success, data = pcall(function()
    local decryptedText = xorDecrypt(response.Body, Internal.APIToken)
        return http_service:JSONDecode(decryptedText)
    end)
    PandaAuth:Debug("Response Status Code : "..response.StatusCode)
    if response.StatusCode == 200 and success then
        if data["service"] ~= Internal.Service then
            PandaAuth:Debug("\xE2\x9D\x8C - Service Mismatch !")
            local hashed = PandaAuth:SHA256(Internal.FalseEndpoint)
            local new = encryptC(hashed,Internal.ViginereKey)
            return new
        end
        local time = data["expiresAt"]
        if data["success"] == "Authorized_"..Internal.Service and CompareDate(time) then
            PandaAuth:Debug("\xE2\x9C\x85 - Successfully validated your key !")
            local hashed = string.upper(PandaAuth:SHA256(Internal.TrueEndpoint))
            
            local new = encryptC(hashed,Internal.ViginereKey)
            return new
        end
    else
        if response.StatusCode == 401 then
            PandaAuth:Debug("\xE2\x9D\x8C - Your key is not valid !")
            local hashed = PandaAuth:SHA256(Internal.FalseEndpoint)
            local new = encryptC(hashed,Internal.ViginereKey)
            return new
        elseif response.StatusCode == 404 then
            PandaAuth:Debug("\xE2\x9D\x8C - Could not find the server !")
            local hashed = PandaAuth:SHA256(Internal.FalseEndpoint)
            local new = encryptC(hashed,Internal.ViginereKey)
            return new
        elseif response.StatusCode == 406 then
            PandaAuth:Debug("\xF0\x9F\x94\xA8 - User Account banned !")
            local hashed = PandaAuth:SHA256(Internal.FalseEndpoint)
            local new = encryptC(hashed,Internal.ViginereKey)
            return new
         elseif not success then
            PandaAuth:Debug("\xE2\x9D\x8C - Could not decrypt the server data !")
            local hashed = PandaAuth:SHA256(Internal.FalseEndpoint)
            local new = encryptC(hashed,Internal.ViginereKey)
            return new
        else
            PandaAuth:Debug("\xE2\x9A\xA0\ - Unknown response, please contact us !")
            local hashed = PandaAuth:SHA256(Internal.FalseEndpoint)
            local new = encryptC(hashed,Internal.ViginereKey)
            return new
        end
    end
end

function PandaAuth:ValidatePremiumKey(key)
    local response = req({
        Url = "https://auth.pandadevelopment.net/validate?service="..Internal.Service.."&hwid="..GetHardwareID().."&key="..key,
        Method = "GET"
    })
    
    local success, data = pcall(function()
    local decryptedText = xorDecrypt(response.Body, Internal.APIToken)
        return http_service:JSONDecode(decryptedText)
    end)
    PandaAuth:Debug("Response Status Code : "..response.StatusCode)
    if response.StatusCode == 200 and success then
        if data["service"] ~= Internal.Service then
            PandaAuth:Debug("\xE2\x9D\x8C - Service Mismatch !")
            local hashed = PandaAuth:SHA256(Internal.FalseEndpoint)
            local new = encryptC(hashed,Internal.ViginereKey)
            return new
        end
        local time = data["expiresAt"]
        if data["success"] == "Authorized_"..Internal.Service and CompareDate(time) then
        if data["isPremium"] == true then
            PandaAuth:Debug("\xE2\x9C\x85 - Successfully validated your premium key !")
            local hashed = string.upper(PandaAuth:SHA256(Internal.TrueEndpoint))
            
            local new = encryptC(hashed,Internal.ViginereKey)
            return new
         else
           PandaAuth:Debug("\xE2\x9D\x8C - Your key is non-premium !")
            local hashed = string.upper(PandaAuth:SHA256(Internal.FalseEndpoint))
            
            local new = encryptC(hashed,Internal.ViginereKey)
            return new
            end
        end
    else
        if response.StatusCode == 401 then
            PandaAuth:Debug("\xE2\x9D\x8C - Key is not valid!")
            local hashed = PandaAuth:SHA256(Internal.FalseEndpoint)
            local new = encryptC(hashed,Internal.ViginereKey)
            return new
        elseif response.StatusCode == 404 then
            PandaAuth:Debug("\xE2\x9D\x8C - 404 , Server not found !")
            local hashed = PandaAuth:SHA256(Internal.FalseEndpoint)
            local new = encryptC(hashed,Internal.ViginereKey)
            return new
        elseif response.StatusCode == 406 then
            PandaAuth:Debug("\xF0\x9F\x94\xA8 - User Account banned !")
            local hashed = PandaAuth:SHA256(Internal.FalseEndpoint)
            local new = encryptC(hashed,Internal.ViginereKey)
            return new
         elseif not success then
            PandaAuth:Debug("\xE2\x9D\x8C - Could not decrypt the server data !")
            local hashed = PandaAuth:SHA256(Internal.FalseEndpoint)
            local new = encryptC(hashed,Internal.ViginereKey)
            return new
        else
            PandaAuth:Debug("\xE2\x9A\xA0\ - Unknown response, please contact us !")
            local hashed = PandaAuth:SHA256(Internal.FalseEndpoint)
            local new = encryptC(hashed,Internal.ViginereKey)
            return new
        end
    end
end

function PandaAuth:ValidateNormalKey(key)
    local response = req({
        Url = "https://auth.pandadevelopment.net/validate?service="..Internal.Service.."&hwid="..GetHardwareID().."&key="..key,
        Method = "GET"
    })
    
    local success, data = pcall(function()
    local decryptedText = xorDecrypt(response.Body, Internal.APIToken)
        return http_service:JSONDecode(decryptedText)
    end)
    PandaAuth:Debug("Response Status Code : "..response.StatusCode)
    if response.StatusCode == 200 and success then
        if data["service"] ~= Internal.Service then
            PandaAuth:Debug("\xE2\x9D\x8C - Service Mismatch !")
            local hashed = PandaAuth:SHA256(Internal.FalseEndpoint)
            local new = encryptC(hashed,Internal.ViginereKey)
            return new
        end
        local time = data["expiresAt"]
        if data["success"] == "Authorized_"..Internal.Service and CompareDate(time) then
        if data["isPremium"] == false then
            PandaAuth:Debug("\xE2\x9C\x85 - Successfully validated your non-premium key !")
            local hashed = string.upper(PandaAuth:SHA256(Internal.TrueEndpoint))
            
            local new = encryptC(hashed,Internal.ViginereKey)
            return new
         else
           PandaAuth:Debug("\xE2\x9D\x8C - Your key is not non-premium !")
            local hashed = string.upper(PandaAuth:SHA256(Internal.FalseEndpoint))
            
            local new = encryptC(hashed,Internal.ViginereKey)
            return new
            end
        end
    else
        if response.StatusCode == 401 then
            PandaAuth:Debug("\xE2\x9D\x8C - Your key is not valid !")
            local hashed = PandaAuth:SHA256(Internal.FalseEndpoint)
            local new = encryptC(hashed,Internal.ViginereKey)
            return new
        elseif response.StatusCode == 404 then
            PandaAuth:Debug("\xE2\x9D\x8C - Could not find the server !")
            local hashed = PandaAuth:SHA256(Internal.FalseEndpoint)
            local new = encryptC(hashed,Internal.ViginereKey)
            return new
        elseif response.StatusCode == 406 then
            PandaAuth:Debug("\xF0\x9F\x94\xA8 - User Account banned !")
            local hashed = PandaAuth:SHA256(Internal.FalseEndpoint)
            local new = encryptC(hashed,Internal.ViginereKey)
            return new
         elseif not success then
            PandaAuth:Debug("\xE2\x9D\x8C - Could not decrypt the server data !")
            local hashed = PandaAuth:SHA256(Internal.FalseEndpoint)
            local new = encryptC(hashed,Internal.ViginereKey)
            return new
        else
            PandaAuth:Debug("\xE2\x9A\xA0\ - Unknown response, please contact us !")
            local hashed = PandaAuth:SHA256(Internal.FalseEndpoint)
            local new = encryptC(hashed,Internal.ViginereKey)
            return new
        end
    end
end

function PandaAuth:ResetHWID(key)
   local success, data = pcall(function()
   return http_service:JSONDecode(request({Url = "https://pandadevelopment.net/serviceapi/edit/hwid/?service="..Internal.Service.."&key=" .. key .. "&newhwid=" .. GetHardwareID(), Method = "POST"}).Body)
   end)
   if success then
   PandaAuth:Debug("\xE2\x9C\x85 - Successfully reinitialised your HWID !")
   return true
   else
   PandaAuth:Debug("\xE2\x9D\x8C - Something went wront while reinitialising your HWID !")
   for i,v in pairs(data) do
   PandaAuth:Debug("Data : "..i,v)
   end 
   return false
    end
end 

function PandaAuth:GetKey()
    local user_link = Server .. "/getkey?service=" .. Internal.Service .. "&hwid=" .. GetHardwareID();
    PandaAuth:Debug("\xE2\x9C\x85 - Generated link successfully : "..user_link.." !")
    setclipboard(user_link)
    return user_link
end

setmetatable(

    PandaAuth,

    {

        __index = function(self, key)
            return rawget(self, key)
        end,
        __newindex = function(self,key,value)
        error("Don't try to modify \xF0\x9F\x92\x80", 2)
        end,
        __concat = function(self)
        error("Lmfao imagine concatening panda \xF0\x9F\x92\x80",2)
        end,
        __tostring = function(self)
        error("YESSIR baby :skull: \xF0\x9F\x92\x80", 2)
        end,
        __metatable = false

    }

)
return PandaAuth
