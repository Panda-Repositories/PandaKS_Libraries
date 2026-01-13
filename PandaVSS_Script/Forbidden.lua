-- Updated as of 1/12/2026
--[[
    Forbidden Script Execution Handler
    Professional Error Display with Console Logging
    ____________________________________________________________________
    Copyright(C)2025 @Panda-Pelican Development LLC
]]
-- local Verification_Status = 0
-- Services
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local LocalPlayer = Players.LocalPlayer

-- Store original Instance.new
local _Instance_new = Instance.new

-- Protected GUI creation function
local function createProtectedInstance(className, properties)
    local inst = _Instance_new(className)
    if properties then
        for k, v in pairs(properties) do
            pcall(function() inst[k] = v end)
        end
    end
    return inst
end

-- Console logging for developers
local ConsoleLog = {}

local function logToConsole(level, message)
    local timestamp = os.date("%H:%M:%S")
    local logEntry = {
        timestamp = timestamp,
        level = level,
        message = message
    }
    table.insert(ConsoleLog, logEntry)

    -- Print to output with color coding
    if level == "ERROR" then
        warn("[Forbidden-Script][" .. timestamp .. "] ERROR: " .. message)
    elseif level == "INFO" then
        print("[Forbidden-Script][" .. timestamp .. "] INFO: " .. message)
    elseif level == "DEBUG" then
        print("[Forbidden-Script][" .. timestamp .. "] DEBUG: " .. message)
    end
end

