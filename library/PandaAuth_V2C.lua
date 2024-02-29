getgenv().setclipboard = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set)

-- Roblox Lua Services
local http_service = cloneref(game:GetService("HttpService"))
local rbx_analytics_service = cloneref(game:GetService("RbxAnalyticsService"))
local starter_gui_service = cloneref(game:GetService("StarterGui"))
local players_service = cloneref(game:GetService("Players"))
local _tostring = clonefunction(tostring)


local HttpService = game:GetService("HttpService")
local clientId

if identifyexecutor and 'Delta, Android' == identifyexecutor() then
    clientId = gethwid()
else
	clientId = rbx_analytics_service:GetClientId()
end

local function replaceTableToEmpty(tbl)
	local oldTbl = tbl
	local newTbl = setmetatable({}, {
		__index = function(tbl, idx)
			return oldTbl[idx]
		end,
	})
	return newTbl
end

local hashIP = nil

local function getHwidByType(hwidType)
	if hwidType == nil then
		return clientId
	end

	if type(hwidType) == "string" then
		local hwidType = string.lower(hwidType)
		if hwidType == "ip" then
			if not hashIP then
				local RawIP = game:HttpGet("https://pandadevelopment.net/serviceapi?service=pandadevkit&command=getuseripaddress")
				hashIP = game:HttpGet("https://pandadevelopment.net/serviceapi?service=pandadevkit&command=hashed&param="..RawIP)
			end
			return hashIP
		elseif hwidType == "playerid" then
			return _tostring(players_service.LocalPlayer.UserId)
		elseif hwidType == "clientid" then
			return _tostring(rbx_analytics_service:GetClientId())
		end
	end
end

local APIService = {}
do
	function APIService:urlKeyData(name, key, hwid)
		warn("[ Feature Disabled ] - Intentional Disabled from the Developer")
		return nil
	end

	function APIService:urlPremiumKeyData(name, key, hwid)
		warn("[ Feature Disabled ] - Intentional Disabled from the Developer")
		return nil
	end

	function APIService:getKeyURL(name, hwid)
		-- Rewritten (Backward Compatible)
		return "https://pandadevelopment.net/getkey?service="..name.."&hwid="..hwid
	end

	function APIService:premiumKeyData(name, key, hwid)
		warn("[ Feature Disabled ] - Intentional Disabled from the Developer")
		return nil
	end

	function APIService:keyData(name, key, hwid)
		warn("[ Feature Disabled ] - Intentional Disabled from the Developer")
		return nil
	end

	function APIService:VerifyKey(serviceID, key)
		local hwid = getHwidByType(self.authType)
		local service_name = string.lower(serviceID)
		-- ============================================================
		-- ( PANDA REVERSED ENGINEERING API FOR MAGIXX KEY SYSTEM )
		-- ============================================================
		local response = request({
			Url = "https://pandadevelopment.net/failsafeValidation?service=" .. service_name .. "&hwid="..hwid .. "&key="..key,
			Method = "GET"
		})
		if response.StatusCode == 200 then
			local success, data = pcall(function()
				return http_service:JSONDecode(response.Body)
			end)
			if success and data["status"] == "success" then
				return true
			end
			return false
		else
			debug_print("Server Return as ".. response.StatusCode)
			return false
		end
	end

	function APIService:applicationData(name)
		warn("[ Feature Disabled ] - Intentional Disabled from the Developer")
		return nil
	end

	function APIService:ResetHardwareiD(name, oldKey, newHWID)
		local service_name = string.lower(name)
		for i,v in pairs(http_service:JSONDecode(request({Url = "https://pandadevelopment.net/serviceapi/edit/hwid/?service="..service_name.."&key=" .. oldKey .. "&newhwid=" .. newHWID, Method = "POST"}).Body)) do
			print(i, v)
		end
	end
end

local function debug_print(...)
	if _G.DEBUG_MODE then
		print("[ Developer Mode ] - ", ...)
	end
end

local KeyLibrary = {}
do
	KeyLibrary.__index = KeyLibrary

	function KeyLibrary.new(name, options)
		local options = options or {}
		self = setmetatable({}, KeyLibrary)
		self.name = name
		self.authType = options.authType or "clientid"
		return replaceTableToEmpty(self)
	end

	function KeyLibrary:copyGetKeyURL()
		if setclipboard then
			local url = self:getKeyURL()
			setclipboard(url)
		else
			warn("Not supported setclipboard")
		end
	end

	function KeyLibrary:getKeyURL()
		return APIService:getKeyURL(self.name, getHwidByType(self.authType))

	end

	function KeyLibrary:key(key)
		warn("[ Feature Disabled ] - To Fetch Key from Panda Auth, Please Update the Script to Panda-Auth V3 Libraries")
		return nil
	end

	function KeyLibrary:ResetHWID(oldKey)
		local newhwid = getHwidByType(self.authType)
		local serviceID = getHwidByType(self.name)
		APIService:ResetHardwareiD(serviceID, oldKey, newhwid)
	end

	function KeyLibrary:premiumKey(key)
		warn("[ Feature Disabled ] - To Fetch Premium Key from Panda Auth, Please Update the Script to Panda-Auth V3 Libraries")
		return nil
	end

	-- Verifies Key (Premium)
	function KeyLibrary:verifyPremiumKey(keyString)
		local hwid = getHwidByType(self.authType)
		-- Verifies Key (Premium) 
		-- ============================================================
		-- ( PANDA REVERSED ENGINEERING API FOR MAGIXX KEY SYSTEM )
		-- ============================================================
		local service_name = string.lower(self.name)
		local response = request({
			Url = "https://pandadevelopment.net/failsafeValidation?service=" .. service_name .. "&hwid="..hwid .. "&key="..keyString,
			Method = "GET"
		})
		if response.StatusCode == 200 then
			local success, data = pcall(function()
				return http_service:JSONDecode(response.Body)
			end)
			if success and data["status"] == "success" and data["isPremium"] == true then
				return true
			end
			return false
		else
			debug_print("Server Return as ".. response.StatusCode)
			return false
		end
	end

	-- Verifies Key (Normal)
	function KeyLibrary:verifyDefaultKey(keyString)
		local result = APIService:VerifyKey(self.name, keyString)
		return result 
	end

	-- Verifies Key (Normal)
	function KeyLibrary:verifyKey(keyString)
		local result = APIService:VerifyKey(self.name, keyString)
		return result 
	end
end

return KeyLibrary


-- Fixeeedd