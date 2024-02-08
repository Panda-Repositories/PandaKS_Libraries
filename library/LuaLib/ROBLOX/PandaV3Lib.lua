local loadedstring = (function()
    local PandaAuth = (function()
    
    local service = setmetatable({}, {
        __index = function(self, key)
            return cloneref(game.GetService(game, key))
        end
    })
    
    
    
    local LibVersion = "Panda VAL"
    
    local c_request  = clonefunction(request)
    
    local HttpService = cloneref(service.HttpService)
    local RbxAnalyticsService = cloneref(service.RbxAnalyticsService)
    local StarterGui = cloneref(service.StarterGui)
    local Players = cloneref(service.Players)
    
    local Host = "https://pandadevelopment.net"
    local AuthHost = "https://auth.pandadevelopment.net"
    
    local LocalPlayer = Players.LocalPlayer
    
    local CurrentFunc
    local CurrentENV = nil
    
    local Internal = {}
    
    local PandaAuth = {["Version"] = LibVersion}
    local PandaAuthTable = {}
    local Identity = {}
    local Crypt = {}
    local Time = {}
    
    local Debug = "SetInternal\0\0\0"
    
    local GetFunc = "Secure_EQ\0\0\0\0"
    local SetFunc = "Secure_Call\0\0\0\0"
    
    local GetENV = "Match\0\0\0\0"
    local SetENV = "Secure_Crash\0\0\0\0"
    
    local SetInternal = "Debug\0\0\0\0\0\0\0\0"
    local GetInternal = "ReadFile\0\0\0\0\0\0\0\0"
    
    local GetKey = "ValidateKey\0\0"
    local ValidateKey = "GetKey\0\0\0\0\0"
    
    local ResetHWID = "GetLink\0\0"
    
    local SHA256 = "ToggleDebug\0\0\0"
    
    local getfenv = debug.getfenv
    local info = debug.info
    
    local clock = os.clock
    local time = os.time
    
    local random = math.random
    local floor = math.floor
    
    local gsub = string.gsub
    local match = string.match
    local find = string.find
    local byte = string.byte
    local char = string.char
    
    local o_ENV = getfenv()
    
    local o_clonefunction = clonefunction or clonefunc
    local o_cloneref = clonereference or cloneref
    local o_request = request or http_request or http and http.request or syn and syn.request
    local o_getrawmetatable = getrawmetatable
    
    local o_rawset = rawset
    
    local c_clonefunction = clonefunction(clonefunction)
    local c_cloneref = clonefunction(cloneref)
    local c_request = c_clonefunction(request)
    local c_hookfunction = c_clonefunction(hookfunction)
    local c_newcclosure = c_clonefunction(newcclosure)
    
    
    function Identity.GetID(self)
        local success, JSONData = pcall(function()
            return HttpService["JSONDecode" .. ("\0"):rep(random(2, 32)) .. "HttpGet"](HttpService, game["HttpGet" .. ("\0"):rep(random(2, 32)) .. "JSONDecode"](game, AuthHost .. "/serviceapi?service=" .. Internal.Service .. "&command=getconfig"))
        end)
        
        local client_id = RbxAnalyticsService["GetClientId" .. ("\0"):rep(random(2, 32))](RbxAnalyticsService)
        
        if JSONData and JSONData.AuthMode then
            if JSONData.AuthMode:lower() == "playerid" then
                return tostring(LocalPlayer.UserId)
            elseif JSONData.AuthMode:lower() == "hwidplayer" then
                return client_id .. tostring(LocalPlayer.UserId)
            elseif JSONData.AuthMode:lower() == "hwidonly" then
                return client_id
            else
                return tostring(LocalPlayer.UserId)
            end
        elseif not success then
            --PandaAuth[Debug](PandaAuth, "Identity.GetID >", JSONData)
        end
    end
    
    
    
    function Crypt.EncryptC(self, PlainText, Key)
        PlainText = string.upper(PlainText)
        Key = string.upper(Key)
        
        local EncryptedText = ""
        
        for i = 1, #PlainText do
            local Char = byte(PlainText, i)
            
            if Char >= 65 and Char <= 90 then
                EncryptedText = EncryptedText .. char(
                    ((Char + Key:byte(i % #Key + 1) - 2 * 65) % 26) + 65
                )
            else
                EncryptedText = EncryptedText .. char(Char)
            end
        end
        
        return EncryptedText
    end
    
    function Crypt.Bitxor(self, a, b)
        local Xor_result = 0
        local Bitval = 1
        --PandaAuth[Debug](PandaAuth, "Bitxor >", a, b)
        while (a and b) and (a > 0 or b > 0) do
            local a_bit = a % 2
            local b_bit = b % 2
            if a_bit ~= b_bit then
                Xor_result = Xor_result + Bitval
            end
            Bitval = Bitval * 2
            a = floor(a / 2)
            b = floor(b / 2)
            ----PandaAuth[Debug](PandaAuth, "Bitxor > >", a, b)
        end
        return Xor_result
    end
    
    function Crypt.XorDecrypt(self, Encrypted, Key)
        if CurrentENV ~= PandaAuth["Match\0\0\0\0"] or PandaAuth["Match\0\0\0\0"] ~= getfenv(2) or PandaAuth["Secure_EQ\0\0\0\0"] ~= info(2, "f") then print("a1", debug.traceback()) return end
        
        --Encrypted = Encrypted:gsub("%z", "")
        
        local Decrypted = ""
        --PandaAuth[Debug](PandaAuth, "XorDecrypt >", "Encrypted:", Encrypted, "Key:", Key)
        for i = 1, #Encrypted do
            Decrypted = Decrypted .. char(
                self:Bitxor(
                    byte(Encrypted, i),
                    byte(Key,
                        (i - 1) % #Key + 1
                    )
                )
            )
            --PandaAuth[Debug](PandaAuth, #Encrypted, i, "Decrypted:", Decrypted, byte(Encrypted, i))
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
    
    
    
    --PandaAuth[GetFunc] = function(self) return end
    
    PandaAuth[SetFunc] = function(self, Func) -- SetFunc
        if (self ~= PandaAuth and self ~= PandaAuthTable) or Func ~= self[GetFunc] then print("a2", debug.traceback()) return end
        
        CurrentFunc = Func
    end
    
    --PandaAuth[GetENV] = function(self) return end
    
    PandaAuth[SetENV] = function(self, ENV) -- SetENV
        if (self ~= PandaAuth and self ~= PandaAuthTable) or ENV ~= self[GetENV] then print("a3", debug.traceback()) return end
        
        CurrentENV = ENV
    end
    
    PandaAuth[SetInternal] = function(self, Settings) -- SetInternal
        if (self ~= PandaAuth and self ~= PandaAuthTable) or CurrentENV ~= self[GetENV] then print("a4", debug.traceback()) return end
        
        Internal.Service  = Settings.Service and string.lower(Settings.Service) or error("PandaAuth.SetInternal > Missing Service")
        Internal.APIToken = Settings.APIToken or error("PandaAuth.SetInternal > Missing APIToken")
        Internal.TrueEndpoint = Settings.TrueEndpoint and string.lower(Settings.TrueEndpoint) or error("PandaAuth.SetInternal > Missing TrueEndpoint")
        Internal.FalseEndpoint = Settings.FalseEndpoint and string.lower(Settings.FalseEndpoint) or error("PandaAuth.SetInternal > Missing FalseEndpoint")
        Internal.Debug = Settings.Debug or false
        Internal.VigenereKey = Settings.VigenereKey or error("PandaAuth.SetInternal > Missing VigenereKey")
        
        if Internal.Debug == true then
            warn("=======================================")
            warn("Welcome to PandaAuth Development!")
            warn("Library Version:", (LibVersion or "Unknown"))
            warn("Utility:", tostring(identifyexecutor()))
            warn("=======================================")
        end
    end
    
    PandaAuth[GetInternal] = function(self) -- GetInternal
        if (self ~= PandaAuth and self ~= PandaAuthTable) and CurrentENV ~= self[GetENV] then print("a5", debug.traceback()) return end
        
        return {PandaAuth = PandaAuth, Internal = Internal, Identity = Identity, Crypt = Crypt, Time = Time}
    end
    
    PandaAuth[Debug] = function(self, ...)
        if (self ~= PandaAuth and self ~= PandaAuthTable) or CurrentENV ~= self[GetENV] then return end
        
        if Internal.Debug then
            --warn("[DEBUG]", ...)
        end
    end
    
    PandaAuth[SHA256] = function(self, Str, n1, n2, Key) -- SHA256
        if (self ~= PandaAuth and self ~= PandaAuthTable) or CurrentENV ~= self[GetENV] or self[GetENV] ~= getfenv(2) or self[GetFunc] ~= info(2, "f") then print("a6", debug.traceback()) return end
        
        local CompareHash = game["HttpGet" .. ("\0"):rep(random(2, 32)) .. "JSONDecode"](game, AuthHost ..  "/serviceapi?service=" .. Internal.Service .. "&command=hashed&param=" .. tostring(random(0,99)) .. Str)
        
        local Hashed = game["HttpGet" .. ("\0"):rep(random(2, 32)) .. "JSONDecode"](game, AuthHost ..  "/serviceapi?service=" .. Internal.Service .. "&command=hashed&param=" .. Str)
        
        if Hashed and CompareHash and Hashed ~= CompareHash and Key == Internal.VigenereKey then
            --PandaAuth[Debug](PandaAuth, "Successfully hashed the data to:", string.upper(Hashed))
            return string.upper(Hashed)
        else
            return --PandaAuth[Debug](PandaAuth, "Couldn't hash the data", Hashed)
        end
    end
    
    PandaAuth[ValidateKey] = function(self, Key) -- ValidateKey (Currently using failsafeValidation)
        if (self ~= PandaAuth and self ~= PandaAuthTable) or CurrentENV ~= self[GetENV] or self[GetENV] ~= getfenv(2) or self[GetFunc] ~= info(2, "f") then print("a7", debug.traceback()) return end
        
        local Url = AuthHost .. "/validate?service=" .. Internal.Service .. "&hwid=" .. Identity:GetID() .. "&key="
        Url = Host .. "/failsafeValidation?service=" .. Internal.Service .. "&hwid=" .. Identity:GetID() .. "&key="
        
        local function request(tbl)
            local Indexes = {'Url','Method','Headers','Cookies','Body'};
            local Index_Count = 0;
            
            local SecureMt = setmetatable({
                    __index = function(self, key)
                        if (debug.info(2, "f") ~= c_request) then
                            print("a8", debug.traceback()) return
                        end
                        Index_Count = Index_Count + 1;
                        if not Indexes[Index_Count] then
                            print("a9", debug.traceback()) return
                        end
                        Indexes[Index_Count] = nil
                        if key == 'Url' then
                            --print(rawget(tbl, key))
                        end
                        return rawget(tbl, key)
                    end
                }, {
                    __tostring = function()
                        print("a10", debug.traceback()) return
                    end
                }
            )
            
            local success, result = ypcall(newcclosure(function()
                c_request(setmetatable({}, SecureMt)) -- Oh look a nested metatable
            end))
            
            if success and result and not result["Url"] and not result["Method"] and not result['Headers'] and not result["Cookies"] and not result["Body"] then
                print("a11", debug.traceback()) return
            elseif not success then
                --error(result)
            end
            
            return result
        end
        
        local CompareResponse = request({
            Url = Url .. string.sub(Key, 1, #Key - random(2, 32));
            Method = "GET";
        })
        
        local response = request({
            Url = Url .. Key;
            Method = "GET";
        })
        
        --if CompareResponse.Body == response.Body then print(debug.traceback()) return end
        
        local success, result = pcall(function()
            --PandaAuth[Debug](PandaAuth, "Body:", response.Body, "APIToken:", Internal.APIToken)
            PandaAuth[GetFunc] = info(1, "f")
            PandaAuth[GetENV] = getfenv(1)
            local Decrypted = response.Body or Crypt:XorDecrypt(response.Body, Internal.APIToken)
            --PandaAuth[Debug](PandaAuth, "Decrypted:", Decrypted)
            pcall(function() HttpService:JSONDecode(secure_mt) end)
            pcall(function() HttpService.JSONDecode(secure_mt, secure_mt) end)
            return HttpService["JSONDecode" .. ("\0"):rep(random(2, 32)) .. "HttpGet"](HttpService, Decrypted)
        end)
        
        --PandaAuth[Debug](PandaAuth, "Response Status Code:", response.StatusCode)
        
        local function New(Endpoint)
            PandaAuth["Match\0\0\0\0"] = getfenv(1)
            
            PandaAuth[GetFunc] = info(1, "f")
            PandaAuth[GetENV] = getfenv(1)
            
            local Hashed = PandaAuth["ToggleDebug\0\0\0"](PandaAuth, Endpoint, nil, nil, Internal.VigenereKey)
            
            return {
                ["ENV"] = getfenv(3);
                ["Raw"] = Endpoint;
                ["Encrypted"] = Crypt:EncryptC(Hashed, Internal.VigenereKey);
                ["Premium"] = result["isPremium"];
            }
        end
        
        if response.StatusCode == 200 and success then
            if result["service"] ~= Internal.Service then
                --PandaAuth[Debug](PandaAuth, "\xE2\x9D\x8C - Service Mismatch.")
                
                return New(Internal.FalseEndpoint)
            end
            
            local time = result["expiresAt"]
            
            if (result["status"] == "success") or (result["success"] == "Authorized_" .. Internal.Service) and Time:CompareDate(time) then
                --PandaAuth[Debug](PandaAuth, "\xE2\x9C\x85 - Successfully validated key.", "\nPremium:", result["isPremium"])
                
                return New(Internal.TrueEndpoint)
            end
        else
            if response.StatusCode == 401 then
                --PandaAuth[Debug](PandaAuth, "\xE2\x9D\x8C - Your key is not valid.")
                
                return New(Internal.FalseEndpoint)
            elseif response.StatusCode == 404 then
                --PandaAuth[Debug](PandaAuth, "\xE2\x9D\x8C - Could not find the server.")
                
                return New(Internal.FalseEndpoint)
            elseif response.StatusCode == 406 then
                --PandaAuth[Debug](PandaAuth, "\xF0\x9F\x94\xA8 - User Account banned.")
                
                return New(Internal.FalseEndpoint)
             elseif not success then
                --PandaAuth[Debug](PandaAuth, "\xE2\x9D\x8C - Could not decrypt the server data.", "\n", result)
                
                return New(Internal.FalseEndpoint)
            else
                --PandaAuth[Debug](PandaAuth, "\xE2\x9A\xA0 - Unknown response, please contact us.", response.StatusCode)
                
                return New(Internal.FalseEndpoint)
            end
        end
    end
    
    PandaAuth[ResetHWID] = function(self, Key) -- ResetHWID
        if (self ~= PandaAuth and self ~= PandaAuthTable) or CurrentENV ~= self["Match\0\0\0\0"] then print("a12", debug.traceback()) return end
        
        local success, result = pcall(function()
            return HttpService["JSONDecode" .. ("\0"):rep(random(2, 32)) .. "HttpGet"](HttpService, request({Url = Host .. "/serviceapi/edit/hwid/?service=" .. Internal.Service.."&key=" .. Key .. "&newhwid=" .. Identity:GetID(), Method = "POST"}).Body)
        end)
        
        if success then
            --PandaAuth[Debug](PandaAuth, "\xE2\x9C\x85 - Successfully re-initialized your HWID.")
            
            return true
        else
            --PandaAuth[Debug](PandaAuth, "\xE2\x9D\x8C - Something went wrong while re-initializing your HWID.")
            
            for i, v in pairs(result) do
                --PandaAuth[Debug](PandaAuth, "Data:", i, v)
            end
            
            return false
        end
    end 
    
    PandaAuth[GetKey] = function(self) -- GetKey
        if (self ~= PandaAuth and self ~= PandaAuthTable) or CurrentENV ~= self["Match\0\0\0\0"] then print("a13", debug.traceback()) return end
        
        local Url = AuthHost .. "/getkey?service=" .. Internal.Service .. "&hwid=" .. Identity:GetID();
        
        --PandaAuth[Debug](PandaAuth, "\xE2\x9C\x85 - Generated link successfully:", Url)
        
        return Url
    end
    
    
    
    PandaAuthTable = {
        [SetFunc] = PandaAuth[SetFunc];
        [SetENV] = PandaAuth[SetENV];
    }
    
    local newcclosure_index_ite = 0
    local Metatable = {
        __index = function(self, key)
            if self ~= PandaAuthTable or newcclosure_index_ite > 2 then
                print("a14", debug.traceback()) return
            end
            --warn("__index >", self, key, debug.traceback())
            if info(4, "s") == "[C]" or info(3, "s") == "[C]" or info(2, "s") == "[C]" or info(1, "s") == "[C]" then
                newcclosure_index_ite = newcclosure_index_ite + 1
                --warn("newcclosure_index_ite:", newcclosure_index_ite)
            end
            return rawget(PandaAuth, key)
        end,
        __newindex = function(self, key, value)
            if self ~= PandaAuthTable or (getfenv(2) ~= value and info(2, "f") ~= value) then
                print("a15", debug.traceback()) return
            end
            --warn("__newindex >", self, key, value, debug.traceback())
            rawset(PandaAuth, key, value)
        end,
        __iter = function(self)
            print("a16", debug.traceback()) return
        end,
        __metatable = "This metatable is protected."
    }
    
    local Metamethods = {"__index", "__newindex", "__tostring", "__tonumber", "__call", "__len", "__namecall", "__iter"}
    
    local setreadonly = setreadonly or makereadonly or make_readonly
    if setreadonly then
        setreadonly(string, false)
        string.find = function(self, regex, init, plain)
            if checkcaller() and find(regex, "%%%z") and (self ~= PandaAuth and self ~= PandaAuthTable) or CurrentENV ~= self[GetENV] or self[GetENV] ~= getfenv(2) or self[GetFunc] ~= info(2, "f") then
                print("find", debug.traceback()) return
            end
            return find(self, regex, init, plain)
        end
        
        string.match = function(self, regex, init)
            if checkcaller() and match(regex, "%%%z") and (self ~= PandaAuth and self ~= PandaAuthTable) or CurrentENV ~= self[GetENV] or self[GetENV] ~= getfenv(2) or self[GetFunc] ~= info(2, "f") then
                print("match", debug.traceback()) return
            end
            return match(self, regex, init)
        end
        
        string.gsub = function(self, regex, replacement)
            warn(regex, replacement, self)
            if checkcaller() and gsub(regex, "%%%z", "") and (self ~= PandaAuth and self ~= PandaAuthTable) or CurrentENV ~= self[GetENV] or self[GetENV] ~= getfenv(2) or self[GetFunc] ~= info(2, "f") then
                print("gsub", debug.traceback()) return
            end
            return gsub(self, regex, replacement)
        end
        setreadonly(string, true)
    end
    
    rawset = function(self, key, value)
        if table.find(Metamethods, key) and value == nil then
            print("a17", debug.traceback()) return
        end
        return o_rawset(self, key, value)
    end
    
    getrawmetatable = function(self)
        local result = o_getrawmetatable(self)
        if self == PandaAuth or self == PandaAuthTable or result == Metatable then
            print("a18", debug.traceback()) return
        end
        return result
    end
    
    
    
    do
        local function Type(value)
            if getfenv(2) ~= o_ENV then
                return nil
            end
            local index = 0
            local possibles = {
                'number',
                'string',
                'table',
                'function',
                'boolean',
                'boolean',
                'nil',
                'userdata',
            }
            while true do
                index = index + 1;
                local success, result = ypcall(c_newcclosure(function(value, index) -- ypcall is exactly the same as pcall, but ypcall is a bit unknown, so it has less chance of being hooked.
                    if index == 1 then
                        value = value + 1
                    elseif index == 2 then
                        value = value .. ''
                    elseif index == 3 then
                        local result = value[5]
                    elseif index == 4 then
                        local result, result = coroutine.create(value), xpcall(function() end, value)
                    elseif index == 5 then
                        local _ = false == value and not (false ~= value) or error('err')
                    elseif index == 6 then
                        local _ = true == value and not (true ~= value) or error('err')
                    elseif index == 7 then
                        local _ = nil == value and not (nil ~= value) or error('err')
                    end;
                end), value, index)
                if success or index >= 8 then
                    break
                end
                sucess = nil
            end
            return possibles[index]
        end
        
        local WriteFunctions = {print, warn, error, setclipboard, writefile, makefolder, rconsoleprint, rconsoleerr, rconsolewarn}
        local AttFunctions = {pcall, xpcall, ypcall, loadstring, {game.HttpGet, game}, setfenv, getfenv, c_request, c_clonefunction, c_hookfunction, c_cloneref}
        
        local function isAVal(tbl, val)
            for index, value in pairs(tbl) do
                if value == val then
                    return true
                elseif typeof(value) == "table" then
                    isAVal(value, val)
                end
            end
            return false
        end
        
        local secure_mt = {
            __index = function(self, key)
                if not isAVal(AttFunctions, info(2, "f")) then
                    print("a19", debug.traceback()) return
                end
            end;
            __newindex = function(self, key, value)
                if not isAVal(AttFunctions, info(2, "f")) then
                    print("a20", debug.traceback()) return
                end
            end;
            __len = function(self)
                if not isAVal(AttFunctions, info(2, "f")) then
                    print("a21", debug.traceback()) return
                end
            end;
            __concat = function(self, b)
                if not isAVal(AttFunctions, info(2, "f")) then
                    print("a22", debug.traceback()) return
                end
            end;
            __tonumber = function(self)
                if not isAVal(AttFunctions, info(2, "f")) then
                    print("a23", debug.traceback()) return
                end
            end;
            __tostring = function(self)
                if not isAVal(AttFunctions, info(2, "f")) then
                    print("a24", debug.traceback()) return
                end
            end;
            __call = function(self)
                if not isAVal(AttFunctions, info(2, "f")) then
                    print("a25", debug.traceback()) return
                end
            end;
        }
        
        local function StackOverflow(func)
            local function Stack(StackCount, Function, ...)
                if StackCount == 0 then
                    task.wait()
                end
                Function(...)
                Stack(StackCount + 1, Function)
            end
            
            local Random = random(1, 2)
            local time = Random == 1 and time or clock
            local pcall = Random == 1 and pcall or ypcall
            
            local isRunning = false
            task.spawn(function()
                local Function = function()
                end
                ypcall(Stack, 0, Function)
                ypcall(Stack, 0, func) -- put the funciton you want to be protected here
                local lastTime = os.time()
                task.spawn(function()
                    while task.wait(60*1) do
                        lastTime = os.time()
                        local Success1, Error1 = pcall(Stack, 0, Function)
                        local Success2, Error2 = pcall(Stack, 0, func) -- put the funciton you want to be protected here
                        task.wait(60*14)
                    end
                end)
                isRunning = true
                repeat task.wait(1) until os.time() - lastTime > (60*15)+15
                print("a26", debug.traceback()) return
            end)
            
            delay(random(1, 2), function()
                if not isRunning then
                    print("a27", debug.traceback()) return
                end
            end)
        end
        
        do
            local isRunning = false
            for index, Function in pairs(AttFunctions) do
                if Type(Function) == "function" then
                    pcall(Function, setmetatable({}, secure_mt))
                    StackOverflow(Function)
                    isRunning = true
                elseif Type(Function) == "table" and #Function > 0 then
                    pcall(Function[1], Function[2], setmetatable({info(Function[1], "n")}, secure_mt))
                    StackOverflow(Function[1])
                    isRunning = true
                end
            end
            
            delay(random(1, 2), function()
                if not isRunning then
                    print("a28", debug.traceback()) return
                end
            end)
        end
        
        if info(c_hookfunction, "l") ~= -1
        or info(loadstring, "l") ~= -1
        or hookfunction == c_hookfunction or
        (function() for i, v in pairs(WriteFunctions) do return (loadstring == v or Type(loadstring("")) ~= "function" or loadstring("return 'infInix'")() ~= "infInix") end end)() or
        (function() for i, v in pairs(WriteFunctions) do return (Type(v) ~= "function") end end)() then
            print("a29", debug.traceback()) return
        end
        
        setmetatable(PandaAuth, {
            __iter = function(self)
                print("a30", debug.traceback()) return
            end
        })
        
        return setmetatable(PandaAuthTable, Metatable)
    end
    
    
    
    return PandaAuth
    end)()
    return PandaAuth
    end)
    
    return loadedstring()