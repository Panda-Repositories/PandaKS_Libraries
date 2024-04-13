--[[
	Changelogs (04-12-2024)
	* Added Exception Handling to Key System ( Validation ). If the serverside failed, it will automatic verifies the key system
	* Bug Fixes
	* YEAAA.. Magicc
]]
local PandaAuth = {}


-- User Customizations
getgenv().setclipboard = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set)
getgenv().AllowLibNotification = true
getgenv().CustomLogo = "14317130710"
getgenv().DebugMode = false

local TemporaryAccess = false

-- If the Serverside failed to response, it will automatic sent to the user, validating the key system but with logs.
getgenv().AutomaticFailsafe = false
-- If the Serverside failed to response, it will automatic sent to the user, validating the key system but with logs.
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
local LibVersion = "v2.5.0_Beta (03-29-2024)"
-- warn("Panda-Pelican Libraries Loaded ( "..LibVersion.." )")
-- Validation Services (https://pandadevelopment.net/v2_validation?hwid=ass&service=pandadevkit&key=wrgsr)

local validation_service = server_configuration.. "/v2_validation"

local function AutoKeyless()
	if getgenv().AutomaticFailsafe == true then
		-- Generate a Log / Log the User Details
		return true
	end
end



function Get_RequestData(data_link)
	local DataResponse = request({
		Url = data_link,
		Method = "GET"
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
	local client_id = rbx_analytics_service:GetClientId()
	local success, jsonData = pcall(function()
		return http_service:JSONDecode(game:HttpGet(server_configuration .. "/serviceapi?service=" .. service .. "&command=getconfig"))
	end)
	if success then        
		if jsonData.AuthMode == "playerid" then
			return _tostring(players_service.LocalPlayer.UserId)
		elseif jsonData.AuthMode == "hwidplayer" then
			return client_id..players_service.LocalPlayer.UserId
		elseif jsonData.AuthMode == "hwidonly" then
			return client_id
		elseif jsonData.AuthMode == "fingerprint" then
			-- Get's ROBLOX Fingerprint
			local fingerprint = request({
				Url = server_configuration.."/fingerprint",
				Method = "GET"
			})
			if (fingerprint.Success and fingerprint.Body ~= "") then
				return fingerprint.Body;
			else
				DebugText("Unable to Get ROBLOX Fingerprint [ Status "..fingerprint.StatusCode.. " ]")
				return client_id
			end

		else
			return players_service.LocalPlayer.UserId
		end
	else
		-- Handle the error, for example:
		warn("Failed to decode JSON data:", jsonData)
		return client_id -- or any other appropriate action
	end    
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
	local service_name = string.lower(ServiceID)
	for i,v in pairs(http_service:JSONDecode(request({Url = server_configuration.."/serviceapi/edit/hwid/?service="..service_name.."&key=" .. oldKey .. "&newhwid=" .. game:GetService("RbxAnalyticsService"):GetClientId(), Method = "POST"}).Body)) do
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

function PandaAuth.new(service, data) -- for Magixx Compatibility
    local Frame = {}
    Frame.__index = Frame
    print("Data: "..tostring(data))
    local setclipboard = set_clipboard or setclipboard or writeclipboard or write_clipboard

    Frame.copyGetKeyURL = function() return setclipboard and setclipboard(PandaAuth:GetKey(service)) end
    Frame.getKeyURL = function() return PandaAuth:GetKey(service) end
    Frame.key = function(key) warn("PandaAuth doesn't support key data.") end
    Frame.premiumKey = function(key) warn("PandaAuth doesn't support premium key data.") end
    Frame.verifyKey = function(key) return PandaAuth:AuthorizedKyRBLX(service, key, false) end
    Frame.verifyDefaultKey = function(key) return PandaAuth:AuthorizedKyRBLX(service, key, false) end
    Frame.verifyPremiumKey = function(key) return PandaAuth:AuthorizedKyRBLX(service, key, true) end
    return Frame
end

return PandaAuth
