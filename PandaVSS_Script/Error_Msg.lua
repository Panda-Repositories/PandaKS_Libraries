-- Create Error Popup GUI
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TitleBar = Instance.new("Frame")
local TitleText = Instance.new("TextLabel")
local ContentFrame = Instance.new("Frame")
local MessageText = Instance.new("TextLabel")
local ButtonsFrame = Instance.new("Frame")
local DiagnosticButton = Instance.new("TextButton")
local CloseButton = Instance.new("TextButton")
local IconFrame = Instance.new("Frame")
local IconLabel = Instance.new("TextLabel")

-- Set parent
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.DisplayOrder = 10

-- Main Frame
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -120)
MainFrame.Size = UDim2.new(0, 400, 0, 240)
MainFrame.ClipsDescendants = true

-- Add rounded corners
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = MainFrame

-- Add subtle shadow
local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(40, 40, 40)
UIStroke.Thickness = 2
UIStroke.Parent = MainFrame

-- Title Bar
TitleBar.Name = "TitleBar"
TitleBar.Parent = MainFrame
TitleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TitleBar.BorderSizePixel = 0
TitleBar.Size = UDim2.new(1, 0, 0, 40)

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
TitleText.Position = UDim2.new(0, 45, 0, 0)
TitleText.Size = UDim2.new(1, -50, 1, 0)
TitleText.Font = Enum.Font.SourceSansBold
TitleText.Text = "Connection Error"
TitleText.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleText.TextSize = 18
TitleText.TextXAlignment = Enum.TextXAlignment.Left

-- Icon Frame
IconFrame.Name = "IconFrame"
IconFrame.Parent = TitleBar
IconFrame.BackgroundTransparency = 1
IconFrame.Size = UDim2.new(0, 40, 1, 0)

-- Warning Icon
IconLabel.Name = "IconLabel"
IconLabel.Parent = IconFrame
IconLabel.BackgroundTransparency = 1
IconLabel.Position = UDim2.new(0, 10, 0, 0)
IconLabel.Size = UDim2.new(1, -10, 1, 0)
IconLabel.Font = Enum.Font.SourceSansBold
IconLabel.Text = "⚠️"
IconLabel.TextColor3 = Color3.fromRGB(255, 200, 0)
IconLabel.TextSize = 22

-- Content Frame
ContentFrame.Name = "ContentFrame"
ContentFrame.Parent = MainFrame
ContentFrame.BackgroundTransparency = 1
ContentFrame.Position = UDim2.new(0, 0, 0, 40)
ContentFrame.Size = UDim2.new(1, 0, 1, -90)

-- Message Box
local MessageBox = Instance.new("Frame")
MessageBox.Name = "MessageBox"
MessageBox.Parent = ContentFrame
MessageBox.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
MessageBox.BorderSizePixel = 0
MessageBox.Position = UDim2.new(0.5, -180, 0.5, -60)
MessageBox.Size = UDim2.new(0, 360, 0, 120)

local MessageBoxCorner = Instance.new("UICorner")
MessageBoxCorner.CornerRadius = UDim.new(0, 6)
MessageBoxCorner.Parent = MessageBox

-- Message Text
MessageText.Name = "MessageText"
MessageText.Parent = MessageBox
MessageText.BackgroundTransparency = 1
MessageText.Position = UDim2.new(0, 15, 0, 15)
MessageText.Size = UDim2.new(1, -30, 1, -30)
MessageText.Font = Enum.Font.SourceSans
MessageText.Text = "Unable to obtain the Script. There is something wrong with the Server or the Client (Executor) is unable to fetch it from the Server. Please Run Diagnostic Setup or just close."
MessageText.TextColor3 = Color3.fromRGB(230, 230, 230)
MessageText.TextSize = 16
MessageText.TextWrapped = true
MessageText.TextYAlignment = Enum.TextYAlignment.Top

-- Buttons Frame
ButtonsFrame.Name = "ButtonsFrame"
ButtonsFrame.Parent = MainFrame
ButtonsFrame.BackgroundTransparency = 1
ButtonsFrame.Position = UDim2.new(0, 0, 1, -50)
ButtonsFrame.Size = UDim2.new(1, 0, 0, 50)

-- Style button function
local function styleButton(button, text, position, color, width)
    button.Name = button.Name
    button.Parent = ButtonsFrame
    button.BackgroundColor3 = color
    button.BorderSizePixel = 0
    button.Position = position
    button.Size = UDim2.new(0, width, 0, 36)
    button.Font = Enum.Font.SourceSansBold
    button.Text = text
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 14
    button.AutoButtonColor = true
    
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 6)
    buttonCorner.Parent = button
    
    return button
end

-- Close Button - Left side
CloseButton = styleButton(
    Instance.new("TextButton"),
    "Close",
    UDim2.new(0, 20, 0.5, -18),
    Color3.fromRGB(180, 60, 60),
    140
)

-- Diagnostic Button - Right side
DiagnosticButton = styleButton(
    Instance.new("TextButton"),
    "Run Diagnostic Setup",
    UDim2.new(1, -160, 0.5, -18),
    Color3.fromRGB(0, 120, 180),
    140
)

-- Button hover effects
local function buttonHoverEffect(button, defaultColor, hoverColor)
    button.MouseEnter:Connect(function()
        button.BackgroundColor3 = hoverColor
    end)
    
    button.MouseLeave:Connect(function()
        button.BackgroundColor3 = defaultColor
    end)
end

buttonHoverEffect(DiagnosticButton, Color3.fromRGB(0, 120, 180), Color3.fromRGB(0, 140, 210))
buttonHoverEffect(CloseButton, Color3.fromRGB(180, 60, 60), Color3.fromRGB(210, 70, 70))

-- Add button click effects
DiagnosticButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
    -- Add your diagnostic setup code here
    print("Running diagnostic setup...")
    -- This is where you would launch your diagnostic tool
end)

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Add subtle animation effect
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -400)

-- Slide in animation
local tweenService = game:GetService("TweenService")
local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
local tween = tweenService:Create(MainFrame, tweenInfo, {Position = UDim2.new(0.5, -200, 0.5, -120)})
tween:Play()

-- Make popup draggable
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