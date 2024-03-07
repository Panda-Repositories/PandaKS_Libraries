local attack = true

local staticTrue = "6807d7cf4d301de500c0efc7a3270367e238c1851af991aed8551097b5d1b786eff9e7df0fc6a028da36a30aaa2a8d408acd0ebc3775fc3f28dbd0d63cabdfe9"

local warn = warn
local print = print

if attack then
    local spoofreturn = false
    local old2; old2 = hookfunction(loadstring, newcclosure(function(...)
        local args = {...}
        local result = old2(unpack(args))
        if spoofreturn then
            setfenv(result, setmetatable({}, {
                __index = function(self, key)
                    local result = getfenv(1)[key]
                    return result
                end;
                __newindex = function(self, key, value)
                    if key == "mac_hash_key" then
                        staticTrue = value
                        rawset(self, key, staticTrue)
                    end
                    rawset(self, key, value)
                end;
            }))
            return result
        end
        return old2(unpack(args))
    end))
local old1;
old1 = hookfunction(setclipboard, function(thing)
    if typeof(thing) == "string" then
        if thing:match("https://keyrblx.com/getkey") then
            local players_service = cloneref(game:GetService("Players"))
            local _tostring = clonefunction(tostring)
            local myHWID = _tostring(players_service.LocalPlayer.UserId)
            
            thing = "https://pandadevelopment.net/getkey?hwid="..myHWID.."&service=magixxkiller"
            return old1(thing)
        end
    end
end)
local old;
old = hookfunction(game.HttpGet, function(self, url, ...)
    if typeof(url) == "string" then
        if url:match("https://raw.githubusercontent.com/MaGiXxScripter0/keysystemv2api") then 
            keyrblx = true
            spoofreturn = true 
            print("Main -> Bypassed")
        elseif url:match("https://raw.githubusercontent.com/MaGiXxScripter0/keysystemv2api/master/setup_obf.lua") then 
            keyrblx = true
            spoofreturn = true 
            print("setup_obf.lua -> Bypassed")
        elseif url:match("https://raw.githubusercontent.com/MaGiXxScripter0/keysystemv2api/master/version2_1.lua") then 
            keyrblx = true
            spoofreturn = true 
            print("version2_1.lua -> Bypassed")
        elseif url:match("https://raw.githubusercontent.com/MaGiXxScripter0/keysystemv2api/master/version2.lua") then 
            keyrblx = true
            spoofreturn = true 
            print("version2.lua -> Bypassed")
        elseif url:match("https://raw.githubusercontent.com/MaGiXxScripter0/keysystemv2api/master/setup.lua") then 
            keyrblx = true
            spoofreturn = true 
            print("Setup.lua -> Bypassed")
        end

        if url:match("key=") and keyrblx then
            return staticTrue
        end
    end

    return old(self, url, ...)
end)
end
warn("v1.0.0")

