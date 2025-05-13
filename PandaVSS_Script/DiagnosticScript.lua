print('Panda Testing Console')
print('__________________________________________________')
print('Executor: ' .. identifyexecutor())

-- Create GUI
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TitleBar = Instance.new("Frame")
local TitleText = Instance.new("TextLabel")
local CloseButton = Instance.new("TextButton")
local ContentFrame = Instance.new("Frame")
local ExecutorLabel = Instance.new("TextLabel")
local ExecutorValue = Instance.new("TextLabel")
local AgentLabel = Instance.new("TextLabel")
local AgentValue = Instance.new("TextLabel")
local AgentWarning = Instance.new("TextLabel")
local WebsocketLabel = Instance.new("TextLabel")
local WebsocketValue = Instance.new("TextLabel")
local StatusLabel = Instance.new("TextLabel")
local Separator = Instance.new("Frame")
local FooterLabel = Instance.new("TextLabel")

-- Set parent
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Main Frame
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -175)
MainFrame.Size = UDim2.new(0, 500, 0, 350)
MainFrame.ClipsDescendants = true

-- Add shadow effect
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = MainFrame

-- Title Bar
TitleBar.Name = "TitleBar"
TitleBar.Parent = MainFrame
TitleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TitleBar.BorderSizePixel = 0
TitleBar.Size = UDim2.new(1, 0, 0, 45)

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 8)
TitleCorner.Parent = TitleBar

-- Fix the corner overlap
local CornerFix = Instance.new("Frame")
CornerFix.Name = "CornerFix"
CornerFix.Parent = TitleBar
CornerFix.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
CornerFix.BorderSizePixel = 0
CornerFix.Position = UDim2.new(0, 0, 1, -8)
CornerFix.Size = UDim2.new(1, 0, 0, 8)

-- Title Text
TitleText.Name = "TitleText"
TitleText.Parent = TitleBar
TitleText.BackgroundTransparency = 1
TitleText.Position = UDim2.new(0, 15, 0, 0)
TitleText.Size = UDim2.new(1, -50, 1, 0)
TitleText.Font = Enum.Font.SourceSansBold
TitleText.Text = "Panda Diagnostic Report - Agent Monitor"
TitleText.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleText.TextSize = 18
TitleText.TextXAlignment = Enum.TextXAlignment.Left

-- Close Button
CloseButton.Name = "CloseButton"
CloseButton.Parent = TitleBar
CloseButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
CloseButton.Position = UDim2.new(1, -35, 0.5, -12)
CloseButton.Size = UDim2.new(0, 24, 0, 24)
CloseButton.Font = Enum.Font.SourceSansBold
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 14
CloseButton.AutoButtonColor = true

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 4)
CloseCorner.Parent = CloseButton

-- Content Frame
ContentFrame.Name = "ContentFrame"
ContentFrame.Parent = MainFrame
ContentFrame.BackgroundTransparency = 1
ContentFrame.Position = UDim2.new(0, 0, 0, 45)
ContentFrame.Size = UDim2.new(1, 0, 1, -45)

-- Data box style function
local function styleDataBox(frame, position)
    local dataBox = Instance.new("Frame")
    dataBox.Name = "DataBox"
    dataBox.Parent = frame
    dataBox.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
    dataBox.BorderSizePixel = 0
    dataBox.Position = position
    dataBox.Size = UDim2.new(0, 460, 0, 60)
    
    local boxCorner = Instance.new("UICorner")
    boxCorner.CornerRadius = UDim.new(0, 6)
    boxCorner.Parent = dataBox
    
    return dataBox
end

-- Executor Box
local executorBox = styleDataBox(ContentFrame, UDim2.new(0.5, -230, 0, 20))

