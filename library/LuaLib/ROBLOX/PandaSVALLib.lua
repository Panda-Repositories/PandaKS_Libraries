-- Stable Version
local PandaAuth = {}

local config = {
    Service = "",
    DisplayName = "",
    API_Key = "",
    IsDebug = false, -- Enable debug mode
    Allow_BlacklistUsers = false, -- Allow blacklisted users to use the service
    Save_Key = false, -- Save the key to the user's data
    Initialized = false, -- Track if PandaAuth has been initialized
    DiagnosticLogs = true -- Enable diagnostic logs
}


-- Table to hold the configuration and service state
local http_service = cloneref(game:GetService("HttpService"))
local rbx_analytics_service = cloneref(game:GetService("RbxAnalyticsService"))
local starter_gui_service = cloneref(game:GetService("StarterGui"))
local players_service = cloneref(game:GetService("Players"))
local _tostring = clonefunction(tostring)

local server_configuration = "https://pandadevelopment.net"
local uptimeCheck = "sc1pnzhtj9ch54lmabdfglmwvlw7xmbisfmryknnz8"
local content = "c2mxcg5asfrqounontrstufirgzhte1xvkx3n3hnyklzzm1swutotitaod0"
local agent = "pandaauth"

local PlayerControlID = _tostring(players_service.LocalPlayer.UserId)

-- (Core Local Function of SVAL Library)
local function FetchData(data_link)
    local DataResponse = request({
            Url = data_link,
            Method = "GET",
            Headers = {
                ["x-uptime-check"] = uptimeCheck,
                ["x-content-type"] = content,
                ["user-agent"] = agent
            }
        }
    )
    if DataResponse.StatusCode == 200 then
        return DataResponse.Body
    else
        return "No_Data"
    end
end

local function VALPrint(text)
    if config.IsDebug then
        warn("[SVAL] - " .. text)
    end
end

local function PandaLibNotification(message)
    if not config.IsDebug then
        starter_gui_service:SetCore("SendNotification",
            {
                Title = config.DisplayName or "Panda SVAL",
                Text = message,
                Duration = 6
            }
        )
    else
        VALPrint(message)
    end
end

function PandaAuth:Initialize(options)
    if not options.Service or not options.API_Key or not options.DisplayName then
        warn("[SVAL]- Missing Information, Please Read the New Panda's Documentation (SVAL)")
        return
    end

    -- Set config values or default if not provided
    config.Service = options.Service
    config.API_Key = options.API_Key
    config.IsDebug = options.IsDebug or config.IsDebug
    config.Allow_BlacklistUsers = options.Allow_BlacklistUsers or config.Allow_BlacklistUsers
    config.Save_Key = options.Save_Key or config.Save_Key
    config.DiagnosticLogs = options.DiagnosticLogs or config.DiagnosticLogs
    config.Initialized = true

    if config.IsDebug then
        VALPrint("Panda-Pelican Development( Debug Mode is ENABLED )")
        VALPrint("************************************************")  
        VALPrint("PandaAuth Initialized with Service: "..  config.Service)
        VALPrint("Debug Mode: "..  _tostring(config.IsDebug))
        VALPrint("Allow Blacklist Users: "..  _tostring(config.Allow_BlacklistUsers))
        VALPrint("Save Key: "..  _tostring(config.Save_Key))
        VALPrint("Diagnostic Logs: " .. _tostring(config.DiagnosticLogs))
        VALPrint("************************************************")  
        VALPrint("Executor Type: " .. identifyexecutor() or "Unknown")  
    end
    -- Check for Blacklist
    if config.Allow_BlacklistUsers then
        local BlacklistData = http_service:JSONDecode(FetchData("https://vanguard.pandadevelopment.net/checkhwid?hwid="..PlayerControlID .."&service="..config.Service))
        if BlacklistData["status"] == "blacklisted" then
            VALPrint("User is Blacklisted from using this service [ "..PlayerControlID.." ]")
            game.Players.LocalPlayer:Kick("You are blacklisted from using this service for: ".._tostring(BlacklistData["blacklisted_reason"]))
        end
    end
    -- Prevent Hookfunc
end

-- Internal function to check if PandaAuth has been initialized
local function isInitialized()
    if not config.Initialized then
        PandaLibNotification("Panda Authentication has not yet Initialized")
        return false
    end
    return true
end

function PandaAuth:GetKey()
    if not isInitialized() then return end
    return server_configuration .. "/getkey?service=" .. config.Service .. "&hwid=" .. PlayerControlID
end


function PandaAuth:ValidateKey(inputKey)
    if not isInitialized() then return end
    -- Authenticate to Serverside
    local Data = FetchData(server_configuration .. "/v2_validation?hwid=" .. PlayerControlID .. "&service=" .. config.Service .. "&key=" .. inputKey)
    local JSONData = http_service:JSONDecode(Data)

    if JSONData["V2_Authentication"] == "success" then
        VALPrint("Key Authenticated Under [" .. config.Service .. "] - " .. inputKey)
        return true
    else
        VALPrint("Key Not Authenticate Under [" .. config.Service .. "] - " .. inputKey)
        return false
    end
end

return PandaAuth
