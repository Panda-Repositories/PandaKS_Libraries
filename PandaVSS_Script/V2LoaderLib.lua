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

local NotificationTypes = {
    info = {
        color = Color3.fromRGB(59, 130, 246),
        title = "Information",
        icon  = "rbxassetid://7733960981"
    },
    warning = {
        color = Color3.fromRGB(234, 179, 8),
        title = "Warning",
        icon  = "rbxassetid://7734053495"
    },
    critical = {
        color = Color3.fromRGB(239, 68, 68),
        title = "Critical",
        icon  = "rbxassetid://7734056627"
    }
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
    NotificationContainer.Position = UDim2.new(0, 20, 1, -20)
    NotificationContainer.Size = UDim2.new(0, 340, 1, -40)
    NotificationContainer.Parent = NotificationGui

    local layout = Instance.new("UIListLayout")
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.VerticalAlignment = Enum.VerticalAlignment.Bottom
    layout.Padding = UDim.new(0, 10)
    layout.Parent = NotificationContainer
end

-- Dismiss a notification card (internal)
local function dismissNotification(card)
    if not card or not card.Parent then return end

    local fadeOut = TweenService:Create(card, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
        Position = UDim2.new(-0.3, 0, 0, 0),
        BackgroundTransparency = 1
    })

    for _, desc in ipairs(card:GetDescendants()) do
        if desc:IsA("TextLabel") or desc:IsA("TextButton") then
            TweenService:Create(desc, TweenInfo.new(0.2), { TextTransparency = 1 }):Play()
        elseif desc:IsA("ImageLabel") then
            TweenService:Create(desc, TweenInfo.new(0.2), { ImageTransparency = 1 }):Play()
        elseif desc:IsA("Frame") then
            TweenService:Create(desc, TweenInfo.new(0.2), { BackgroundTransparency = 1 }):Play()
        end
    end

    fadeOut:Play()
    fadeOut.Completed:Wait()

    if card and card.Parent then
        card:Destroy()
    end
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

    local data = NotificationTypes[notifType] or NotificationTypes.info
    local color = data.color

    ensureNotificationGui()

    -- Main card
    local card = Instance.new("Frame")
    card.Name = "Notification"
    card.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
    card.BorderSizePixel = 0
    card.Size = UDim2.new(1, 0, 0, 72)
    card.ClipsDescendants = true
    card.Parent = NotificationContainer

    local cardCorner = Instance.new("UICorner")
    cardCorner.CornerRadius = UDim.new(0, 10)
    cardCorner.Parent = card

    local cardStroke = Instance.new("UIStroke")
    cardStroke.Color = Color3.fromRGB(40, 40, 50)
    cardStroke.Thickness = 1
    cardStroke.Transparency = 0.5
    cardStroke.Parent = card

    -- Icon circle
    local iconHolder = Instance.new("Frame")
    iconHolder.Name = "IconHolder"
    iconHolder.BackgroundColor3 = color
    iconHolder.BackgroundTransparency = 0.85
    iconHolder.Position = UDim2.new(0, 14, 0, 14)
    iconHolder.Size = UDim2.new(0, 36, 0, 36)
    iconHolder.BorderSizePixel = 0
    iconHolder.Parent = card

    local iconHolderCorner = Instance.new("UICorner")
    iconHolderCorner.CornerRadius = UDim.new(1, 0)
    iconHolderCorner.Parent = iconHolder

    local iconImage = Instance.new("ImageLabel")
    iconImage.Name = "Icon"
    iconImage.BackgroundTransparency = 1
    iconImage.AnchorPoint = Vector2.new(0.5, 0.5)
    iconImage.Position = UDim2.new(0.5, 0, 0.5, 0)
    iconImage.Size = UDim2.new(0, 18, 0, 18)
    iconImage.Image = data.icon
    iconImage.ImageColor3 = color
    iconImage.ScaleType = Enum.ScaleType.Fit
    iconImage.Parent = iconHolder

    -- Title
    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.BackgroundTransparency = 1
    title.Position = UDim2.new(0, 62, 0, 12)
    title.Size = UDim2.new(1, -100, 0, 18)
    title.Font = Enum.Font.GothamBold
    title.Text = data.title
    title.TextColor3 = color
    title.TextSize = 14
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = card

    -- Message
    local msgLabel = Instance.new("TextLabel")
    msgLabel.Name = "Message"
    msgLabel.BackgroundTransparency = 1
    msgLabel.Position = UDim2.new(0, 62, 0, 32)
    msgLabel.Size = UDim2.new(1, -100, 0, 28)
    msgLabel.Font = Enum.Font.Gotham
    msgLabel.Text = message
    msgLabel.TextColor3 = Color3.fromRGB(180, 180, 195)
    msgLabel.TextSize = 13
    msgLabel.TextXAlignment = Enum.TextXAlignment.Left
    msgLabel.TextYAlignment = Enum.TextYAlignment.Top
    msgLabel.TextWrapped = true
    msgLabel.TextTruncate = Enum.TextTruncate.AtEnd
    msgLabel.Parent = card

    -- Close button
    local closeBtn = Instance.new("TextButton")
    closeBtn.Name = "Close"
    closeBtn.BackgroundTransparency = 1
    closeBtn.Position = UDim2.new(1, -34, 0, 8)
    closeBtn.Size = UDim2.new(0, 24, 0, 24)
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.Text = "X"
    closeBtn.TextColor3 = Color3.fromRGB(100, 100, 115)
    closeBtn.TextSize = 14
    closeBtn.Parent = card

    closeBtn.MouseEnter:Connect(function()
        TweenService:Create(closeBtn, TweenInfo.new(0.15), { TextColor3 = Color3.fromRGB(200, 200, 210) }):Play()
    end)
    closeBtn.MouseLeave:Connect(function()
        TweenService:Create(closeBtn, TweenInfo.new(0.15), { TextColor3 = Color3.fromRGB(100, 100, 115) }):Play()
    end)

    local dismissed = false
    closeBtn.MouseButton1Click:Connect(function()
        if dismissed then return end
        dismissed = true
        dismissNotification(card)
    end)

    -- Progress bar (bottom of card)
    local progressBg = Instance.new("Frame")
    progressBg.Name = "ProgressBg"
    progressBg.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    progressBg.BorderSizePixel = 0
    progressBg.AnchorPoint = Vector2.new(0, 1)
    progressBg.Position = UDim2.new(0, 0, 1, 0)
    progressBg.Size = UDim2.new(1, 0, 0, 3)
    progressBg.Parent = card

    local progressBar = Instance.new("Frame")
    progressBar.Name = "ProgressBar"
    progressBar.BackgroundColor3 = color
    progressBar.BorderSizePixel = 0
    progressBar.Size = UDim2.new(1, 0, 1, 0)
    progressBar.Parent = progressBg

    local progressCorner = Instance.new("UICorner")
    progressCorner.CornerRadius = UDim.new(0, 2)
    progressCorner.Parent = progressBar

    -- Entrance animation: start off-screen and transparent
    card.Position = UDim2.new(-0.5, 0, 0, 0)
    card.BackgroundTransparency = 1
    cardStroke.Transparency = 1

    for _, desc in ipairs(card:GetDescendants()) do
        if desc:IsA("TextLabel") or desc:IsA("TextButton") then
            desc.TextTransparency = 1
        elseif desc:IsA("ImageLabel") then
            desc.ImageTransparency = 1
        elseif desc:IsA("Frame") and desc ~= card then
            desc.BackgroundTransparency = 1
        end
    end

    -- Slide + fade in
    TweenService:Create(card, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
        Position = UDim2.new(0, 0, 0, 0),
        BackgroundTransparency = 0
    }):Play()

    TweenService:Create(cardStroke, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
        Transparency = 0.5
    }):Play()

    task.delay(0.1, function()
        if not card or not card.Parent then return end

        for _, desc in ipairs(card:GetDescendants()) do
            if desc:IsA("TextLabel") or desc:IsA("TextButton") then
                TweenService:Create(desc, TweenInfo.new(0.3), { TextTransparency = 0 }):Play()
            elseif desc:IsA("ImageLabel") then
                TweenService:Create(desc, TweenInfo.new(0.3), { ImageTransparency = 0 }):Play()
            elseif desc:IsA("Frame") and desc.Name == "IconHolder" then
                TweenService:Create(desc, TweenInfo.new(0.3), { BackgroundTransparency = 0.85 }):Play()
            elseif desc:IsA("Frame") and (desc.Name == "ProgressBar" or desc.Name == "ProgressBg") then
                TweenService:Create(desc, TweenInfo.new(0.3), { BackgroundTransparency = 0 }):Play()
            end
        end
    end)

    -- Animate progress bar shrinking over duration
    TweenService:Create(progressBar, TweenInfo.new(duration, Enum.EasingStyle.Linear), {
        Size = UDim2.new(0, 0, 1, 0)
    }):Play()

    -- Auto-dismiss
    task.delay(duration, function()
        if dismissed then return end
        dismissed = true
        dismissNotification(card)
    end)
end

return PandaKey