-- Professional Error GUI
local function createErrorGui(errorMessage, errorType)
    logToConsole("ERROR", "Script execution failed: " .. errorMessage)
    logToConsole("DEBUG", "Error Type: " .. (errorType or "UNKNOWN"))

    -- Remove existing GUI if present
    pcall(function()
        local existing = CoreGui:FindFirstChild("ForbiddenScriptGUI")
        if existing then existing:Destroy() end
    end)

    local ScreenGui = createProtectedInstance("ScreenGui", {
        Name = "ForbiddenScriptGUI",
        ResetOnSpawn = false,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        DisplayOrder = 9999
    })

    pcall(function() ScreenGui.Parent = CoreGui end)
    if not ScreenGui.Parent then
        ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
    end

    -- Blur effect
    local BlurEffect = createProtectedInstance("BlurEffect", {
        Size = 0,
        Parent = game:GetService("Lighting")
    })
    TweenService:Create(BlurEffect, TweenInfo.new(0.3), { Size = 15 }):Play()

    -- Overlay background
    local Overlay = createProtectedInstance("Frame", {
        Name = "Overlay",
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = 0.5,
        BorderSizePixel = 0,
        Parent = ScreenGui
    })

    -- Main Error Frame
    local MainFrame = createProtectedInstance("Frame", {
        Name = "MainFrame",
        Size = UDim2.new(0, 480, 0, 320),
        Position = UDim2.new(0.5, -240, 0.5, -160),
        BackgroundColor3 = Color3.fromRGB(22, 22, 22),
        BorderSizePixel = 0,
        Parent = ScreenGui
    })

    createProtectedInstance("UICorner", {
        CornerRadius = UDim.new(0, 12),
        Parent = MainFrame
    })

    -- Blue Border
    local BorderStroke = createProtectedInstance("UIStroke", {
        Color = Color3.fromRGB(60, 120, 255),
        Thickness = 2,
        Transparency = 0,
        Parent = MainFrame
    })

    -- Header Section
    local Header = createProtectedInstance("Frame", {
        Name = "Header",
        Size = UDim2.new(1, 0, 0, 60),
        BackgroundColor3 = Color3.fromRGB(30, 30, 35),
        BorderSizePixel = 0,
        Parent = MainFrame
    })
    createProtectedInstance("UICorner", { CornerRadius = UDim.new(0, 12), Parent = Header })
    createProtectedInstance("Frame", {
        Size = UDim2.new(1, 0, 0, 20),
        Position = UDim2.new(0, 0, 1, -20),
        BackgroundColor3 = Color3.fromRGB(30, 30, 35),
        BorderSizePixel = 0,
        Parent = Header
    })

    -- Error Icon
    local ErrorIcon = createProtectedInstance("TextLabel", {
        Name = "ErrorIcon",
        Size = UDim2.new(0, 40, 0, 40),
        Position = UDim2.new(0, 15, 0.5, -20),
        BackgroundTransparency = 1,
        Text = "⚠",
        TextColor3 = Color3.fromRGB(255, 80, 80),
        TextSize = 32,
        Font = Enum.Font.GothamBold,
        Parent = Header
    })

    -- Title
    local Title = createProtectedInstance("TextLabel", {
        Name = "Title",
        Size = UDim2.new(1, -120, 0, 30),
        Position = UDim2.new(0, 60, 0, 10),
        BackgroundTransparency = 1,
        Text = "Script Execution Blocked",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 18,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = Header
    })

    -- Subtitle
    local Subtitle = createProtectedInstance("TextLabel", {
        Name = "Subtitle",
        Size = UDim2.new(1, -120, 0, 18),
        Position = UDim2.new(0, 60, 0, 35),
        BackgroundTransparency = 1,
        Text = "Panda Virtual-Storage Safeguard",
        TextColor3 = Color3.fromRGB(120, 140, 180),
        TextSize = 12,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = Header
    })

    -- Close Button (X)
    local CloseButton = createProtectedInstance("TextButton", {
        Name = "CloseButton",
        Size = UDim2.new(0, 35, 0, 35),
        Position = UDim2.new(1, -45, 0.5, -17.5),
        BackgroundColor3 = Color3.fromRGB(40, 40, 45),
        BorderSizePixel = 0,
        Text = "×",
        TextColor3 = Color3.fromRGB(200, 200, 200),
        TextSize = 24,
        Font = Enum.Font.GothamBold,
        Parent = Header
    })
    createProtectedInstance("UICorner", { CornerRadius = UDim.new(0, 8), Parent = CloseButton })

    -- Error Type Label
    local ErrorTypeLabel = createProtectedInstance("TextLabel", {
        Name = "ErrorTypeLabel",
        Size = UDim2.new(1, -40, 0, 20),
        Position = UDim2.new(0, 20, 0, 75),
        BackgroundTransparency = 1,
        Text = "Error Type: " .. (errorType or "UNKNOWN"),
        TextColor3 = Color3.fromRGB(255, 120, 120),
        TextSize = 13,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = MainFrame
    })

    -- Error Message Container
    local MessageContainer = createProtectedInstance("Frame", {
        Name = "MessageContainer",
        Size = UDim2.new(1, -40, 0, 120),
        Position = UDim2.new(0, 20, 0, 105),
        BackgroundColor3 = Color3.fromRGB(30, 30, 35),
        BorderSizePixel = 0,
        Parent = MainFrame
    })
    createProtectedInstance("UICorner", { CornerRadius = UDim.new(0, 10), Parent = MessageContainer })
    createProtectedInstance("UIStroke", {
        Color = Color3.fromRGB(50, 50, 60),
        Thickness = 1,
        Parent = MessageContainer
    })

    -- Error Message Text
    local ErrorMessage = createProtectedInstance("TextLabel", {
        Name = "ErrorMessage",
        Size = UDim2.new(1, -20, 1, -20),
        Position = UDim2.new(0, 10, 0, 10),
        BackgroundTransparency = 1,
        Text = errorMessage,
        TextColor3 = Color3.fromRGB(220, 220, 230),
        TextSize = 13,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
        TextWrapped = true,
        Parent = MessageContainer
    })

    -- Timestamp
    local Timestamp = createProtectedInstance("TextLabel", {
        Name = "Timestamp",
        Size = UDim2.new(1, -40, 0, 18),
        Position = UDim2.new(0, 20, 0, 235),
        BackgroundTransparency = 1,
        Text = "Time: " .. os.date("%Y-%m-%d %H:%M:%S"),
        TextColor3 = Color3.fromRGB(100, 100, 120),
        TextSize = 11,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = MainFrame
    })

    -- Console Log Button
    local ConsoleButton = createProtectedInstance("TextButton", {
        Name = "ConsoleButton",
        Size = UDim2.new(0, 180, 0, 38),
        Position = UDim2.new(0, 20, 1, -55),
        BackgroundColor3 = Color3.fromRGB(50, 100, 200),
        BorderSizePixel = 0,
        Text = "View Console Log",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 13,
        Font = Enum.Font.GothamBold,
        Parent = MainFrame
    })
    createProtectedInstance("UICorner", { CornerRadius = UDim.new(0, 10), Parent = ConsoleButton })

    -- Retry Button
    local RetryButton = createProtectedInstance("TextButton", {
        Name = "RetryButton",
        Size = UDim2.new(0, 120, 0, 38),
        Position = UDim2.new(0, 210, 1, -55),
        BackgroundColor3 = Color3.fromRGB(60, 160, 80),
        BorderSizePixel = 0,
        Text = "Retry",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 13,
        Font = Enum.Font.GothamBold,
        Parent = MainFrame
    })
    createProtectedInstance("UICorner", { CornerRadius = UDim.new(0, 10), Parent = RetryButton })

    -- Dismiss Button
    local DismissButton = createProtectedInstance("TextButton", {
        Name = "DismissButton",
        Size = UDim2.new(0, 120, 0, 38),
        Position = UDim2.new(0, 340, 1, -55),
        BackgroundColor3 = Color3.fromRGB(80, 80, 90),
        BorderSizePixel = 0,
        Text = "Dismiss",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 13,
        Font = Enum.Font.GothamBold,
        Parent = MainFrame
    })
    createProtectedInstance("UICorner", { CornerRadius = UDim.new(0, 10), Parent = DismissButton })

    -- Button Hover Effects
    local function addButtonHover(button, normalColor, hoverColor)
        button.MouseEnter:Connect(function()
            TweenService:Create(button, TweenInfo.new(0.15), { BackgroundColor3 = hoverColor }):Play()
        end)
        button.MouseLeave:Connect(function()
            TweenService:Create(button, TweenInfo.new(0.15), { BackgroundColor3 = normalColor }):Play()
        end)
    end

    addButtonHover(CloseButton, Color3.fromRGB(40, 40, 45), Color3.fromRGB(200, 60, 60))
    addButtonHover(ConsoleButton, Color3.fromRGB(50, 100, 200), Color3.fromRGB(70, 120, 220))
    addButtonHover(RetryButton, Color3.fromRGB(60, 160, 80), Color3.fromRGB(80, 180, 100))
    addButtonHover(DismissButton, Color3.fromRGB(80, 80, 90), Color3.fromRGB(100, 100, 110))

    -- Close/Dismiss functionality
    local function closeGui()
        logToConsole("INFO", "Error GUI dismissed by user")
        TweenService:Create(BlurEffect, TweenInfo.new(0.3), { Size = 0 }):Play()
        TweenService:Create(Overlay, TweenInfo.new(0.3), { BackgroundTransparency = 1 }):Play()
        TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            Size = UDim2.new(0, 480, 0, 0),
            Position = UDim2.new(0.5, -240, 0.5, 0)
        }):Play()

        task.wait(0.35)
        if ScreenGui and ScreenGui.Parent then
            ScreenGui:Destroy()
        end
        if BlurEffect and BlurEffect.Parent then
            BlurEffect:Destroy()
        end
    end

    CloseButton.MouseButton1Click:Connect(closeGui)
    DismissButton.MouseButton1Click:Connect(closeGui)

    -- Console Log Display
    ConsoleButton.MouseButton1Click:Connect(function()
        logToConsole("INFO", "Console log opened by user")

        local consoleText = "=== CONSOLE LOG ===\n\n"
        for _, entry in ipairs(ConsoleLog) do
            consoleText = consoleText .. "[" .. entry.timestamp .. "] " .. entry.level .. ": " .. entry.message .. "\n"
        end
        consoleText = consoleText .. "\n=== END OF LOG ==="

        -- Show console in a new frame
        local ConsoleFrame = createProtectedInstance("Frame", {
            Name = "ConsoleFrame",
            Size = UDim2.new(0, 450, 0, 280),
            Position = UDim2.new(0.5, -225, 0.5, -140),
            BackgroundColor3 = Color3.fromRGB(18, 18, 18),
            BorderSizePixel = 0,
            ZIndex = 10,
            Parent = ScreenGui
        })
        createProtectedInstance("UICorner", { CornerRadius = UDim.new(0, 10), Parent = ConsoleFrame })
        createProtectedInstance("UIStroke", {
            Color = Color3.fromRGB(60, 120, 255),
            Thickness = 2,
            Parent = ConsoleFrame
        })

        local ConsoleTitle = createProtectedInstance("TextLabel", {
            Size = UDim2.new(1, 0, 0, 40),
            BackgroundColor3 = Color3.fromRGB(25, 25, 30),
            BorderSizePixel = 0,
            Text = "Developer Console Log",
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextSize = 16,
            Font = Enum.Font.GothamBold,
            Parent = ConsoleFrame
        })
        createProtectedInstance("UICorner", { CornerRadius = UDim.new(0, 10), Parent = ConsoleTitle })
        createProtectedInstance("Frame", {
            Size = UDim2.new(1, 0, 0, 10),
            Position = UDim2.new(0, 0, 1, -10),
            BackgroundColor3 = Color3.fromRGB(25, 25, 30),
            BorderSizePixel = 0,
            Parent = ConsoleTitle
        })

        local ConsoleScroll = createProtectedInstance("ScrollingFrame", {
            Size = UDim2.new(1, -20, 1, -90),
            Position = UDim2.new(0, 10, 0, 50),
            BackgroundColor3 = Color3.fromRGB(25, 25, 30),
            BorderSizePixel = 0,
            ScrollBarThickness = 6,
            CanvasSize = UDim2.new(0, 0, 0, 0),
            Parent = ConsoleFrame
        })
        createProtectedInstance("UICorner", { CornerRadius = UDim.new(0, 8), Parent = ConsoleScroll })

        local ConsoleText = createProtectedInstance("TextLabel", {
            Size = UDim2.new(1, -10, 1, 0),
            Position = UDim2.new(0, 5, 0, 5),
            BackgroundTransparency = 1,
            Text = consoleText,
            TextColor3 = Color3.fromRGB(200, 200, 210),
            TextSize = 11,
            Font = Enum.Font.Code,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Top,
            TextWrapped = true,
            AutomaticSize = Enum.AutomaticSize.Y,
            Parent = ConsoleScroll
        })

        ConsoleScroll.CanvasSize = UDim2.new(0, 0, 0, ConsoleText.AbsoluteSize.Y + 10)

        local CloseConsole = createProtectedInstance("TextButton", {
            Size = UDim2.new(0, 100, 0, 30),
            Position = UDim2.new(0.5, -50, 1, -40),
            BackgroundColor3 = Color3.fromRGB(80, 80, 90),
            Text = "Close",
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextSize = 13,
            Font = Enum.Font.GothamBold,
            Parent = ConsoleFrame
        })
        createProtectedInstance("UICorner", { CornerRadius = UDim.new(0, 8), Parent = CloseConsole })

        CloseConsole.MouseButton1Click:Connect(function()
            ConsoleFrame:Destroy()
        end)
    end)

    -- Retry functionality (placeholder - developer can customize)
    RetryButton.MouseButton1Click:Connect(function()
        logToConsole("INFO", "Retry button clicked - reloading script")
        closeGui()
        -- Developer can add retry logic here
    end)

    -- Entrance Animation
    MainFrame.BackgroundTransparency = 1
    MainFrame.Size = UDim2.new(0, 480, 0, 0)
    MainFrame.Position = UDim2.new(0.5, -240, 0.5, 0)

    TweenService:Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 480, 0, 320),
        Position = UDim2.new(0.5, -240, 0.5, -160),
        BackgroundTransparency = 0
    }):Play()