-- Executor Label
ExecutorLabel.Name = "ExecutorLabel"
ExecutorLabel.Parent = executorBox
ExecutorLabel.BackgroundTransparency = 1
ExecutorLabel.Position = UDim2.new(0, 15, 0, 8)
ExecutorLabel.Size = UDim2.new(0, 100, 0, 20)
ExecutorLabel.Font = Enum.Font.SourceSansBold
ExecutorLabel.Text = "EXECUTOR"
ExecutorLabel.TextColor3 = Color3.fromRGB(255, 200, 100)
ExecutorLabel.TextSize = 14
ExecutorLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Executor Value
ExecutorValue.Name = "ExecutorValue"
ExecutorValue.Parent = executorBox
ExecutorValue.BackgroundTransparency = 1
ExecutorValue.Position = UDim2.new(0, 15, 0, 30)
ExecutorValue.Size = UDim2.new(1, -30, 0, 22)
ExecutorValue.Font = Enum.Font.SourceSans
ExecutorValue.Text = identifyexecutor() or "Unknown"
ExecutorValue.TextColor3 = Color3.fromRGB(230, 230, 230)
ExecutorValue.TextSize = 16
ExecutorValue.TextXAlignment = Enum.TextXAlignment.Left

-- Agent Box
local agentBox = styleDataBox(ContentFrame, UDim2.new(0.5, -230, 0, 95))

-- Agent Label
AgentLabel.Name = "AgentLabel"
AgentLabel.Parent = agentBox
AgentLabel.BackgroundTransparency = 1
AgentLabel.Position = UDim2.new(0, 15, 0, 8)
AgentLabel.Size = UDim2.new(0, 100, 0, 20)
AgentLabel.Font = Enum.Font.SourceSansBold
AgentLabel.Text = "USER-AGENT"
AgentLabel.TextColor3 = Color3.fromRGB(255, 200, 100)
AgentLabel.TextSize = 14
AgentLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Agent Value
AgentValue.Name = "AgentValue"
AgentValue.Parent = agentBox
AgentValue.BackgroundTransparency = 1
AgentValue.Position = UDim2.new(0, 15, 0, 30)
AgentValue.Size = UDim2.new(1, -30, 0, 22)
AgentValue.Font = Enum.Font.SourceSans
AgentValue.Text = "Retrieving..."
AgentValue.TextColor3 = Color3.fromRGB(230, 230, 230)
AgentValue.TextSize = 14
AgentValue.TextXAlignment = Enum.TextXAlignment.Left
AgentValue.TextWrapped = true

-- Agent Warning
AgentWarning.Name = "AgentWarning"
AgentWarning.Parent = ContentFrame
AgentWarning.BackgroundColor3 = Color3.fromRGB(60, 30, 30)
AgentWarning.BorderSizePixel = 0
AgentWarning.Position = UDim2.new(0.5, -230, 0, 160)
AgentWarning.Size = UDim2.new(0, 460, 0, 30)
AgentWarning.Font = Enum.Font.SourceSansItalic
AgentWarning.Text = "  ⚠️  Warning: Panda VSS may false-block this Executor"
AgentWarning.TextColor3 = Color3.fromRGB(255, 180, 100)
AgentWarning.TextSize = 14
AgentWarning.TextXAlignment = Enum.TextXAlignment.Left
AgentWarning.Visible = false

local warningCorner = Instance.new("UICorner")
warningCorner.CornerRadius = UDim.new(0, 6)
warningCorner.Parent = AgentWarning

-- Websocket Box
local websocketBox = styleDataBox(ContentFrame, UDim2.new(0.5, -230, 0, 200))

-- Websocket Label
WebsocketLabel.Name = "WebsocketLabel"
WebsocketLabel.Parent = websocketBox
WebsocketLabel.BackgroundTransparency = 1
WebsocketLabel.Position = UDim2.new(0, 15, 0, 8)
WebsocketLabel.Size = UDim2.new(0, 100, 0, 20)
WebsocketLabel.Font = Enum.Font.SourceSansBold
WebsocketLabel.Text = "WEBSOCKET"
WebsocketLabel.TextColor3 = Color3.fromRGB(255, 200, 100)
WebsocketLabel.TextSize = 14
WebsocketLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Websocket Value
WebsocketValue.Name = "WebsocketValue"
WebsocketValue.Parent = websocketBox
WebsocketValue.BackgroundTransparency = 1
WebsocketValue.Position = UDim2.new(0, 15, 0, 30)
WebsocketValue.Size = UDim2.new(1, -30, 0, 22)
WebsocketValue.Font = Enum.Font.SourceSans
WebsocketValue.Text = "Checking..."
WebsocketValue.TextColor3 = Color3.fromRGB(230, 230, 230)
WebsocketValue.TextSize = 16
WebsocketValue.TextXAlignment = Enum.TextXAlignment.Left

