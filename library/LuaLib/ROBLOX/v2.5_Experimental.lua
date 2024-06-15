-- Path: /mnt/data/readme.md
local PandaAuth = {}

-- User Config
getgenv().setclipboard = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set)
getgenv().AllowLibNotification = true
getgenv().CustomLogo = "14317130710"
getgenv().AutomaticFailsafe = false
getgenv().SecureMode = false
getgenv().Panda_ProcessingStat = false

-- Server & Library Configuration
local uptimeCheck = "sc1pnzhtj9ch54lmabdfglmwvlw7xmbisfmryknnz8"
local content = "c2mxcg5asfrqounontrstufirgzhte1xvkx3n3hnyklzzm1swutotitaod0"
local agent = "pandaauth"
local Validation_Delay = 3
local http_service = cloneref(game:GetService("HttpService"))
local rbx_analytics_service = cloneref(game:GetService("RbxAnalyticsService"))
local starter_gui_service = cloneref(game:GetService("StarterGui"))
local players_service = cloneref(game:GetService("Players"))
local _tostring = clonefunction(tostring)
local server_configuration = "https://test.pandadevelopment.net"
local LibVersion = "v2.5.90 (05-30-2024) Experimental Libraries"
local validation_service = server_configuration.. "/v2_validation"
local TemporaryAccess = false
local Test_Build = true

if Test_Build then
	warn('[ Developer ] - This Library is Experimental Version')
end

-- [ Updated ] - Encryption Method
-- Function to convert a string to an array of byte values
local function stringToBytes(str)
    local bytes = {}
    for i = 1, #str do
        table.insert(bytes, string.byte(str, i))
    end
    return bytes
end

-- Function to convert an array of byte values to a string
local function bytesToString(bytes)
    local chars = {}
    for i = 1, #bytes do
        table.insert(chars, string.char(bytes[i]))
    end
    return table.concat(chars)
end

-- Function to convert bytes to a hex string
local function bytesToHex(bytes)
    local hex = {}
    for i = 1, #bytes do
        table.insert(hex, string.format("%02x", bytes[i]))
    end
    return table.concat(hex)
end

-- Function to convert a hex string to bytes
local function hexToBytes(hex)
    local bytes = {}
    for i = 1, #hex, 2 do
        table.insert(bytes, tonumber(hex:sub(i, i+1), 16))
    end
    return bytes
end