end

-- Replace KickScript function
function KickScript(message)
    -- Instead of kicking, show professional error GUI
    local errorType = "EXECUTION_BLOCKED"

    -- Detect error type from message
    if string.find(message, "Script isn't found") or string.find(message, "deleted") then
        errorType = "SCRIPT_NOT_FOUND"
    elseif string.find(message, "Script-Integrity") then
        errorType = "INTEGRITY_FAILURE"
    elseif string.find(message, "Missing Parameter") then
        errorType = "INVALID_PARAMETERS"
    elseif string.find(message, "Unsupported Client") or string.find(message, "does not support") then
        errorType = "UNSUPPORTED_EXECUTOR"
    elseif string.find(message, "HTTP") or string.find(message, "request") or string.find(message, "network") then
        errorType = "NETWORK_ERROR"
    elseif string.find(message, "loadstring") then
        errorType = "MISSING_LOADSTRING"
    elseif string.find(message, "execution error") or string.find(message, "Script execution") then
        errorType = "SCRIPT_ERROR"
    elseif string.find(message, "response") or string.find(message, "Server") then
        errorType = "SERVER_ERROR"
    end

    createErrorGui(message, errorType)
end

-- ==================== EXECUTOR COMPATIBILITY CHECK ====================
local function getRequestFunction()
    if syn and syn.request then
        return syn.request, "syn.request"
    elseif http and http.request then
        return http.request, "http.request"
    elseif request then
        return request, "request"
    elseif http_request then
        return http_request, "http_request"
    end
    return nil, nil
