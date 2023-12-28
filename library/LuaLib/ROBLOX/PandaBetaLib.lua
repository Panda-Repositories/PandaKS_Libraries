local PandaAuth = {}

-- User Customizations

getgenv().AllowLibNotification = true
getgenv().CustomLogo = "14317130710"
getgenv().DebugMode = false


-- Roblox Lua Services
local http_service = cloneref(game:GetService("HttpService"))
local rbx_analytics_service = cloneref(game:GetService("RbxAnalyticsService"))
local starter_gui_service = cloneref(game:GetService("StarterGui"))
local players_service = cloneref(game:GetService("Players"))
local _tostring = clonefunction(tostring)

-- Server Domain
local server_configuration = "https://auth.pandadevelopment.net"

-- Lua Lib Version
local LibVersion = "[ 2.1.3_alpha ]"
-- warn("Panda-Pelican Libraries Loaded ( "..LibVersion.." )")
-- Validation Services
local validation_service = server_configuration.. "/failsafeValidation"


function DebugText(text)
    if getgenv().DebugMode then
        print("[ DEBUG ] - "..text)
    end
end


local function GetHardwareID(service)
        local jsonData = http_service:JSONDecode(game:HttpGet(server_configuration .. "/serviceapi?service=" .. service .. "&command=getconfig", true))
        local client_id = rbx_analytics_service:GetClientId()
    
        if jsonData.AuthMode == "playerid" then
            return _tostring(players_service.LocalPlayer.UserId) .."_MOBILE"
        elseif jsonData.AuthMode == "hwidplayer" then
            local hashedata = _tostring(game:HttpGet(server_configuration.."/serviceapi?service="..service.."&command=Hashed&param=".. players_service.LocalPlayer.UserId..client_id, true))
            return hashedata
        elseif jsonData.AuthMode == "hwidonly" then
            return client_id
        elseif jsonData.AuthMode == "iponly" then       
            return jsonData.IPToken
        else
            return players_service.LocalPlayer.UserId
        end
end

local function PandaLibNotification(message)
    if AllowLibNotification then
        starter_gui_service:SetCore("SendNotification", {
            Title = "Key System ",
            Text = user_link,
            Duration = 6,
            Icon = "rbxassetid://"..CustomLogo
        })
    end
end

function PandaAuth:Version()
    return LibVersion
end

function PandaAuth:GetLink(Exploit)
    local user_link = server_configuration .. "/getkey?service=" .. Exploit .. "&hwid=" .. GetHardwareID(Exploit);
    PandaLibNotification(user_link)
    DebugText("Get Key: "..user_link)
    return user_link
end

local function GetDataFromServer(serviceID, Key)
    local service_name = string.lower(serviceID)
    local response = nil
    local timeout = 10 -- Set a timeout in seconds
    local startTime = tick()

    while response == nil and tick() - startTime < timeout do
        wait(1) -- Adjust the wait time based on your needs
        -- Make the HTTP request
        response = game:HttpGet(validation_service .. "?service=" .. service_name .. "&key=" .. Key .. "&hwid=" .. GetHardwareID(service_name))
    end

    if response == nil then
        DebugText("Timeout reached, no response received")
        return "timeout_error"
    elseif response.StatusCode == 200 and response == nil then
        DebugText("Issue on HTTPGet")
        return "httpget_issue"
    else
        DebugText("[ - Request successful - ]")
        return response
    end
end
local function EncryptionSaveDisk(Data)
    local dick = Data
end

function PandaAuth:ValidateKey(serviceID, Key)
    local service_name = string.lower(serviceID)
    -- Call the function
    local result = GetDataFromServer(serviceID, key)

-- Handle the result
    if result == "timeout_error" then
        print("Timeout reached, no response received")
        return false
    -- Handle the timeout error
    elseif result == "httpget_issue" then
        print("Issue on HTTPGet from your ROBLOX Lua Executor")
        return false
    end
        
    if result == nil then
        DebugText("Failed to Get Data, WHAT!")
    end
    local jsonTable = http_service:JSONDecode(result)


    if jsonTable.status == "success" and jsonTable.service == serviceID then        
        DebugText("----- Key is Authenticated -----")
        writefile("Premium.txt", jsonTable.isPremium)
        return true
    elseif jsonTable.status == "unsupported" then
        DebugText("----- Executor Unsupported -----")
        return "unsupported"
    else
        DebugText("----- Regular Key is Not Authenticated -----")
        PandaLibNotification("Unable to Validate the Key, See for Developer Console") 
        return false
    end
end

function PandaAuth:ValidatePremiumKey(serviceID, Key)
    local service_name = string.lower(serviceID)
    if PandaAuth:ValidateKey(service_name, Key) == true then
        wait(1)
        if readfile("Premium.txt") == tostring(true) then 
            return true
        else
            return false
        end
    else
        return false
    end
end

function PandaAuth:ValidateNormalKey(service_name, Key)
    local bruh = PandaAuth:ValidateKey(service_name, Key)
    return bruh
end


return PandaAuth