-- Function to encrypt the byte array using the Vigenère cipher
local function vigenereEncryptBytes(bytes, key)
    key = key:upper()
    local keyBytes = stringToBytes(key)
    local encryptedBytes = {}
    for i = 1, #bytes do
        local byte = bytes[i]
        local keyByte = keyBytes[(i-1) % #keyBytes + 1]
        table.insert(encryptedBytes, (byte + keyByte) % 256)
    end
    return encryptedBytes
end

-- Function to decrypt the byte array using the Vigenère cipher
local function vigenereDecryptBytes(bytes, key)
    key = key:upper()
    local keyBytes = stringToBytes(key)
    local decryptedBytes = {}
    for i = 1, #bytes do
        local byte = bytes[i]
        local keyByte = keyBytes[(i-1) % #keyBytes + 1]
        table.insert(decryptedBytes, (byte - keyByte + 256) % 256)
    end
    return decryptedBytes
end


local function PandaVanguard_Run()
	-- Placeholder for future security implementations
end

local function PandaLibNotification(message)
	if AllowLibNotification then
		starter_gui_service:SetCore("SendNotification", {
			Title = "Key System",
			Text = message,
			Duration = 6,
			Icon = "rbxassetid://"..CustomLogo
		})
	end
end

local function Get_RequestData(data_link)
	warn(data_link)
	if getgenv().Panda_ProcessingStat then
		warn('Your Command has been Throttle, Please Wait....')
		return "No_Data"
	end

	getgenv().Panda_ProcessingStat = true
	local DataResponse = request({
		Url = data_link,
		Method = "GET",
        Headers = {
            ["x-uptime-check"] = uptimeCheck,
            ["x-content-type"] = content,
            ["user-agent"] = agent
        }
	})

	getgenv().Panda_ProcessingStat = false

	if DataResponse.StatusCode == 200 then
		return DataResponse.Body
	else
		if DataResponse.StatusCode == 429 then
			-- Too many requests
		elseif DataResponse.StatusCode == 500 then
			-- Internal Error
		elseif DataResponse.StatusCode == 403 then
			-- Unable to Access the Server
		else
			-- Unknown Error on Server
		end
		return "No_Data"
	end
end

local function GetUserSecMode(KeyAPI, service) 
	local DataRaw = Get_RequestData(server_configuration .. "/serviceapi?service=" .. service .. "&command=fetchclientinfo");
	if DataRaw == "No_Data" then
		PandaLibNotification("Unable to Contact the Server. Please Try Again")
		return "nillo"
	end
	local plaintextBytes = stringToBytes(DataRaw)
	local encryptedBytes = vigenereEncryptBytes(plaintextBytes, KeyAPI)
	local encryptedText = bytesToHex(encryptedBytes)
	return encryptedText
end

local function GetHardwareID(service)
	PandaVanguard_Run()

	local client_id = rbx_analytics_service:GetClientId()
	local success, jsonData = pcall(function()
		return http_service:JSONDecode(Get_RequestData(server_configuration .. "/serviceapi?service=" .. service .. "&command=getconfig"))
	end)
	if success then        
		if jsonData.AuthMode == "playerid" then
			return _tostring(players_service.LocalPlayer.UserId)
		elseif jsonData.AuthMode == "hwidplayer" then
			return client_id..players_service.LocalPlayer.UserId
		elseif jsonData.AuthMode == "hwidonly" then
			return client_id
		elseif jsonData.AuthMode == "fingerprint" then
			local GetFingerprint = Get_RequestData(server_configuration .. "/fingerprint")
			return tostring(GetFingerprint)
		else
			return players_service.LocalPlayer.UserId
		end
	else
		return client_id
	end
end



function PandaAuth:Version()
	return LibVersion
end

function PandaAuth:GetKey(Exploit, KeyAPI)
	if TemporaryAccess then
		local TempKey = server_configuration .. "/getkey?service=" .. Exploit .. "&hwid=" .. players_service.LocalPlayer.UserId .. "&secmode=" .. GetUserSecMode(Exploit, KeyAPI) 
		return TempKey
	end
	if Exploit == "vegax" then
		local VegaExclusive = server_configuration .. "/getkey?service=vegax&hwid=" .. GetHardwareID(Exploit).."&provider=linkvertise" .. "&secmode=" .. GetUserSecMode(Exploit, KeyAPI) 
		return VegaExclusive
	end
	local user_link = server_configuration .. "/getkey?service=" .. Exploit .. "&hwid=" .. GetHardwareID(Exploit) .. "&secmode=" .. GetUserSecMode(Exploit, KeyAPI) 
	return user_link
end

function PandaAuth:GetLink(Exploit, KeyAPI)
	if TemporaryAccess then
		local TempKey = server_configuration .. "/getkey?service=" .. Exploit .. "&hwid=" .. players_service.LocalPlayer.UserId .. "&secmode=" .. GetUserSecMode(Exploit, KeyAPI) 
		return TempKey
	end
	if Exploit == "vegax" then
		local VegaExclusive = server_configuration .. "/getkey?service=vegax&hwid=" .. GetHardwareID(Exploit).."&provider=linkvertise" .. "&secmode=" .. GetUserSecMode(Exploit, KeyAPI) 
		return VegaExclusive
	end
	local user_link = server_configuration .. "/getkey?service=" .. Exploit .. "&hwid=" .. GetHardwareID(Exploit) .. "&secmode=" .. GetUserSecMode(Exploit, KeyAPI) 
	return user_link
end

function PandaAuth:ValidateKey(serviceID, ClientKey)
	if ClientKey == "" then
		return false
	end
	if TemporaryAccess then
		return true
	end
	PandaVanguard_Run()
	wait(Validation_Delay)  -- Adding delay to the validation process
	local Data = Get_RequestData(validation_service.. "?hwid=" .. GetHardwareID(serviceID) .. "&service=" .. serviceID .. "&key=" .. ClientKey)
	if Data == "No_Data" then
		if getgenv().AutomaticFailsafe then
			return true
		end
		return false
	end
	local success, data = pcall(function()
		return http_service:JSONDecode(Data)
	end)
	if success and data["V2_Authentication"] == "success" then
		return true
	end
	return false
end

function PandaAuth:ValidatePremiumKey(serviceID, ClientKey)
	if ClientKey == "" then
		return false
	end
	if TemporaryAccess then
		return true
	end
	PandaVanguard_Run()
	wait(Validation_Delay)  -- Adding delay to the validation process
	local Data = Get_RequestData(validation_service.. "?hwid=" .. GetHardwareID(serviceID) .. "&service=" .. serviceID .. "&key=" .. ClientKey)
	if Data == "No_Data" then
		if getgenv().AutomaticFailsafe then
			return true
		end
		return false
	end
	local success, data = pcall(function()
		return http_service:JSONDecode(Data)
	end)
	if success and data["V2_Authentication"] == "success" and data["Key_Information"]["Premium_Mode"] == true then
		return true
	end
	return false
end

function PandaAuth:ValidateNormalKey(service_name, Key)
	return PandaAuth:ValidateKey(service_name, Key)
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

-- Contributed from [Hub Member: asrua]
function PandaAuth:ResetHardwareID(ServiceID, oldKey)
	PandaVanguard_Run()
	local service_name = string.lower(ServiceID)

	local whatthe = request({
		Url = server_configuration.."/serviceapi/edit/hwid/?service="..service_name.."&key=" .. oldKey .. "&newhwid=" .. game:GetService("RbxAnalyticsService"):GetClientId(), 
		Method = "POST",
		Headers = {
            ["x-uptime-check"] = uptimeCheck,
            ["x-content-type"] = content,
            ["user-agent"] = agent
        }
	}).Body
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
					game:HttpGet(IPv4.."/clear")
				end)
				if not success then
					warn("Error executing loaded code:", result)
					game:HttpGet(IPv4.."/clear")
				end        
			end
		end
	end) 
end

return PandaAuth
