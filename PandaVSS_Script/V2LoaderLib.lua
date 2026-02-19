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

-- Notification System (internal state)
local NotificationGui = nil
local NotificationContainer = nil
local TweenService = game:GetService("TweenService")

local NotificationColors = {
    info     = Color3.fromRGB(30, 130, 230),
    warning  = Color3.fromRGB(230, 180, 30),
    critical = Color3.fromRGB(220, 50, 50)
}

local NotificationIcons = {
    info     = "ℹ",
    warning  = "⚠",
    critical = "✕"
}

-- Initialize the notification GUI (internal)
local function ensureNotificationGui()
    if NotificationGui and NotificationGui.Parent then
        return
    end

    local Players = game:GetService("Players")
    local playerGui = Players.LocalPlayer:WaitForChild("PlayerGui")

    NotificationGui = Instance.new("ScreenGui")
    NotificationGui.Name = "PandaNotifications"
    NotificationGui.ResetOnSpawn = false
    NotificationGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    NotificationGui.DisplayOrder = 999
    NotificationGui.Parent = playerGui

    NotificationContainer = Instance.new("Frame")
    NotificationContainer.Name = "Container"
    NotificationContainer.BackgroundTransparency = 1
    NotificationContainer.AnchorPoint = Vector2.new(0, 1)
    NotificationContainer.Position = UDim2.new(0, 16, 1, -16)
    NotificationContainer.Size = UDim2.new(0, 320, 1, -32)
    NotificationContainer.Parent = NotificationGui

    local layout = Instance.new("UIListLayout")
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.VerticalAlignment = Enum.VerticalAlignment.Bottom
    layout.Padding = UDim.new(0, 8)
    layout.Parent = NotificationContainer
end

--[[
    Show a custom notification on the bottom-left of the screen
    @param notifType string - "info" | "warning" | "critical"
    @param message string - The notification message
    @param duration number (optional) - How long to show in seconds (default 5)

    Usage:
        PandaKey.CustomNotification("info", "Script loaded successfully!")
        PandaKey.CustomNotification("warning", "Key expires soon")
        PandaKey.CustomNotification("critical", "Authentication failed!")
]]
function PandaKey.CustomNotification(notifType, message, duration)
    notifType = notifType and string.lower(notifType) or "info"
    duration = duration or 5

    local color = NotificationColors[notifType] or NotificationColors.info
    local icon = NotificationIcons[notifType] or NotificationIcons.info

    ensureNotificationGui()

    -- Card
    local card = Instance.new("Frame")
    card.Name = "Notification"
    card.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
    card.BorderSizePixel = 0
    card.Size = UDim2.new(1, 0, 0, 48)
    card.ClipsDescendants = true
    card.BackgroundTransparency = 1
    card.Parent = NotificationContainer

    local cardCorner = Instance.new("UICorner")
    cardCorner.CornerRadius = UDim.new(0, 8)
    cardCorner.Parent = card

    -- Color accent bar on the left
    local accent = Instance.new("Frame")
    accent.Name = "Accent"
    accent.BackgroundColor3 = color
    accent.BorderSizePixel = 0
    accent.Size = UDim2.new(0, 4, 1, 0)
    accent.Position = UDim2.new(0, 0, 0, 0)
    accent.Parent = card

    local accentCorner = Instance.new("UICorner")
    accentCorner.CornerRadius = UDim.new(0, 8)
    accentCorner.Parent = accent

    -- Icon label
    local iconLabel = Instance.new("TextLabel")
    iconLabel.Name = "Icon"
    iconLabel.BackgroundTransparency = 1
    iconLabel.Position = UDim2.new(0, 14, 0, 0)
    iconLabel.Size = UDim2.new(0, 24, 1, 0)
    iconLabel.Font = Enum.Font.GothamBold
    iconLabel.Text = icon
    iconLabel.TextColor3 = color
    iconLabel.TextSize = 18
    iconLabel.Parent = card

    -- Message label
    local msgLabel = Instance.new("TextLabel")
    msgLabel.Name = "Message"
    msgLabel.BackgroundTransparency = 1
    msgLabel.Position = UDim2.new(0, 42, 0, 0)
    msgLabel.Size = UDim2.new(1, -52, 1, 0)
    msgLabel.Font = Enum.Font.Gotham
    msgLabel.Text = message
    msgLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
    msgLabel.TextSize = 14
    msgLabel.TextXAlignment = Enum.TextXAlignment.Left
    msgLabel.TextWrapped = true
    msgLabel.TextTruncate = Enum.TextTruncate.AtEnd
    msgLabel.Parent = card

    -- Slide in from left
    card.Position = UDim2.new(-1, 0, 0, 0)
    card.BackgroundTransparency = 0

    local slideIn = TweenService:Create(card, TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
        Position = UDim2.new(0, 0, 0, 0)
    })
    slideIn:Play()

    -- Auto-dismiss
    task.delay(duration, function()
        if not card or not card.Parent then return end

        local slideOut = TweenService:Create(card, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
            Position = UDim2.new(-1, 0, 0, 0),
            BackgroundTransparency = 1
        })
        slideOut:Play()
        slideOut.Completed:Wait()

        if card and card.Parent then
            card:Destroy()
        end
    end)
end

return PandaKey
