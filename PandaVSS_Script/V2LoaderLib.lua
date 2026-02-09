--[[
    Panda Key System - Library Version
    https://pandadevelopment.net

    Usage:
        local PandaKey = loadstring(...)()

        PandaKey.Config({
            ServiceID = "YOUR_SERVICE_ID",
            URL = "https://new.pandadevelopment.net", -- optional, this is the default
            AuthHWID = gethwid() -- optional, auto-detects if omitted
        })

        local result = PandaKey.Validate("PANDA-XXXX-XXXX-XXXX-XXXX")
        local premiumResult = PandaKey.Validate("PANDA-XXXX-XXXX-XXXX-XXXX", true)
        local url = PandaKey.GetKeyURL()
        PandaKey.OpenGetKey()
]]

local PandaKey = {}

local DefaultURL = "https://new.pandadevelopment.net"

local _ServiceID = nil
local _BaseURL = nil
local _AuthHWID = nil

--[[
    Configure the library
    @param options table - {
        ServiceID: string (required),
        URL: string|nil (optional, defaults to "https://new.pandadevelopment.net"),
        AuthHWID: string|nil (optional, e.g. gethwid() — auto-detects if omitted)
    }
]]
function PandaKey.Config(options)
    assert(type(options) == "table", "Config expects a table")
    assert(options.ServiceID and type(options.ServiceID) == "string", "ServiceID is required and must be a string")

    _ServiceID = options.ServiceID
    _BaseURL = (options.URL or DefaultURL) .. "/api/v1"
    _AuthHWID = options.AuthHWID or nil
end

-- Get Hardware ID (internal)
local function getHardwareId()
    if _AuthHWID and _AuthHWID ~= "" then
        return _AuthHWID
    end

    local success, hwid = pcall(gethwid)
    if success and hwid then
        return hwid
    end

    local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
    local clientId = tostring(RbxAnalyticsService:GetClientId())
    return clientId:gsub("-", "")
end

-- HTTP Request wrapper (internal)
local function makeRequest(endpoint, body)
    local HttpService = game:GetService("HttpService")

    local url = _BaseURL .. endpoint
    local jsonBody = HttpService:JSONEncode(body)

    local response = request({
        Url = url,
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = jsonBody
    })

    if response and response.Body then
        return HttpService:JSONDecode(response.Body)
    end

    return nil
end

--[[
    Validate a key
    @param key string - The license key to validate
    @param Premium_Verification boolean (optional) - If true, requires the key to be premium
    @return table - { success: boolean, message: string, isPremium: boolean, expireDate: string|nil }
]]
function PandaKey.Validate(key, Premium_Verification)
    assert(_ServiceID, "PandaKey not configured. Call PandaKey.Config() first.")

    local hwid = getHardwareId()

    local result = makeRequest("/keys/validate", {
        ServiceID = _ServiceID,
        HWID = hwid,
        Key = key
    })

    if not result then
        return {
            success = false,
            message = "Failed to connect to server",
            isPremium = false,
            expireDate = nil
        }
    end

    local isAuthenticated = result.Authenticated_Status == "Success"
    local isPremium = result.Key_Premium or false

    local isValid = isAuthenticated
    local message = result.Note or (isAuthenticated and "Key validated!" or "Invalid key")

    if Premium_Verification and isAuthenticated and not isPremium then
        isValid = false
        message = "Premium key required"
    end

    return {
        success = isValid,
        message = message,
        isPremium = isPremium,
        expireDate = result.Expire_Date
    }
end

--[[
    Get Key URL
    @return string - The URL to get a key
]]
function PandaKey.GetKeyURL()
    assert(_ServiceID, "PandaKey not configured. Call PandaKey.Config() first.")

    local hwid = getHardwareId()
    local base = _BaseURL:gsub("/api/v1$", "")
    return base .. "/getkey/" .. _ServiceID .. "?hwid=" .. hwid
end

--[[
    Open Get Key page (copies URL to clipboard)
    @return string - The URL
]]
function PandaKey.OpenGetKey()
    local url = PandaKey.GetKeyURL()
    if setclipboard then
        setclipboard(url)
    end
    return url
end

return PandaKey