end

local function getExecutorId()
    local executorId = nil
    local executorSource = "unknown"

    -- Try identifyexecutor first
    if identifyexecutor then
        local ok, result = pcall(identifyexecutor)
        if ok and result then
            executorId = result
            executorSource = "identifyexecutor()"
        end
    end

    -- Fallback to getexecutorname
    if not executorId and getexecutorname then
        local ok, result = pcall(getexecutorname)
        if ok and result then
            executorId = result
            executorSource = "getexecutorname()"
        end
    end

    -- Fallback to generic
    if not executorId then
        executorId = "Generic Executor"
        executorSource = "fallback"
    end

    return executorId, executorSource
end

local function getHWID()
    local hwid = nil
    local hwidSource = "unknown"

    -- Try gethwid first
    if gethwid then
        local ok, result = pcall(gethwid)
        if ok and result then
            hwid = result
            hwidSource = "gethwid()"
        end
    end

    -- Fallback to RbxAnalyticsService
    if not hwid then
        local ok, result = pcall(function()
            return tostring(game:GetService("RbxAnalyticsService"):GetClientId()):gsub("-", "")
        end)
        if ok and result then
            hwid = result
            hwidSource = "RbxAnalyticsService"
        end
    end

    -- Final fallback - generate pseudo-HWID
    if not hwid then
        hwid = "FALLBACK-" .. tostring(HttpService:GenerateGUID(false))
        hwidSource = "generated-fallback"
    end

    return hwid, hwidSource