-- Status Label
StatusLabel.Name = "StatusLabel"
StatusLabel.Parent = ContentFrame
StatusLabel.BackgroundTransparency = 1
StatusLabel.Position = UDim2.new(0, 20, 0, 265)
StatusLabel.Size = UDim2.new(1, -40, 0, 20)
StatusLabel.Font = Enum.Font.SourceSansBold
StatusLabel.Text = "Retrieving information..."
StatusLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
StatusLabel.TextSize = 14
StatusLabel.TextXAlignment = Enum.TextXAlignment.Center

-- Separator
Separator.Name = "Separator"
Separator.Parent = ContentFrame
Separator.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Separator.BorderSizePixel = 0
Separator.Position = UDim2.new(0.1, 0, 0, 290)
Separator.Size = UDim2.new(0.8, 0, 0, 1)

-- Footer Label
FooterLabel.Name = "FooterLabel"
FooterLabel.Parent = ContentFrame
FooterLabel.BackgroundTransparency = 1
FooterLabel.Position = UDim2.new(0, 20, 0, 300)
FooterLabel.Size = UDim2.new(1, -40, 0, 40)
FooterLabel.Font = Enum.Font.SourceSans
FooterLabel.Text = "Please take a screenshot of this report and submit it to the Panda-Pelican Developer for further investigation. Thank you for your assistance."
FooterLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
FooterLabel.TextSize = 14
FooterLabel.TextWrapped = true
FooterLabel.TextXAlignment = Enum.TextXAlignment.Center

-- Make frame draggable
local UserInputService = game:GetService("UserInputService")
local dragging
local dragInput
local dragStart
local startPos

local function updateDrag(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

TitleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

TitleBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        updateDrag(input)
    end
end)

-- Close button functionality
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Check WebSocket support
local function checkWebSocket()
    local success, result = pcall(function()
        if WebSocket and WebSocket.connect then
            return true
        end
        return false
    end)
    
    return success and result
end

-- Update WebSocket status
local wsSupported = checkWebSocket()
if wsSupported then
    WebsocketValue.Text = "Supported ✓"
    WebsocketValue.TextColor3 = Color3.fromRGB(100, 255, 100)
else
    WebsocketValue.Text = "Not Supported ✗"
    WebsocketValue.TextColor3 = Color3.fromRGB(255, 150, 150)
end

-- Try to get User-Agent using multiple methods
local function getUserAgent()
    -- Try HttpGet first
    local success, response = pcall(function()
        return game:HttpGet("https://pandadevelopment.net/agentinfo/getagentinfo")
    end)
    
    if success then
        return response, true
    end
    return "Unknown (using executor: " .. identifyexecutor() .. ")", false
end

-- Get and display User-Agent
local userAgent, success = getUserAgent()
AgentValue.Text = userAgent

if success then
    AgentValue.TextColor3 = Color3.fromRGB(230, 230, 230)
    
    -- Check for Chrome or Firefox
    if string.match(userAgent:lower(), "chrome") or string.match(userAgent:lower(), "firefox") then
        AgentWarning.Visible = true
    end
else
    AgentValue.TextColor3 = Color3.fromRGB(255, 150, 150)
end

-- Update status
if success then
    StatusLabel.Text = "Information retrieved successfully"
    StatusLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
else
    StatusLabel.Text = "Partial information retrieved"
    StatusLabel.TextColor3 = Color3.fromRGB(255, 200, 100)
end

print('__________________________________________________')