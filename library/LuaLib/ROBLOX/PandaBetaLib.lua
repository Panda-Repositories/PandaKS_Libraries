--[[
	Changelogs (04-12-2024)
	* Added Exception Handling to Key System ( Validation ). If the serverside failed, it will automatic verifies the key system
	* Bug Fixes
	* YEAAA.. Magicc
]]
local PandaAuth = {}


-- Server Config
local uptimeCheck = "sc1pnZHTj9Ch54lMAbDfGLMWVLw7xMbIsfmRYKNN+Z8="
local content = "c2MxcG5aSFRqOUNoNTRsTUFiRGZHTE1XVkx3N3hNYklzZm1SWUtOTitaOD0="
local agent = "PandaAuth"

-- User Customizations
getgenv().setclipboard = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set)
getgenv().AllowLibNotification = false
getgenv().CustomLogo = "14317130710"
getgenv().DebugMode = false

local TemporaryAccess = false

-- If the Serverside failed to response, it will automatic sent to the user, validating the key system but with logs.
getgenv().AutomaticFailsafe = false

-- Enable Secure Mode means ( Anti-HTTP Spy / Lot of Security Implementation )
getgenv().SecureMode = false

-- Roblox Lua Services
local http_service = cloneref(game:GetService("HttpService"))
local rbx_analytics_service = cloneref(game:GetService("RbxAnalyticsService"))
local starter_gui_service = cloneref(game:GetService("StarterGui"))
local players_service = cloneref(game:GetService("Players"))
local _tostring = clonefunction(tostring)


-- Server Domain
local server_configuration = "https://pandadevelopment.net"

