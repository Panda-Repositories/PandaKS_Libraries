--[[
PandaAuth authentification library version : 4.0.0
ETA : Under Development
Developer: Sponsoparnordvpn
--]]

if islclosure(getgenv().request or syn.request) then while true do end end -- ANTI REQUEST TAMPERING
if islclosure(getgenv().tostring) then while true do end end -- ANTI TOSTRING TAMPERING
if islclosure(getgenv().setmetatable) then while true do end end -- ANTI SETMETATALBE TAMPERING
if islclosure(getgenv().hookfunc) then while true do end end -- ANTI Hookfunc TAMPERING
if islclosure(getgenv().hookfunction) then while true do end end -- ANTI Hookfunction TAMPERING




local PandaAuth = setmetatable(

    {},

    {

        __index = function(self, key)

            return rawget(self, key)

        end,

        __metatable = false

    }

)
getgenv().LibVersion = "Panda AAL"
local req  = clonefunction(request)
function PandaAuth:Set(Settings)
     setreadonly(PandaAuth, false, "panda_readonly")
     PandaAuth.Service  = Settings.Service or "pandadevkit"
     PandaAuth.TrueEndpoint = string.lower(Settings.TrueEndpoint) or "true"
     PandaAuth.FalseEndpoint = string.lower(Settings.FalseEndpoint) or "false"
     getgenv().Debug = Settings.Debug or false
     PandaAuth.ViginereKey = Settings.ViginereKey
     Settings.TrueEndpoint = string.lower(Settings.TrueEndpoint) 
     Settings.FalseEndpoint = string.lower(Settings.FalseEndpoint)
    warn("=======================================")
    warn("Welcome to PandaAuth Development!")
    warn("Library Version: " .. (getgenv().LibVersion or "unknown"))
    warn("Utility : " .. tostring(identifyexecutor()))
    warn("=======================================")
    setreadonly(PandaAuth,true, "panda_readonly")
    return Settings 
end

---- Important ----
local http_service = cloneref(game:GetService("HttpService"))

local rbx_analytics_service = cloneref(game:GetService("RbxAnalyticsService"))

local starter_gui_service = cloneref(game:GetService("StarterGui"))

local players_service = cloneref(game:GetService("Players"))

local Server = "https://auth.pandadevelopment.net"
---- Local functions -----




local function GetHardwareID(Service)
    local jsonData = http_service:JSONDecode(game:HttpGet(Server .. "/serviceapi?service=" .. PandaAuth.Service .. "&command=getconfig"))
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
    local hashed = game.HttpGet(Server ..  "/serviceapi?service=" .. PandaAuth.Service .. "&command=hashed&param="..stringbrub)
    

    if hashed then
    PandaAuth:Debug("Successfully hashed the data : "..stringbrub.." to : "..string.upper(hashed))
        return string.upper(hashed)
    else
    PandaAuth:Debug("Couldn't hash the data : "..stringbrub)
        return nil
    end
end


function PandaAuth:Encrypt(plainText, key)
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









