-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local DropShadowHolder = Instance.new("Frame")
local DropShadow = Instance.new("ImageLabel")
local Frame_2 = Instance.new("Frame")
local Frame_3 = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local TextLabel = Instance.new("TextLabel")
local TextBox = Instance.new("TextBox")
local GetKey = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
local Login = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local Copyright = Instance.new("TextLabel")
local TextLabel_2 = Instance.new("TextLabel")
local UICorner_4 = Instance.new("UICorner")

--Properties:

ScreenGui.Parent = gethui()
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 29)
Frame.BackgroundTransparency = 0.010
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
Frame.Size = UDim2.new(0, 442, 0, 252)

DropShadowHolder.Name = "DropShadowHolder"
DropShadowHolder.Parent = Frame
DropShadowHolder.BackgroundTransparency = 1.000
DropShadowHolder.BorderSizePixel = 0
DropShadowHolder.Size = UDim2.new(1, 0, 1, 0)
DropShadowHolder.ZIndex = 0

DropShadow.Name = "DropShadow"
DropShadow.Parent = DropShadowHolder
DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
DropShadow.BackgroundTransparency = 1.000
DropShadow.BorderSizePixel = 0
DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
DropShadow.Size = UDim2.new(1, 47, 1, 47)
DropShadow.ZIndex = 0
DropShadow.Image = "rbxassetid://6014261993"
DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
DropShadow.ImageTransparency = 0.500
DropShadow.ScaleType = Enum.ScaleType.Slice
DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)

Frame_2.Parent = Frame
Frame_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame_2.BackgroundTransparency = 0.700
Frame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame_2.BorderSizePixel = 0
Frame_2.Position = UDim2.new(0, 0, 0.699999988, 0)
Frame_2.Size = UDim2.new(0, 442, 0, 1)

Frame_3.Parent = Frame
Frame_3.BackgroundColor3 = Color3.fromRGB(20, 20, 29)
Frame_3.BackgroundTransparency = 0.500
Frame_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame_3.BorderSizePixel = 0
Frame_3.Position = UDim2.new(0.0678733066, 0, 0.198412701, 0)
Frame_3.Size = UDim2.new(0, 384, 0, 47)

UICorner.CornerRadius = UDim.new(0, 4)
UICorner.Parent = Frame_3

TextLabel.Parent = Frame_3
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Size = UDim2.new(0, 46, 0, 20)
TextLabel.Font = Enum.Font.Ubuntu
TextLabel.Text = "Key"
TextLabel.TextColor3 = Color3.fromRGB(200, 200, 209)
TextLabel.TextSize = 14.000

TextBox.Parent = Frame_3
TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox.BackgroundTransparency = 1.000
TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextBox.BorderSizePixel = 0
TextBox.Position = UDim2.new(0.03125, 0, 0.186929911, 0)
TextBox.Size = UDim2.new(0, 372, 0, 41)
TextBox.Font = Enum.Font.Sarpanch
TextBox.PlaceholderText = "[ Powered by PandaAuth ]"
TextBox.Text = "FREE_awfawf87awf8a7fafa"
TextBox.TextColor3 = Color3.fromRGB(200, 200, 209)
TextBox.TextSize = 15.000
TextBox.TextXAlignment = Enum.TextXAlignment.Left

GetKey.Name = "GetKey"
GetKey.Parent = Frame
GetKey.BackgroundColor3 = Color3.fromRGB(20, 20, 29)
GetKey.BackgroundTransparency = 0.500
GetKey.BorderColor3 = Color3.fromRGB(0, 0, 0)
GetKey.BorderSizePixel = 0
GetKey.Position = UDim2.new(0.0678733066, 0, 0.460317463, 0)
GetKey.Size = UDim2.new(0, 170, 0, 45)
GetKey.Font = Enum.Font.Ubuntu
GetKey.Text = "Get Key"
GetKey.TextColor3 = Color3.fromRGB(200, 200, 209)
GetKey.TextSize = 14.000

UICorner_2.CornerRadius = UDim.new(0, 6)
UICorner_2.Parent = GetKey

Login.Name = "Login"
Login.Parent = Frame
Login.BackgroundColor3 = Color3.fromRGB(20, 20, 29)
Login.BackgroundTransparency = 0.500
Login.BorderColor3 = Color3.fromRGB(0, 0, 0)
Login.BorderSizePixel = 0
Login.Position = UDim2.new(0.552036226, 0, 0.460317463, 0)
Login.Size = UDim2.new(0, 170, 0, 45)
Login.Font = Enum.Font.Ubuntu
Login.Text = "Log-in"
Login.TextColor3 = Color3.fromRGB(200, 200, 209)
Login.TextSize = 14.000

UICorner_3.CornerRadius = UDim.new(0, 6)
UICorner_3.Parent = Login

Copyright.Name = "Copyright"
Copyright.Parent = Frame
Copyright.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Copyright.BackgroundTransparency = 1.000
Copyright.BorderColor3 = Color3.fromRGB(0, 0, 0)
Copyright.BorderSizePixel = 0
Copyright.Position = UDim2.new(0.0339366533, 0, 0.75, 0)
Copyright.Size = UDim2.new(0, 414, 0, 50)
Copyright.Font = Enum.Font.Code
Copyright.Text = "In order to get acess to script you will need to buy or get a new key throught the KeySystem\n\nPowered By Panda Development - 2025 ©"
Copyright.TextColor3 = Color3.fromRGB(150, 150, 159)
Copyright.TextSize = 12.000
Copyright.TextWrapped = true
Copyright.TextXAlignment = Enum.TextXAlignment.Left
Copyright.TextYAlignment = Enum.TextYAlignment.Top

TextLabel_2.Parent = Frame
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_2.BorderSizePixel = 0
TextLabel_2.Size = UDim2.new(0, 442, 0, 50)
TextLabel_2.Font = Enum.Font.GothamMedium
TextLabel_2.Text = "Cool Hub | Keysystem"
TextLabel_2.TextColor3 = Color3.fromRGB(200, 200, 209)
TextLabel_2.TextSize = 15.000

UICorner_4.CornerRadius = UDim.new(0, 4)
UICorner_4.Parent = Frame

return ScreenGui, TextBox, Login, GetKey, TextLabel_2