-- Lua Lib Version
local LibVersion = "v2.5.1 (04-13-2024)"
-- warn("Panda-Pelican Libraries Loaded ( "..LibVersion.." )")
-- Validation Services (https://pandadevelopment.net/v2_validation?hwid=ass&service=pandadevkit&key=wrgsr)

local validation_service = server_configuration.. "/v2_validation"

local function AutoKeyless()
	if getgenv().AutomaticFailsafe == true then
		-- Generate a Log / Log the User Details
		return true
	end
end


local function PandaVanguard_Run()
	-- local function CheckForSpy()
	-- 	local core = game:GetService("CoreGui")
	-- 	local keyword = "spy"
	-- 	for _, v in pairs(core:GetDescendants()) do
	-- 	  if v:IsA("TextLabel") or v:IsA("TextButton") or v:IsA("TextBox") then
	-- 		if string.find(string.lower(v.Name), string.lower(keyword)) or string.find(string.lower(v.Text), string.lower(keyword)) then
	-- 		  while true do end
	-- 		end
	-- 	  end
	-- 	end
	--   end
	-- CheckForSpy()
end

function Get_RequestData(data_link)
	local DataResponse = request({
		Url = data_link,
		Method = "GET",
        Headers = {
            ["x-uptime-check"] = uptimeCheck,
            ["x-content-type"] = content,
            ["User-Agent"] = agent
        }
	})
	if DataResponse.StatusCode == 200 then
		return DataResponse.Body
	else
		local CodeStatus = DataResponse.StatusCode;
		if CodeStatus == 429 then
			warn("[Panda Auth] - Too many requests, please try again later. [" .. DataResponse.StatusCode .. "]")
		elseif CodeStatus == 500 then
			warn("[Panda Auth] - Internal Error. [" .. DataResponse.StatusCode .. "]")
		elseif CodeStatus == 403 then
			warn("[Panda Auth] - Unable to Access the Server. [" .. DataResponse.StatusCode .. "]")
		end
		return "No_Data"
	end
end


function DebugText(text)
	if getgenv().DebugMode then
		print("[ Developer Mode ] - "..text)
	end
end

local function GetHardwareID(service)
	PandaVanguard_Run()
	local client_id = rbx_analytics_service:GetClientId()
	return client_id
end

local function PandaLibNotification(message)
	if AllowLibNotification then
		starter_gui_service:SetCore("SendNotification", {
			Title = "Key System ",
			Text = message,
			Duration = 6,
			Icon = "rbxassetid://"..CustomLogo
		})
	end
end

function PandaAuth:Version()
	return LibVersion
end

function PandaAuth:GetKey(Exploit)
	if TemporaryAccess then
		local TempKey = server_configuration .. "/getkey?service=" .. Exploit .. "&hwid=" .. players_service.LocalPlayer.UserId;
		return TempKey
	end
	if Exploit == "vegax" then
		local VegaExclusive = server_configuration .. "/getkey?service=vegax&hwid=" .. GetHardwareID(Exploit).."&provider=linkvertise";
		return VegaExclusive
	end
	local user_link = server_configuration .. "/getkey?service=" .. Exploit .. "&hwid=" .. GetHardwareID(Exploit);
	PandaLibNotification(user_link)
	DebugText("Get Key: "..user_link)
	return user_link
end

function PandaAuth:GetLink(Exploit)
	if TemporaryAccess then
		local TempKey = server_configuration .. "/getkey?service=" .. Exploit .. "&hwid=" .. players_service.LocalPlayer.UserId;
		return TempKey
	end
	if Exploit == "vegax" then
		local VegaExclusive = server_configuration .. "/getkey?service=vegax&hwid=" .. GetHardwareID(Exploit).."&provider=linkvertise";
		return VegaExclusive
	end
	local user_link = server_configuration .. "/getkey?service=" .. Exploit .. "&hwid=" .. GetHardwareID(Exploit);
	PandaLibNotification(user_link)
	DebugText("Get Key: "..user_link)
	return user_link
end


function PandaAuth:ValidateKey(serviceID, ClientKey)
	PandaVanguard_Run()
	-- *********************** [ SECURE MODE ( VALIDATE KEY ) ] ***********************
	local Data = Get_RequestData(validation_service.. "?hwid=" .. GetHardwareID(serviceID) .. "&service=" .. serviceID .. "&key=" .. ClientKey)
	if Data == "No_Data" then
		-- Switches to Pastebin-based Key System
		return true
	end
	local success, data = pcall(function()
		return http_service:JSONDecode(Data)
	end)
	if success and data["Authentication"] == "success" then
		return true
	end
	return false
end

function PandaAuth:ValidatePremiumKey(serviceID, ClientKey)
	PandaVanguard_Run()
	local Data = Get_RequestData(validation_service.. "?hwid=" .. GetHardwareID(serviceID) .. "&service=" .. serviceID .. "&key=" .. ClientKey)
	if Data == "No_Data" then
		return true
	end
	local success, data = pcall(function()
		return http_service:JSONDecode(Data)
	end)
	if success and data["Authentication"] == "success" and data["Key_Information"]["Premium_Mode"] == true then
		return true
	end
	return false
end


function PandaAuth:ValidateNormalKey(service_name, Key)
	local bruh = PandaAuth:ValidateKey(service_name, Key)
	return bruh
end

function PandaAuth:Authenticate_Keyless(service_name)
	return PandaAuth:ValidateKey(service_name, "keyless")
end

function PandaAuth:AuthorizedKyRBLX(serviceID, ClientKey, isPremium)
	if TemporaryAccess then
		return true
	end
	if isPremium then
		return PandaAuth:ValidatePremiumKey(serviceID, ClientKey)
	else
		return PandaAuth:ValidateKey(serviceID, ClientKey)
	end

end

-- Contributed from [ Hub Member: asrua ]
function PandaAuth:ResetHardwareID(ServiceID, oldKey)
	PandaVanguard_Run()
	local service_name = string.lower(ServiceID)

	local whatthe = request({
		Url = server_configuration.."/serviceapi/edit/hwid/?service="..service_name.."&key=" .. oldKey .. "&newhwid=" .. game:GetService("RbxAnalyticsService"):GetClientId(), 
		Method = "POST",
		Headers = {
            ["x-uptime-check"] = uptimeCheck,
            ["x-content-type"] = content,
            ["User-Agent"] = agent
        }}).Body
	for i,v in pairs(http_service:JSONDecode(whatthe)) do
		print(i, v)
	end
end


function PandaAuth:SetHTTPProtocol(IPv4)
	local No_Execute = "No_Data_Set_Here"
	if IPv4 == "" or IPv4 == nil then
		warn("[Unable to Start HTTP-Protocol] - Missing IP Address / Port")
		return
	end
	task.spawn(function() 
		while true do
			wait(0.1)
			local content = game:HttpGet(IPv4.."/readcontent")     
			if content ~= No_Execute then
				local success, result = pcall(function()
					runcode(content)
					local a = tostring(game:HttpGet(IPv4.."/clear"))
				end)

				if not success then
					-- Handle the exception here
					warn("Error executing loaded code:", result)
					local b = tostring(game:HttpGet(IPv4.."/clear"))
				end        
			end
		end
	end) 
end

function PandaAuth:SetWebsocket(IpAddress)
	warn("This Feature is not available yet... Sorry")
	print("Hi -> "..tostring(IpAddress))
end

-- function PandaAuth.new(service, data) -- for Magixx Compatibility
--     local Frame = {}
--     Frame.__index = Frame
--     print("Data: "..tostring(data))
--     local setclipboard = set_clipboard or setclipboard or writeclipboard or write_clipboard

--     Frame.copyGetKeyURL = function() return setclipboard and setclipboard(PandaAuth:GetKey(service)) end
--     Frame.getKeyURL = function() return PandaAuth:GetKey(service) end
--     Frame.key = function(key) warn("PandaAuth doesn't support key data.") end
--     Frame.premiumKey = function(key) warn("PandaAuth doesn't support premium key data.") end
--     Frame.verifyKey = function(key) return PandaAuth:AuthorizedKyRBLX(service, key, false) end
--     Frame.verifyDefaultKey = function(key) return PandaAuth:AuthorizedKyRBLX(service, key, false) end
--     Frame.verifyPremiumKey = function(key) return PandaAuth:AuthorizedKyRBLX(service, key, true) end
--     return Frame
-- end

return PandaAuth