function PandaAuth:Decrypt(encryptedText, key)
    encryptedText = string.upper(encryptedText)
    key = string.upper(key)

    local decryptedText = ""

    for i = 1, #encryptedText do
        local char = string.byte(encryptedText, i)

        if char >= 65 and char <= 90 then
            decryptedText = decryptedText .. string.char(
                ((char - key:byte(i % #key + 1) + 26) % 26) + 65
            )
        else
            decryptedText = decryptedText .. string.char(char)
        end
    end

    return decryptedText
end


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


---- Module functions -----
local function RandomString(length)
    local randomString = ""
    for i = 1, length do
        local randomNumber = math.random(97, 122)
        randomString = randomString .. string.char(randomNumber)
    end
    return tostring(randomString)
end

function FakeRequests()
    local fakeUrls = {
        "https://auth.pandadevelopment.net/api/validate_key?service=" .. PandaAuth.Service .. "&key=" .. RandomString(8),
        "https://auth.pandadevelopment.net/service/check?service=" .. PandaAuth.Service .. "&key=" .. RandomString(8),
        "https://auth.pandadevelopment.net/panda/api/validate?service=" .. PandaAuth.Service .. "&key=" .. RandomString(8),
        "https://auth.pandadevelopment.net/pandadev/keycheck?service=" .. PandaAuth.Service .. "&key=" .. RandomString(8),
        "https://auth.pandadevelopment.net/api/check_status?service=" .. PandaAuth.Service .. "&key=" .. RandomString(8),
        "https://auth.pandadevelopment.net/service/verify_key?service=" .. PandaAuth.Service .. "&key=" .. RandomString(8),
        "https://auth.pandadevelopment.net/devkit/authenticate?service=" .. PandaAuth.Service .. "&key=" .. RandomString(8),
        "https://auth.pandadevelopment.net/panda/auth/validate?service=" .. PandaAuth.Service .. "&key=" .. RandomString(8),
        "https://auth.pandadevelopment.net/api/key_status?service=" .. PandaAuth.Service .. "&key=" .. RandomString(8),
        "https://auth.pandadevelopment.net/pandakit/validate?service=" .. PandaAuth.Service .. "&key=" .. RandomString(8),
        "https://auth.pandadevelopment.net/checker/auth?service=" .. PandaAuth.Service .. "&key=" .. RandomString(8),
        "https://auth.pandadevelopment.net/verify/panda?service=" .. PandaAuth.Service .. "&key=" .. RandomString(8),
        "https://auth.pandadevelopment.net/pandadev/verify_key?service=" .. PandaAuth.Service .. "&key=" .. RandomString(8),
        "https://auth.pandadevelopment.net/api/validate_token?service=" .. PandaAuth.Service .. "&key=" .. RandomString(8),
        "https://auth.pandadevelopment.net/service/token_check?service=" .. PandaAuth.Service .. "&key=" .. RandomString(8),
        "https://auth.pandadevelopment.net/panda/auth/token_validate?service=" .. PandaAuth.Service .. "&key=" .. RandomString(8),
        "https://auth.pandadevelopment.net/pandadev/token_check?service=" .. PandaAuth.Service .. "&key=" .. RandomString(8),
        "https://auth.pandadevelopment.net/api/token_status?service=" .. PandaAuth.Service .. "&key=" .. RandomString(8),
        "https://auth.pandadevelopment.net/pandakit/token_validate?service=" .. PandaAuth.Service .. "&key=" .. RandomString(8),
        "https://auth.pandadevelopment.net/checker/token_auth?service=" .. PandaAuth.Service .. "&key=" .. RandomString(8),
    }

    local url = fakeUrls[math.random(1, #fakeUrls)]
    local response = req({
        Url = url,
        Method = "GET"
    })

    if not response.Body:find("The page you are looking for does not exist") then
        error("\xE2\x9D\x8C - Please don't try to bypass server-side")
        game.Players.LocalPlayer:Kick("An unexpected error occurred")
        wait(2)
        while true do
        end
    end

    local new_bypass = req({
        Url = "https://auth.pandadevelopment.net/validate?service=" .. PandaAuth.Service .. "&hwid=" .. GetHardwareID() .. "&key=" .. RandomString(8),
        Method = "GET"
    })

    local decryptedText = xorDecrypt(new_bypass.Body, "PANDA_DEVELOPMENT")
    local success, data = pcall(function()
        return http_service:JSONDecode(decryptedText)
    end)

    if data["success"] == "Authorized_" .. PandaAuth.Service then
        error("\xE2\x9D\x8C - Please don't try to bypass server-side")
        game.Players.LocalPlayer:Kick("An unexpected error occurred")
        wait(2)
        while true do
        end
    end
end



function PandaAuth:ValidateKey(key)
FakeRequests()
    local response = req({
        Url = "https://auth.pandadevelopment.net/validate?service="..PandaAuth.Service.."&hwid="..GetHardwareID().."&key="..key,
        Method = "GET"
    })
    
    local success, data = pcall(function()
    local decryptedText = xorDecrypt(response.Body, "PANDA_DEVELOPMENT")
        return http_service:JSONDecode(decryptedText)
        
    end)
    PandaAuth:Debug("Response Status Code : "..response.StatusCode)
    if response.StatusCode == 200 and success then
        

        if data["service"] ~= PandaAuth.Service then
            PandaAuth:Debug("\xE2\x9D\x8C - Service Mismatch")
            local hashed = PandaAuth:SHA256(PandaAuth.FalseEndpoint)
            local new = PandaAuth:Encrypt(hashed,PandaAuth.ViginereKey)
            return new
        end
        
        if data["success"] == "Authorized_"..PandaAuth.Service then
            PandaAuth:Debug("\xE2\x9C\x85 - Successfully validated your key!")
            local hashed = string.upper(PandaAuth:SHA256(PandaAuth.TrueEndpoint))
            
            local new = PandaAuth:Encrypt(hashed,PandaAuth.ViginereKey)
            return new
        end
    else
        if response.StatusCode == 401 then
            PandaAuth:Debug("\xE2\x9D\x8C - Key is not valid!")
            local hashed = PandaAuth:SHA256(PandaAuth.FalseEndpoint)
            local new = PandaAuth:Encrypt(hashed,PandaAuth.ViginereKey)
            return new
        elseif response.StatusCode == 404 then
            PandaAuth:Debug("\xE2\x9D\x8C - Could not find the server")
            local hashed = PandaAuth:SHA256(PandaAuth.FalseEndpoint)
            local new = PandaAuth:Encrypt(hashed,PandaAuth.ViginereKey)
            return new
        elseif response.StatusCode == 406 then
            PandaAuth:Debug("\xF0\x9F\x94\xA8 - User Account banned")
            local hashed = PandaAuth:SHA256(PandaAuth.FalseEndpoint)
            local new = PandaAuth:Encrypt(hashed,PandaAuth.ViginereKey)
            return new
        else
            PandaAuth:Debug("\xE2\x9A\xA0\ - Unknown response, please contact us")
            local hashed = PandaAuth:SHA256(PandaAuth.FalseEndpoint)
            local new = PandaAuth:Encrypt(hashed,PandaAuth.ViginereKey)
            return new
        end
    end
end


pcall(game.HttpGet, game, getgenv().setmetatable({}, {
    __tostring = function()
        while true do end;return "HAHAHAHAHAHA"
    end,
}))

req(getgenv().setmetatable({
    Url = "https://example.net",
	Method = "GET"
},{
    __newindex = function(self,key,value)
        return rawset(self,key,setmetatable({},{
            __tostring = function()
                while true do end;return "HAHAHAHAHAHA"
            end
        }))
    end,
    __tostring = function()
        while true do end;return "HAHAHAHAHAHA"
    end,
    __len = function()
        while true do end;
    end,
    __concat = function()
        spawn(function()
            game:Shutdown()
        end)
        while true do end;
    end,
}))


local antisetreadonly
antisetreadonly = hookfunction(getgenv().setreadonly,function(x,y, z)
if z and z == "panda_readonly" then
        return antisetreadonly(x, y, z)
    else
        return antisetreadonly(x, true)
    end
end)
setreadonly(PandaAuth,true)
return PandaAuth