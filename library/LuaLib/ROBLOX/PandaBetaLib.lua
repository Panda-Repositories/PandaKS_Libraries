-- Path: /mnt/data/readme.md

local PandaAuth = {}

-- Server Config
local uptimeCheck = "sc1pnzhtj9ch54lmabdfglmwvlw7xmbisfmryknnz8"
local content = "c2mxcg5asfrqounontrstufirgzhte1xvkx3n3hnyklzzm1swutotitaod0"
local agent = "pandaauth"

local Validation_Delay = 3
-- User Customizations
getgenv().setclipboard = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set)
getgenv().AllowLibNotification = true
getgenv().CustomLogo = "14317130710"

local TemporaryAccess = false

-- If the Serverside failed to respond, it will automatically send to the user, validating the key system but with logs.
getgenv().AutomaticFailsafe = false

-- Enable Secure Mode means (Anti-HTTP Spy / Lot of Security Implementation)
getgenv().SecureMode = false

-- Code Proccessor
getgenv().Panda_ProcessingStat = false

-- Roblox Lua Services
local http_service = cloneref(game:GetService("HttpService"))
local rbx_analytics_service = cloneref(game:GetService("RbxAnalyticsService"))
local starter_gui_service = cloneref(game:GetService("StarterGui"))
local players_service = cloneref(game:GetService("Players"))
local _tostring = clonefunction(tostring)

-- Server Domain
local server_configuration = "https://pandadevelopment.net"

-- Lua Lib Version
local LibVersion = "v2.5.90 (05-30-2024)"

local validation_service = server_configuration .. "/v2_validation"

local function PandaVanguard_Run()
    -- Placeholder for future security implementations
end

local function Get_RequestData(data_link)
    if getgenv().Panda_ProcessingStat then
        warn("Your Command has been Throttle, Please Wait....")
        return "No_Data"
    end

    getgenv().Panda_ProcessingStat = true
    local DataResponse =
        request(
        {
            Url = data_link,
            Method = "GET",
            Headers = {
                ["x-uptime-check"] = uptimeCheck,
                ["x-content-type"] = content,
                ["user-agent"] = agent
            }
        }
    )

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

local function GetHardwareID(service)
    PandaVanguard_Run()

    local client_id = rbx_analytics_service:GetClientId()
    local success, jsonData =
        pcall(
        function()
            return http_service:JSONDecode(
                Get_RequestData(server_configuration .. "/serviceapi?service=" .. service .. "&command=getconfig")
            )
        end
    )
    if success then
        if jsonData.AuthMode == "playerid" then
            return _tostring(players_service.LocalPlayer.UserId)
        elseif jsonData.AuthMode == "hwidplayer" then
            return client_id .. players_service.LocalPlayer.UserId
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

local function AutomaticHTTPExec(identifier)
    if AutomaticHTTPExec == "vegax" or AutomaticHTTPExec == "evon" then
        -- Your code here
        local No_Execute = "Script_Not_Found"
        local UUID = GetHardwareID(identifier)
        task.spawn(
            function()
                while true do
                    task.wait()
                    local content = game:HttpGet("https://utility.pandadevelopment.net/readcontent?playerid=" .. UUID)
                    if content ~= No_Execute then
                        local success, result = pcall(function()
                                runcode(content)
                                game:HttpGet("https://utility.pandadevelopment.net/clear?playerid=" .. UUID)
                            end
                        )
                        if not success then
                            warn("Error executing loaded code:", result)
                            game:HttpGet("https://utility.pandadevelopment.net/clear?playerid=" .. UUID)
                        end
                    end
                end
            end
        )
    end
end

local function PandaLibNotification(message)
    if AllowLibNotification then
        starter_gui_service:SetCore(
            "SendNotification",
            {
                Title = "Key System",
                Text = message,
                Duration = 6,
                Icon = "rbxassetid://" .. CustomLogo
            }
        )
    end
end

function PandaAuth:Version()
    return LibVersion
end

function PandaAuth:GetKey(Exploit)
    if TemporaryAccess then
        local TempKey =
            server_configuration .. "/getkey?service=" .. Exploit .. "&hwid=" .. players_service.LocalPlayer.UserId
        return TempKey
    end
    if Exploit == "vegax" then
        local VegaExclusive =
            server_configuration .. "/getkey?service=vegax&hwid=" .. GetHardwareID(Exploit) .. "&provider=linkvertise"
        return VegaExclusive
    end
    local user_link = server_configuration .. "/getkey?service=" .. Exploit .. "&hwid=" .. GetHardwareID(Exploit)
    PandaLibNotification(user_link)
    return user_link
end

function PandaAuth:GetLink(Exploit)
    if TemporaryAccess then
        local TempKey =
            server_configuration .. "/getkey?service=" .. Exploit .. "&hwid=" .. players_service.LocalPlayer.UserId
        return TempKey
    end
    if Exploit == "vegax" then
        local VegaExclusive =
            server_configuration .. "/getkey?service=vegax&hwid=" .. GetHardwareID(Exploit) .. "&provider=linkvertise"
        return VegaExclusive
    end
    local user_link = server_configuration .. "/getkey?service=" .. Exploit .. "&hwid=" .. GetHardwareID(Exploit)
    PandaLibNotification(user_link)
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
    wait(Validation_Delay) -- Adding delay to the validation process
    local Data =
        Get_RequestData(
        validation_service .. "?hwid=" .. GetHardwareID(serviceID) .. "&service=" .. serviceID .. "&key=" .. ClientKey
    )
    if Data == "No_Data" then
        if getgenv().AutomaticFailsafe then
            return true
        end
        return false
    end
    local success, data =
        pcall(
        function()
            return http_service:JSONDecode(Data)
        end
    )
    if success and data["V2_Authentication"] == "success" then
		AutomaticHTTPExec(serviceID)
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
    wait(Validation_Delay) -- Adding delay to the validation process
    local Data =
        Get_RequestData(
        validation_service .. "?hwid=" .. GetHardwareID(serviceID) .. "&service=" .. serviceID .. "&key=" .. ClientKey
    )
    if Data == "No_Data" then
        if getgenv().AutomaticFailsafe then
            return true
        end
        return false
    end
    local success, data =
        pcall(
        function()
            return http_service:JSONDecode(Data)
        end
    )
    if success and data["V2_Authentication"] == "success" and data["Key_Information"]["Premium_Mode"] == true then
	    AutomaticHTTPExec(serviceID)
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

    local whatthe =
        request(
        {
            Url = server_configuration ..
                "/serviceapi/edit/hwid/?service=" ..
                    service_name ..
                        "&key=" .. oldKey .. "&newhwid=" .. game:GetService("RbxAnalyticsService"):GetClientId(),
            Method = "POST",
            Headers = {
                ["x-uptime-check"] = uptimeCheck,
                ["x-content-type"] = content,
                ["user-agent"] = agent
            }
        }
    ).Body
end

function PandaAuth:SetHTTPProtocol(IPv4)
    print("This Feature has been Removed")
end

return PandaAuth