end

-- Helper function to get table keys for debugging
local function getTableKeys(tbl)
    local keys = {}
    for k, _ in pairs(tbl) do
        table.insert(keys, tostring(k))
    end
    return keys
end

-- ==================== MAIN SCRIPT LOGIC ====================

logToConsole("INFO", "Forbidden Script Handler initialized")

-- Check executor compatibility
local executorId, executorSource = getExecutorId()
logToConsole("DEBUG", "Executor: " .. executorId .. " (Source: " .. executorSource .. ")")

local hwid, hwidSource = getHWID()
logToConsole("DEBUG", "HWID: " .. string.sub(hwid, 1, 16) .. "... (Source: " .. hwidSource .. ")")

local requestFunc, requestSource = getRequestFunction()
if not requestFunc then
    logToConsole("ERROR", "No HTTP request function available in this executor")
    KickScript("This executor does not support HTTP requests.\n\nMissing functions: request(), http.request(), syn.request(), http_request()\n\nPlease use a different executor that supports network requests.")
    return
end
logToConsole("DEBUG", "Request Function: " .. requestSource)

-- Verify required functions
local missingFunctions = {}

if not identifyexecutor and not getexecutorname then
    table.insert(missingFunctions, "identifyexecutor() / getexecutorname()")
    logToConsole("WARN", "No executor identification function found")
end

if not gethwid then
    table.insert(missingFunctions, "gethwid()")
    logToConsole("WARN", "gethwid() not available, using fallback")
end

if not loadstring then
    table.insert(missingFunctions, "loadstring()")
    logToConsole("ERROR", "loadstring() not available - cannot execute remote scripts")
    KickScript("This executor does not support loadstring().\n\nCannot execute remote scripts without loadstring support.\n\nPlease use a different executor.")
    return
end

if #missingFunctions > 0 then
    logToConsole("WARN", "Missing functions detected: " .. table.concat(missingFunctions, ", "))
    logToConsole("WARN", "Continuing with fallback methods...")
end

