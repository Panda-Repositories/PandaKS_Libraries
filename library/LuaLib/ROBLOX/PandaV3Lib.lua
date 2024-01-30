local PandaAuth = (function()


    local service = setmetatable({}, {
        __index = function(self, key)
            return cloneref(game.GetService(game, key))
        end
    })
    
    
    
    local LibVersion = "Panda V3_ClassA"
    
    local c_request  = clonefunction(request)
    
    local HttpService = cloneref(service.HttpService)
    local RbxAnalyticsService = cloneref(service.RbxAnalyticsService)
    local StarterGui = cloneref(service.StarterGui)
    local Players = cloneref(service.Players)
    
    local Host = "https://pandadevelopment.net"
    local AuthHost = "https://auth.pandadevelopment.net"
    
    local LocalPlayer = Players.LocalPlayer
    
    local Internal = {}
    
    local PandaAuth = {["Version"] = LibVersion}
    local Identity = {}
    local Crypt = {}
    local Time = {}
    
    
    
    function Identity.GetID(self)
        local JSONData = HttpService:JSONDecode(game:HttpGet(AuthHost .. "/serviceapi?service=" .. Internal.Service .. "&command=getconfig"))
        local client_id = RbxAnalyticsService:GetClientId()
        
        if JSONData and JSONData.AuthMode then
            if JSONData.AuthMode:lower() == "playerid" then
                return tostring(LocalPlayer.UserId)
            elseif JSONData.AuthMode:lower() == "hwidplayer" then
                return client_id --.. tostring(LocalPlayer.UserId)
            elseif JSONData.AuthMode:lower() == "hwidonly" then
                return client_id
            else
                return tostring(LocalPlayer.UserId)
            end
        end
    end
    
    
    
    function Crypt.EncryptC(self, PlainText, Key)
        PlainText = string.upper(PlainText)
        Key = string.upper(Key)
        
        local EncryptedText = ""
        
        for i = 1, #PlainText do
            local char = string.byte(PlainText, i)
            
            if char >= 65 and char <= 90 then
                EncryptedText = EncryptedText .. string.char(
                    ((char + Key:byte(i % #Key + 1) - 2 * 65) % 26) + 65
                )
            else
                EncryptedText = EncryptedText .. string.char(char)
            end
        end
        
        return EncryptedText
    end
    
    function Crypt.Bitxor(self, a, b)
        local Xor_result = 0
        local Bitval = 1
        print("Bitxor >", a, b)
        while a > 0 or b > 0 do
            local a_bit = a % 2
            local b_bit = b % 2
            if a_bit ~= b_bit then
                Xor_result = Xor_result + Bitval
            end
            Bitval = Bitval * 2
            a = math.floor(a / 2)
            b = math.floor(b / 2)
        end
        return Xor_result
    end
    
    function Crypt.XorDecrypt(self, Encrypted, Key)
        local Decrypted = ''
        print("XorDecrypt >", "Encrypted:", Encrypted, "Key:", Key)
        for i = 1, string.len(Encrypted) do
            Decrypted = Decrypted .. string.char(
                self:Bitxor(
                    string.byte(Encrypted, i), string.byte(Key, (i - 1) % #Key + 1)
                )
            )
            print(i, "Decrypted:", Decrypted)
        end
        return Decrypted
    end
    
    
    
    local GivenDate = "2027-01-21T00:00:00.000Z"
    function Time.CompareDate(self, givenDateStr)
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
    
    
    
    function PandaAuth.Set(self, Settings)
        Internal.Service  = string.lower(Settings.Service) or error("Please make sure to set your service.")
        Internal.APIToken = Settings.APIToken or error("Please make sure to set APIToken")
        Internal.TrueEndpoint = Settings.TrueEndpoint and string.lower(Settings.TrueEndpoint) or "true"
        Internal.FalseEndpoint = Settings.FalseEndpoint and string.lower(Settings.FalseEndpoint) or "false"
        Internal.Debug = Settings.Debug or false
        
        if Internal.Debug == true then
            warn("=======================================")
            warn("Welcome to PandaAuth Development!")
            warn("Library Version:", (LibVersion or "Unknown"))
            warn("Utility:", tostring(identifyexecutor()))
            warn("=======================================")
        end
    end
    
    function PandaAuth.Get(self)
        return {PandaAuth = PandaAuth, Internal = Internal, Identity = Identity, Crypt = Crypt, Time = Time}
    end
    
    function PandaAuth.Debug(self, ...)
        if Internal.Debug then
            warn("[DEBUG]", ...)
        end
    end
    
    function PandaAuth.SHA256(self, Str)
        local Hashed = game:HttpGet(AuthHost ..  "/serviceapi?service=" .. Internal.Service .. "&command=hashed&param=" .. Str)
        
        if Hashed then
            PandaAuth:Debug("Successfully hashed the data to:", string.upper(Hashed))
            return string.upper(Hashed)
        else
            return PandaAuth:Debug("Couldn't hash the data")
        end
    end
    
    local iter = 0
    
    function PandaAuth.ValidateKey(self, Key)
        local Url = AuthHost .. "/failsafeValidation?service=" .. Internal.Service .. "&hwid=" .. Identity:GetID() .. "&key=" .. Key
        local response = request({
            Url = Url;
            Method = "GET";
        })
        PandaAuth:Debug("Response Status Code:", response.StatusCode)
        if response.StatusCode == 200 then
            PandaAuth:Debug("Body: ".. response.Body)
            -- Instead of fucking finding a string true... why do this
            local success, data = pcall(function()
                return HttpService:JSONDecode(response.Body)
            end)
            print("Status: "..data["status"])
            if success and data["status"] == "success" then
                return Internal.TrueEndpoint
            end
            return Internal.FalseEndpoint
        elseif response.StatusCode == 406 then
            -- Especific Hardware / IP Address got Banned
            return Internal.FalseEndpoint
        elseif response.StatusCode == 403 then
            -- Especific Hardware / IP Address got Banned
            return Internal.FalseEndpoint
        elseif response.StatusCode == 204 then
            -- Invalid Key 
            return Internal.FalseEndpoint
        elseif response.StatusCode == 429 then
            -- Rate Limiter kicked ( Cloudflare limits for 10seconds. )
            return Internal.FalseEndpoint
        end
    
    end
    
    function PandaAuth.ResetHWID(self, Key)
        local success, result = pcall(function()
            return HttpService:JSONDecode(request({Url = Host .. "/serviceapi/edit/hwid/?service=" .. Internal.Service.."&key=" .. Key .. "&newhwid=" .. Identity:GetID(), Method = "POST"}).Body)
        end)
        
        if success then
            PandaAuth:Debug("\xE2\x9C\x85 - Successfully reinitialised your HWID !")
            
            return true
        else
            PandaAuth:Debug("\xE2\x9D\x8C - Something went wront while reinitialising your HWID !")
            
            for i, v in pairs(result) do
                PandaAuth:Debug("Data : " .. i, v)
            end
            
            return false
        end
    end 
    
    function PandaAuth.GetKey(self)
        local Url = AuthHost .. "/getkey?service=" .. Internal.Service .. "&hwid=" .. Identity:GetID();
        PandaAuth:Debug("\xE2\x9C\x85 - Generated link successfully:", Url)
        return Url
    end
    
    
    
    do
        setmetatable(PandaAuth,
            {
                __index = function(self, key)
                    return rawget(self, key)
                end,
                __newindex = function(self,key,value)
                    error("Don't try to modify \xF0\x9F\x92\x80", 2)
                end,
                __metatable = "This metatable is protected."
            }
        )
    end
    
    
    
    return PandaAuth
    end)()
    