-- Main verification logic
if Verification_Status ~= nil then
    if Verification_Status == 2 and SlugID ~= nil then
        -- This will attempt to run the script in POST-Mode
        logToConsole("INFO", "Attempting POST-Mode script execution")
        logToConsole("DEBUG", "SlugID: " .. SlugID)

        -- Prepare headers with compatibility checks
        local headers = {
            ["executorId"] = executorId,
            ["hwid"] = hwid,
            ["User-Agent"] = "PandaVSS/1.0",
            ["X-Executor-Source"] = executorSource,
            ["X-HWID-Source"] = hwidSource
        }

        logToConsole("DEBUG", "Making POST request to virtual storage...")

        -- Perform HTTP request with error handling
        local requestOk, DataFetch = pcall(function()
            return requestFunc({
                Url = "https://pandadevelopment.net/virtual/file/" .. SlugID,
                Method = "POST",
                Headers = headers
            })
        end)

        if not requestOk then
            -- Request function threw an error
            logToConsole("ERROR", "HTTP request failed: " .. tostring(DataFetch))
            KickScript("Failed to make HTTP request to server.\n\nError: " .. tostring(DataFetch) .. "\n\nThis could be due to:\n• Network connectivity issues\n• Executor HTTP restrictions\n• Server unavailability")
            return
        end

        if not DataFetch then
            logToConsole("ERROR", "HTTP request returned nil")
            KickScript("HTTP request returned no response.\n\nPlease check your internet connection and try again.")
            return
        end

        -- Check response structure
        if type(DataFetch) ~= "table" then
            logToConsole("ERROR", "Invalid response type: " .. type(DataFetch))
            KickScript("Invalid HTTP response format.\n\nExpected table, got " .. type(DataFetch) .. "\n\nThis executor may have incompatible HTTP implementation.")
            return
        end

        -- Check Success field
        if DataFetch.Success == nil then
            logToConsole("ERROR", "Response missing Success field")
            logToConsole("DEBUG", "Response keys: " .. table.concat(getTableKeys(DataFetch), ", "))
            KickScript("Invalid server response structure.\n\nMissing 'Success' field in response.\n\nPlease contact script developer.")
            return
        end

        if DataFetch.Success then
            -- Check if Body exists
            if not DataFetch.Body then
                logToConsole("ERROR", "Success response missing Body field")
                KickScript("Server returned success but no script content.\n\nMissing 'Body' field in response.\n\nPlease contact script developer.")
                return
            end

            logToConsole("INFO", "Script fetched successfully (" .. string.len(DataFetch.Body) .. " bytes)")
            logToConsole("INFO", "Executing remote script...")

            -- Execute the script with error handling
            local executeOk, executeErr = pcall(function()
                loadstring(DataFetch.Body)()
            end)

            if not executeOk then
                logToConsole("ERROR", "Script execution failed: " .. tostring(executeErr))
                KickScript("Script execution error.\n\nError: " .. tostring(executeErr) .. "\n\nPlease contact script developer.")
            else
                logToConsole("INFO", "Script executed successfully!")
            end
        else
            -- Request failed - check for error details
            local errorMsg = "Failed to retrieve script from server."
            local statusCode = DataFetch.StatusCode or "Unknown"

            if DataFetch.Body then
                -- Try to parse error message from body
                local bodyOk, bodyData = pcall(function()
                    return HttpService:JSONDecode(DataFetch.Body)
                end)

                if bodyOk and bodyData and bodyData.error then
                    errorMsg = errorMsg .. "\n\nServer Error: " .. tostring(bodyData.error)
                elseif type(DataFetch.Body) == "string" then
                    errorMsg = errorMsg .. "\n\nServer Response: " .. string.sub(DataFetch.Body, 1, 200)
                end
            end

            errorMsg = errorMsg .. "\n\nStatus Code: " .. tostring(statusCode)

            logToConsole("ERROR", "HTTP request failed with status " .. tostring(statusCode))
            logToConsole("DEBUG", "Response body: " .. tostring(DataFetch.Body))
            KickScript(errorMsg)
        end
    elseif Verification_Status == 4 then
        -- Script Not Found
        logToConsole("ERROR", "Script not found on server (Status: 4)")
        KickScript("The Following Script isn't found on the Server or it was already deleted")
    elseif Verification_Status == 3 then
        -- User had to Execute the GET-Mode before POST-Mode
        logToConsole("ERROR", "Integrity check failed (Status: 3)")
        KickScript("Failed to Verify Script-Integrity, Please Run the Script again, Make sure you're using loadstring")
    else
        logToConsole("ERROR", "Invalid verification status: " .. tostring(Verification_Status))
        KickScript("Missing Parameter / Invalid Verification Status")
    end
else
    logToConsole("ERROR", "Verification_Status is nil")
    KickScript("Unsupported Client Execution (" .. executorId .. ")/ Invalid Verification Status")
end
