local PandaV2_Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Panda-Repositories/PandaKS_Libraries/main/library/LuaLib/ROBLOX/PandaBetaLib.lua"))()
local isDeveloperModeOn = true -- Set initial state to true
local isESPModeOn = false -- Set initial state to true
local isAntiAFKToggle = true -- Set initial state to true
local isFPSUnlockOn = true -- Set initial state to true
local _setclipboard = clonefunction(setclipboard);

local _request = clonefunction(request);
local _base64decode = clonefunction(crypt.base64.decode);


function Authenticate_Evon(key)
    local Identifier_name = "evon"
    if PandaV2_Library:ValidateKey(Identifier_name, key) then
        return true
    else
        return false
    end
end

function Generate_Key()
    local URLLink = PandaV2_Library:GetKey(Identifier_name)
    setclipboard(URLLink)
end

local Evon = Instance.new("ScreenGui")
local Controls = Instance.new("Frame")
local Separator = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIPadding = Instance.new("UIPadding")
local EvonLogo = Instance.new("ImageButton")
local BtnContainer = Instance.new("Frame")
local Editor = Instance.new("ImageButton")
local Settings = Instance.new("ImageButton")
local ScriptHub = Instance.new("ImageButton")
local UIListLayout = Instance.new("UIListLayout")
local UIPadding_2 = Instance.new("UIPadding")
local Bruh = Instance.new("ImageButton")
local Bruh_2 = Instance.new("ImageButton")
local Editor_2 = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local BtnContainer_2 = Instance.new("Frame")
local Clear = Instance.new("ImageButton")
local Execute = Instance.new("ImageButton")
local UIListLayout_2 = Instance.new("UIListLayout")
local UICorner_3 = Instance.new("UICorner")
local Paste = Instance.new("ImageButton")
local ExecClipboard = Instance.new("ImageButton")
local Editor_3 = Instance.new("Frame")
local container = Instance.new("ScrollingFrame")
local UIPadding_3 = Instance.new("UIPadding")
local DisplayCode = Instance.new("TextLabel")
local WriteCode = Instance.new("TextBox")
local LineNumbers = Instance.new("TextLabel")
local UICorner_4 = Instance.new("UICorner")
local CloseGUIBtn = Instance.new("TextButton")
local UICorner_5 = Instance.new("UICorner")
local Settings_2 = Instance.new("Frame")
local UICorner_6 = Instance.new("UICorner")
local Frame = Instance.new("Frame")
local HTTPDevelopment = Instance.new("Frame")
local UICorner_7 = Instance.new("UICorner")
local SettingName = Instance.new("TextLabel")
local HTTPToggle = Instance.new("TextButton")
local UICorner_8 = Instance.new("UICorner")
local FpsBooster = Instance.new("Frame")
local UICorner_9 = Instance.new("UICorner")
local SettingName_2 = Instance.new("TextLabel")
local FPSToggle = Instance.new("TextButton")
local UICorner_10 = Instance.new("UICorner")
local UIPadding_4 = Instance.new("UIPadding")
local UIListLayout_3 = Instance.new("UIListLayout")
local DeveloperConsole = Instance.new("Frame")
local UICorner_11 = Instance.new("UICorner")
local SettingName_3 = Instance.new("TextLabel")
local DevConsoleBtn = Instance.new("TextButton")
local UICorner_12 = Instance.new("UICorner")
local AntiAFK = Instance.new("Frame")
local UICorner_13 = Instance.new("UICorner")
local SettingName_4 = Instance.new("TextLabel")
local AntiAFKToggle = Instance.new("TextButton")
local UICorner_14 = Instance.new("UICorner")
local Frame2 = Instance.new("Frame")
local UniversalESP = Instance.new("Frame")
local UICorner_15 = Instance.new("UICorner")
local SettingName_5 = Instance.new("TextLabel")
local Toggle = Instance.new("TextButton")
local UICorner_16 = Instance.new("UICorner")
local UIPadding_5 = Instance.new("UIPadding")
local UIListLayout_4 = Instance.new("UIListLayout")
local aaaaDeveloperConsole = Instance.new("Frame")
local UICorner_17 = Instance.new("UICorner")
local SettingName_6 = Instance.new("TextLabel")
local UserKeys = Instance.new("TextBox")
local SettingName_7 = Instance.new("TextLabel")
local UserKeyExpiration = Instance.new("TextBox")
local SettingName_8 = Instance.new("TextLabel")
local SettingName_9 = Instance.new("TextLabel")
local IsPremium = Instance.new("TextBox")
local ConnectionStatus = Instance.new("Frame")
local UICorner_18 = Instance.new("UICorner")
local SettingName_10 = Instance.new("TextLabel")
local BoostBtn = Instance.new("TextButton")
local UICorner_19 = Instance.new("UICorner")
local PingStatus = Instance.new("TextBox")
local UICorner_20 = Instance.new("UICorner")
local FPSStatus = Instance.new("TextBox")
local UICorner_21 = Instance.new("UICorner")
local CloseGUIBtn_2 = Instance.new("TextButton")
local UICorner_22 = Instance.new("UICorner")
local ScriptHub_2 = Instance.new("Frame")
local ScrollingFrame = Instance.new("ScrollingFrame")
local UIPadding_6 = Instance.new("UIPadding")
local UIGridLayout = Instance.new("UIGridLayout")
local TempScript = Instance.new("Frame")
local Thumbnail = Instance.new("ImageLabel")
local UICorner_23 = Instance.new("UICorner")
local UICorner_24 = Instance.new("UICorner")
local ScriptName = Instance.new("TextLabel")
local Execute_2 = Instance.new("ImageButton")
local SearchBox = Instance.new("TextBox")
local UICorner_25 = Instance.new("UICorner")
local UICorner_26 = Instance.new("UICorner")
local CloseGUIBtn_3 = Instance.new("TextButton")
local UICorner_27 = Instance.new("UICorner")
local KeySystem = Instance.new("Frame")
local UICorner_28 = Instance.new("UICorner")
local EvonLogo_2 = Instance.new("ImageButton")
local VerifyKey = Instance.new("TextButton")
local UICorner_29 = Instance.new("UICorner")
local PasteKey = Instance.new("TextButton")
local UICorner_30 = Instance.new("UICorner")
local KeyBox = Instance.new("TextBox")
local UICorner_31 = Instance.new("UICorner")
local Separator_2 = Instance.new("Frame")
local GetKey = Instance.new("TextButton")
local UICorner_32 = Instance.new("UICorner")
local Background = Instance.new("Frame")
local ImageLabel = Instance.new("ImageLabel")
local VanguardWatermarked = Instance.new("TextLabel")

--Properties:

Evon.Name = "Evon"
Evon.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
Evon.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Controls.Name = "Controls"
Controls.Parent = Evon
Controls.AnchorPoint = Vector2.new(0.5, 0)
Controls.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Controls.BorderColor3 = Color3.fromRGB(0, 0, 0)
Controls.BorderSizePixel = 0
Controls.Position = UDim2.new(0.497997493, 0, 0.868331969, 0)
Controls.Size = UDim2.new(0, 247, 0, 41)
Controls.Visible = false
Controls.ZIndex = 2

Separator.Name = "Separator"
Separator.Parent = Controls
Separator.BackgroundColor3 = Color3.fromRGB(132, 1, 255)
Separator.BorderColor3 = Color3.fromRGB(0, 0, 0)
Separator.BorderSizePixel = 0
Separator.Position = UDim2.new(0.200000003, 0, 0.279588133, 0)
Separator.Rotation = 90.000
Separator.Size = UDim2.new(0, 27, 0, 2)

UICorner.Parent = Controls

UIPadding.Parent = Controls
UIPadding.PaddingLeft = UDim.new(0, 5)
UIPadding.PaddingTop = UDim.new(0, 10)

EvonLogo.Name = "EvonLogo"
EvonLogo.Parent = Controls
EvonLogo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
EvonLogo.BackgroundTransparency = 1.000
EvonLogo.BorderColor3 = Color3.fromRGB(0, 0, 0)
EvonLogo.BorderSizePixel = 0
EvonLogo.Position = UDim2.new(0.0401240103, 0, -0.129032254, 0)
EvonLogo.Size = UDim2.new(0, 29, 0, 27)
EvonLogo.Image = "rbxassetid://15509574978"

BtnContainer.Name = "BtnContainer"
BtnContainer.Parent = Controls
BtnContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
BtnContainer.BackgroundTransparency = 1.000
BtnContainer.BorderColor3 = Color3.fromRGB(0, 0, 0)
BtnContainer.BorderSizePixel = 0
BtnContainer.Position = UDim2.new(0.296528339, 0, -0.161290169, 0)
BtnContainer.Size = UDim2.new(0, 170, 0, 32)

Editor.Name = "Editor"
Editor.Parent = BtnContainer
Editor.BackgroundTransparency = 1.000
Editor.BorderColor3 = Color3.fromRGB(27, 42, 53)
Editor.Position = UDim2.new(0.075757578, 0, 0.324999988, 0)
Editor.Size = UDim2.new(0, 30, 0, 24)
Editor.ZIndex = 2
Editor.Image = "rbxassetid://3926307971"
Editor.ImageColor3 = Color3.fromRGB(132, 1, 255)
Editor.ImageRectOffset = Vector2.new(644, 404)
Editor.ImageRectSize = Vector2.new(36, 36)

Settings.Name = "Settings"
Settings.Parent = BtnContainer
Settings.BackgroundTransparency = 1.000
Settings.BorderColor3 = Color3.fromRGB(27, 42, 53)
Settings.LayoutOrder = 3
Settings.Position = UDim2.new(0.73939395, 0, 0.200000003, 0)
Settings.Size = UDim2.new(0, 30, 0, 24)
Settings.ZIndex = 2
Settings.Image = "rbxassetid://3926307971"
Settings.ImageColor3 = Color3.fromRGB(132, 1, 255)
Settings.ImageRectOffset = Vector2.new(44, 404)
Settings.ImageRectSize = Vector2.new(36, 36)

ScriptHub.Name = "ScriptHub"
ScriptHub.Parent = BtnContainer
ScriptHub.BackgroundTransparency = 1.000
ScriptHub.BorderColor3 = Color3.fromRGB(27, 42, 53)
ScriptHub.LayoutOrder = 2
ScriptHub.Position = UDim2.new(0.472727269, 0, 0.212500006, 0)
ScriptHub.Size = UDim2.new(0, 30, 0, 24)
ScriptHub.ZIndex = 2
ScriptHub.Image = "rbxassetid://3926305904"
ScriptHub.ImageColor3 = Color3.fromRGB(132, 1, 255)
ScriptHub.ImageRectOffset = Vector2.new(284, 444)
ScriptHub.ImageRectSize = Vector2.new(36, 36)

UIListLayout.Parent = BtnContainer
UIListLayout.FillDirection = Enum.FillDirection.Horizontal
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
UIListLayout.Padding = UDim.new(0, 5)

UIPadding_2.Parent = BtnContainer
UIPadding_2.PaddingRight = UDim.new(0, 5)

Bruh.Name = "Bruh"
Bruh.Parent = BtnContainer
Bruh.BackgroundTransparency = 1.000
Bruh.BorderColor3 = Color3.fromRGB(27, 42, 53)
Bruh.Position = UDim2.new(0.306060612, 0, 0.212500006, 0)
Bruh.Size = UDim2.new(0, 14, 0, 23)
Bruh.ZIndex = 2
Bruh.ImageColor3 = Color3.fromRGB(132, 1, 255)
Bruh.ImageRectOffset = Vector2.new(644, 404)
Bruh.ImageRectSize = Vector2.new(36, 36)

Bruh_2.Name = "Bruh"
Bruh_2.Parent = BtnContainer
Bruh_2.BackgroundTransparency = 1.000
Bruh_2.BorderColor3 = Color3.fromRGB(27, 42, 53)
Bruh_2.LayoutOrder = 2
Bruh_2.Position = UDim2.new(0.636363626, 0, 0.212500006, 0)
Bruh_2.Size = UDim2.new(0, 14, 0, 23)
Bruh_2.ZIndex = 2
Bruh_2.ImageColor3 = Color3.fromRGB(132, 1, 255)
Bruh_2.ImageRectOffset = Vector2.new(284, 444)
Bruh_2.ImageRectSize = Vector2.new(36, 36)

Editor_2.Name = "Editor"
Editor_2.Parent = Evon
Editor_2.AnchorPoint = Vector2.new(0.5, 0.5)
Editor_2.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Editor_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Editor_2.BorderSizePixel = 0
Editor_2.Position = UDim2.new(0.497000009, 0, 0.44600001, 0)
Editor_2.Size = UDim2.new(0, 648, 0, 296)
Editor_2.Visible = false
Editor_2.ZIndex = 0

UICorner_2.Parent = Editor_2

BtnContainer_2.Name = "BtnContainer"
BtnContainer_2.Parent = Editor_2
BtnContainer_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
BtnContainer_2.BackgroundTransparency = 1.000
BtnContainer_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
BtnContainer_2.BorderSizePixel = 0
BtnContainer_2.Position = UDim2.new(0.0250965245, 0, 0.033896897, 0)
BtnContainer_2.Size = UDim2.new(0, 109, 0, 26)

Clear.Name = "Clear"
Clear.Parent = BtnContainer_2
Clear.BackgroundTransparency = 1.000
Clear.BorderColor3 = Color3.fromRGB(27, 42, 53)
Clear.LayoutOrder = 2
Clear.Position = UDim2.new(0.594594598, 0, 0.185121104, 0)
Clear.Size = UDim2.new(0, 22, 0, 22)
Clear.ZIndex = 2
Clear.Image = "rbxassetid://3926305904"
Clear.ImageColor3 = Color3.fromRGB(132, 1, 255)
Clear.ImageRectOffset = Vector2.new(484, 284)
Clear.ImageRectSize = Vector2.new(36, 36)

Execute.Name = "Execute"
Execute.Parent = BtnContainer_2
Execute.BackgroundTransparency = 1.000
Execute.BorderColor3 = Color3.fromRGB(27, 42, 53)
Execute.Position = UDim2.new(0.15444015, 0, 0.309688568, 0)
Execute.Size = UDim2.new(0, 21, 0, 21)
Execute.ZIndex = 2
Execute.Image = "rbxassetid://3926307971"
Execute.ImageColor3 = Color3.fromRGB(132, 1, 255)
Execute.ImageRectOffset = Vector2.new(884, 244)
Execute.ImageRectSize = Vector2.new(36, 36)

UIListLayout_2.Parent = BtnContainer_2
UIListLayout_2.FillDirection = Enum.FillDirection.Horizontal
UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_2.VerticalAlignment = Enum.VerticalAlignment.Center
UIListLayout_2.Padding = UDim.new(0, 5)

UICorner_3.CornerRadius = UDim.new(0, 4)
UICorner_3.Parent = BtnContainer_2

Paste.Name = "Paste"
Paste.Parent = BtnContainer_2
Paste.BackgroundTransparency = 1.000
Paste.BorderColor3 = Color3.fromRGB(27, 42, 53)
Paste.Position = UDim2.new(0.5, 0, 0.5, 0)
Paste.Size = UDim2.new(0, 20, 0, 20)
Paste.ZIndex = 2
Paste.Image = "rbxassetid://3926305904"
Paste.ImageColor3 = Color3.fromRGB(132, 1, 255)
Paste.ImageRectOffset = Vector2.new(484, 644)
Paste.ImageRectSize = Vector2.new(36, 36)

ExecClipboard.Name = "ExecClipboard"
ExecClipboard.Parent = BtnContainer_2
ExecClipboard.BackgroundTransparency = 1.000
ExecClipboard.BorderColor3 = Color3.fromRGB(27, 42, 53)
ExecClipboard.Position = UDim2.new(1.85779822, 0, 0.230769232, 0)
ExecClipboard.Size = UDim2.new(0, 20, 0, 20)
ExecClipboard.ZIndex = 2
ExecClipboard.Image = "rbxassetid://3926305904"
ExecClipboard.ImageColor3 = Color3.fromRGB(132, 1, 255)
ExecClipboard.ImageRectOffset = Vector2.new(924, 764)
ExecClipboard.ImageRectSize = Vector2.new(36, 36)

Editor_3.Name = "Editor"
Editor_3.Parent = Editor_2
Editor_3.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
Editor_3.BackgroundTransparency = 0.500
Editor_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
Editor_3.BorderSizePixel = 0
Editor_3.Position = UDim2.new(0.0233293697, 0, 0.156579405, 0)
Editor_3.Size = UDim2.new(0, 619, 0, 234)

container.Name = "container"
container.Parent = Editor_3
container.Active = true
container.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
container.BackgroundTransparency = 1.000
container.BorderColor3 = Color3.fromRGB(0, 0, 0)
container.BorderSizePixel = 0
container.Size = UDim2.new(0, 619, 0, 233)
container.CanvasSize = UDim2.new(0, 0, 1, 0)

UIPadding_3.Parent = container
UIPadding_3.PaddingBottom = UDim.new(0, 5)
UIPadding_3.PaddingLeft = UDim.new(0, 5)
UIPadding_3.PaddingRight = UDim.new(0, 5)
UIPadding_3.PaddingTop = UDim.new(0, 5)

DisplayCode.Name = "DisplayCode"
DisplayCode.Parent = container
DisplayCode.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DisplayCode.BackgroundTransparency = 1.000
DisplayCode.BorderColor3 = Color3.fromRGB(0, 0, 0)
DisplayCode.BorderSizePixel = 0
DisplayCode.Position = UDim2.new(0.038901601, 0, 0.0139534883, 0)
DisplayCode.Size = UDim2.new(0, 425, 0, 217)
DisplayCode.Font = Enum.Font.Code
DisplayCode.Text = ""
DisplayCode.TextColor3 = Color3.fromRGB(255, 255, 255)
DisplayCode.TextSize = 15.000
DisplayCode.TextWrapped = true
DisplayCode.TextXAlignment = Enum.TextXAlignment.Left
DisplayCode.TextYAlignment = Enum.TextYAlignment.Top

WriteCode.Name = "WriteCode"
WriteCode.Parent = container
WriteCode.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
WriteCode.BackgroundTransparency = 1.000
WriteCode.BorderColor3 = Color3.fromRGB(0, 0, 0)
WriteCode.BorderSizePixel = 0
WriteCode.Position = UDim2.new(0.038901601, 0, 0.0139534883, 0)
WriteCode.Size = UDim2.new(0, 425, 0, 217)
WriteCode.ClearTextOnFocus = false
WriteCode.Font = Enum.Font.Code
WriteCode.MultiLine = true
WriteCode.Text = ""
WriteCode.TextColor3 = Color3.fromRGB(255, 255, 255)
WriteCode.TextSize = 15.000
WriteCode.TextTransparency = 1.000
WriteCode.TextXAlignment = Enum.TextXAlignment.Left
WriteCode.TextYAlignment = Enum.TextYAlignment.Top

LineNumbers.Name = "LineNumbers"
LineNumbers.Parent = container
LineNumbers.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LineNumbers.BackgroundTransparency = 1.000
LineNumbers.BorderColor3 = Color3.fromRGB(0, 0, 0)
LineNumbers.BorderSizePixel = 0
LineNumbers.Position = UDim2.new(-0.0120000001, 0, 0.0140000004, 0)
LineNumbers.Size = UDim2.new(0, 23, 0, 215)
LineNumbers.Font = Enum.Font.Code
LineNumbers.Text = "1\\n"
LineNumbers.TextColor3 = Color3.fromRGB(255, 255, 255)
LineNumbers.TextSize = 15.000
LineNumbers.TextWrapped = true
LineNumbers.TextYAlignment = Enum.TextYAlignment.Top

UICorner_4.CornerRadius = UDim.new(0, 4)
UICorner_4.Parent = Editor_3

CloseGUIBtn.Name = "CloseGUIBtn"
CloseGUIBtn.Parent = Editor_2
CloseGUIBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
CloseGUIBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
CloseGUIBtn.BorderSizePixel = 0
CloseGUIBtn.Position = UDim2.new(0.94599998, 0, 0.0299999993, 0)
CloseGUIBtn.Size = UDim2.new(0, 25, 0, 17)
CloseGUIBtn.Font = Enum.Font.SourceSans
CloseGUIBtn.Text = "X"
CloseGUIBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseGUIBtn.TextSize = 19.000
CloseGUIBtn.TextWrapped = true

UICorner_5.CornerRadius = UDim.new(0, 4)
UICorner_5.Parent = CloseGUIBtn

Settings_2.Name = "Settings"
Settings_2.Parent = Evon
Settings_2.AnchorPoint = Vector2.new(0.5, 0.5)
Settings_2.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Settings_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Settings_2.BorderSizePixel = 0
Settings_2.Position = UDim2.new(0.497498512, 0, 0.445695192, 0)
Settings_2.Size = UDim2.new(0, 648, 0, 296)
Settings_2.Visible = false

UICorner_6.Parent = Settings_2

Frame.Parent = Settings_2
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 1.000
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.0248962678, 0, 0.0545554794, 0)
Frame.Size = UDim2.new(0, 296, 0, 269)

HTTPDevelopment.Name = "@HTTPDevelopment"
HTTPDevelopment.Parent = Frame
HTTPDevelopment.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HTTPDevelopment.BackgroundTransparency = 1.000
HTTPDevelopment.BorderColor3 = Color3.fromRGB(0, 0, 0)
HTTPDevelopment.BorderSizePixel = 0
HTTPDevelopment.Position = UDim2.new(0, 0, 0.169884175, 0)
HTTPDevelopment.Size = UDim2.new(0, 275, 0, 34)

UICorner_7.CornerRadius = UDim.new(0, 4)
UICorner_7.Parent = HTTPDevelopment

SettingName.Name = "SettingName"
SettingName.Parent = HTTPDevelopment
SettingName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SettingName.BackgroundTransparency = 1.000
SettingName.BorderColor3 = Color3.fromRGB(0, 0, 0)
SettingName.BorderSizePixel = 0
SettingName.Position = UDim2.new(0.0202543493, 0, 0, 0)
SettingName.Size = UDim2.new(0, 162, 0, 34)
SettingName.Font = Enum.Font.SourceSansBold
SettingName.Text = "Enable HTTP Developer Mode"
SettingName.TextColor3 = Color3.fromRGB(255, 255, 255)
SettingName.TextSize = 14.000
SettingName.TextXAlignment = Enum.TextXAlignment.Left

HTTPToggle.Name = "HTTPToggle"
HTTPToggle.Parent = HTTPDevelopment
HTTPToggle.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
HTTPToggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
HTTPToggle.BorderSizePixel = 0
HTTPToggle.Position = UDim2.new(0.912, 0, 0.206, 0)
HTTPToggle.Size = UDim2.new(0, 20, 0, 20)
HTTPToggle.Font = Enum.Font.SourceSans
HTTPToggle.Text = ""
HTTPToggle.TextColor3 = Color3.fromRGB(0, 0, 0)
HTTPToggle.TextSize = 14.000

UICorner_8.CornerRadius = UDim.new(0, 4)
UICorner_8.Parent = HTTPToggle

FpsBooster.Name = "@FpsBooster"
FpsBooster.Parent = Frame
FpsBooster.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FpsBooster.BackgroundTransparency = 1.000
FpsBooster.BorderColor3 = Color3.fromRGB(0, 0, 0)
FpsBooster.BorderSizePixel = 0
FpsBooster.Size = UDim2.new(0, 275, 0, 34)

UICorner_9.CornerRadius = UDim.new(0, 4)
UICorner_9.Parent = FpsBooster

SettingName_2.Name = "SettingName"
SettingName_2.Parent = FpsBooster
SettingName_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SettingName_2.BackgroundTransparency = 1.000
SettingName_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
SettingName_2.BorderSizePixel = 0
SettingName_2.Position = UDim2.new(0.0202543586, 0, 0, 0)
SettingName_2.Size = UDim2.new(0, 151, 0, 34)
SettingName_2.Font = Enum.Font.SourceSansBold
SettingName_2.Text = "Unlock FPS "
SettingName_2.TextColor3 = Color3.fromRGB(255, 255, 255)
SettingName_2.TextSize = 14.000
SettingName_2.TextXAlignment = Enum.TextXAlignment.Left

FPSToggle.Name = "FPSToggle"
FPSToggle.Parent = FpsBooster
FPSToggle.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
FPSToggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
FPSToggle.BorderSizePixel = 0
FPSToggle.Position = UDim2.new(0.912, 0, 0.206, 0)
FPSToggle.Size = UDim2.new(0, 20, 0, 20)
FPSToggle.Font = Enum.Font.SourceSans
FPSToggle.Text = ""
FPSToggle.TextColor3 = Color3.fromRGB(0, 0, 0)
FPSToggle.TextSize = 14.000

UICorner_10.CornerRadius = UDim.new(0, 4)
UICorner_10.Parent = FPSToggle

UIPadding_4.Parent = Frame
UIPadding_4.PaddingTop = UDim.new(0, 15)

UIListLayout_3.Parent = Frame
UIListLayout_3.Padding = UDim.new(0, 10)

DeveloperConsole.Name = "DeveloperConsole"
DeveloperConsole.Parent = Frame
DeveloperConsole.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DeveloperConsole.BackgroundTransparency = 1.000
DeveloperConsole.BorderColor3 = Color3.fromRGB(0, 0, 0)
DeveloperConsole.BorderSizePixel = 0
DeveloperConsole.Position = UDim2.new(0, 0, 0.6795367, 0)
DeveloperConsole.Size = UDim2.new(0, 275, 0, 34)

UICorner_11.CornerRadius = UDim.new(0, 4)
UICorner_11.Parent = DeveloperConsole

SettingName_3.Name = "SettingName"
SettingName_3.Parent = DeveloperConsole
SettingName_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SettingName_3.BackgroundTransparency = 1.000
SettingName_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
SettingName_3.BorderSizePixel = 0
SettingName_3.Position = UDim2.new(0.0202543586, 0, 0, 0)
SettingName_3.Size = UDim2.new(0, 151, 0, 34)
SettingName_3.Font = Enum.Font.SourceSansBold
SettingName_3.Text = " ROBLOX Dev Console"
SettingName_3.TextColor3 = Color3.fromRGB(255, 255, 255)
SettingName_3.TextSize = 14.000
SettingName_3.TextXAlignment = Enum.TextXAlignment.Left

DevConsoleBtn.Name = "DevConsoleBtn"
DevConsoleBtn.Parent = DeveloperConsole
DevConsoleBtn.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
DevConsoleBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
DevConsoleBtn.BorderSizePixel = 0
DevConsoleBtn.Position = UDim2.new(0.608339429, 0, 0.14705883, 0)
DevConsoleBtn.Size = UDim2.new(0, 97, 0, 19)
DevConsoleBtn.Font = Enum.Font.SourceSans
DevConsoleBtn.Text = "Developer Console"
DevConsoleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
DevConsoleBtn.TextSize = 13.000
DevConsoleBtn.TextWrapped = true

UICorner_12.CornerRadius = UDim.new(0, 4)
UICorner_12.Parent = DevConsoleBtn

AntiAFK.Name = "AntiAFK"
AntiAFK.Parent = Frame
AntiAFK.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AntiAFK.BackgroundTransparency = 1.000
AntiAFK.BorderColor3 = Color3.fromRGB(0, 0, 0)
AntiAFK.BorderSizePixel = 0
AntiAFK.Position = UDim2.new(0, 0, 0.33976835, 0)
AntiAFK.Size = UDim2.new(0, 275, 0, 34)

UICorner_13.CornerRadius = UDim.new(0, 4)
UICorner_13.Parent = AntiAFK

SettingName_4.Name = "SettingName"
SettingName_4.Parent = AntiAFK
SettingName_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SettingName_4.BackgroundTransparency = 1.000
SettingName_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
SettingName_4.BorderSizePixel = 0
SettingName_4.Position = UDim2.new(0.0202543586, 0, 0, 0)
SettingName_4.Size = UDim2.new(0, 151, 0, 34)
SettingName_4.Font = Enum.Font.SourceSansBold
SettingName_4.Text = "Anti AFK Mode"
SettingName_4.TextColor3 = Color3.fromRGB(255, 255, 255)
SettingName_4.TextSize = 14.000
SettingName_4.TextXAlignment = Enum.TextXAlignment.Left

AntiAFKToggle.Name = "AntiAFKToggle"
AntiAFKToggle.Parent = AntiAFK
AntiAFKToggle.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
AntiAFKToggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
AntiAFKToggle.BorderSizePixel = 0
AntiAFKToggle.Position = UDim2.new(0.912, 0, 0.206, 0)
AntiAFKToggle.Size = UDim2.new(0, 20, 0, 20)
AntiAFKToggle.Font = Enum.Font.SourceSans
AntiAFKToggle.Text = ""
AntiAFKToggle.TextColor3 = Color3.fromRGB(0, 0, 0)
AntiAFKToggle.TextSize = 14.000

UICorner_14.CornerRadius = UDim.new(0, 4)
UICorner_14.Parent = AntiAFKToggle

Frame2.Name = "Frame2"
Frame2.Parent = Settings_2
Frame2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame2.BackgroundTransparency = 1.000
Frame2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame2.BorderSizePixel = 0
Frame2.Position = UDim2.new(0.472562969, 0, 0.0544926412, 0)
Frame2.Size = UDim2.new(0, 225, 0, 272)

UniversalESP.Name = "@UniversalESP"
UniversalESP.Parent = Frame2
UniversalESP.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
UniversalESP.BackgroundTransparency = 1.000
UniversalESP.BorderColor3 = Color3.fromRGB(0, 0, 0)
UniversalESP.BorderSizePixel = 0
UniversalESP.Size = UDim2.new(0, 322, 0, 34)

UICorner_15.CornerRadius = UDim.new(0, 4)
UICorner_15.Parent = UniversalESP

SettingName_5.Name = "SettingName"
SettingName_5.Parent = UniversalESP
SettingName_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SettingName_5.BackgroundTransparency = 1.000
SettingName_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
SettingName_5.BorderSizePixel = 0
SettingName_5.Position = UDim2.new(0.0202543586, 0, 0, 0)
SettingName_5.Size = UDim2.new(0, 151, 0, 34)
SettingName_5.Font = Enum.Font.SourceSansBold
SettingName_5.Text = "ESP Mode"
SettingName_5.TextColor3 = Color3.fromRGB(255, 255, 255)
SettingName_5.TextSize = 14.000
SettingName_5.TextXAlignment = Enum.TextXAlignment.Left

Toggle.Name = "Toggle"
Toggle.Parent = UniversalESP
Toggle.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
Toggle.BorderSizePixel = 0
Toggle.Position = UDim2.new(0.912, 0, 0.206, 0)
Toggle.Size = UDim2.new(0, 20, 0, 20)
Toggle.Font = Enum.Font.SourceSans
Toggle.Text = ""
Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
Toggle.TextSize = 14.000

UICorner_16.CornerRadius = UDim.new(0, 4)
UICorner_16.Parent = Toggle

UIPadding_5.Parent = Frame2
UIPadding_5.PaddingTop = UDim.new(0, 15)

UIListLayout_4.Parent = Frame2
UIListLayout_4.Padding = UDim.new(0, 10)

aaaaDeveloperConsole.Name = "aaaaDeveloperConsole"
aaaaDeveloperConsole.Parent = Frame2
aaaaDeveloperConsole.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
aaaaDeveloperConsole.BackgroundTransparency = 1.000
aaaaDeveloperConsole.BorderColor3 = Color3.fromRGB(0, 0, 0)
aaaaDeveloperConsole.BorderSizePixel = 0
aaaaDeveloperConsole.Position = UDim2.new(0, 0, 0.503816783, 0)
aaaaDeveloperConsole.Size = UDim2.new(0, 322, 0, 122)

UICorner_17.CornerRadius = UDim.new(0, 4)
UICorner_17.Parent = aaaaDeveloperConsole

SettingName_6.Name = "SettingName"
SettingName_6.Parent = aaaaDeveloperConsole
SettingName_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SettingName_6.BackgroundTransparency = 1.000
SettingName_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
SettingName_6.BorderSizePixel = 0
SettingName_6.Position = UDim2.new(0.0202542897, 0, 0.0605463758, 0)
SettingName_6.Size = UDim2.new(0, 313, 0, 19)
SettingName_6.Font = Enum.Font.SourceSansBold
SettingName_6.Text = "Evon Key Management"
SettingName_6.TextColor3 = Color3.fromRGB(255, 255, 255)
SettingName_6.TextSize = 14.000

UserKeys.Name = "UserKeys"
UserKeys.Parent = aaaaDeveloperConsole
UserKeys.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
UserKeys.BorderColor3 = Color3.fromRGB(0, 0, 0)
UserKeys.BorderSizePixel = 0
UserKeys.Position = UDim2.new(0.195239216, 0, 0.228805661, 0)
UserKeys.Size = UDim2.new(0, 210, 0, 21)
UserKeys.Font = Enum.Font.SourceSans
UserKeys.Text = ""
UserKeys.TextColor3 = Color3.fromRGB(255, 255, 255)
UserKeys.TextSize = 14.000
UserKeys.TextXAlignment = Enum.TextXAlignment.Left

SettingName_7.Name = "SettingName"
SettingName_7.Parent = aaaaDeveloperConsole
SettingName_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SettingName_7.BackgroundTransparency = 1.000
SettingName_7.BorderColor3 = Color3.fromRGB(0, 0, 0)
SettingName_7.BorderSizePixel = 0
SettingName_7.Position = UDim2.new(0.0880964398, 0, 0.223231077, 0)
SettingName_7.Size = UDim2.new(0, 33, 0, 23)
SettingName_7.Font = Enum.Font.SourceSansBold
SettingName_7.Text = "Key:"
SettingName_7.TextColor3 = Color3.fromRGB(255, 255, 255)
SettingName_7.TextSize = 14.000
SettingName_7.TextXAlignment = Enum.TextXAlignment.Left

UserKeyExpiration.Name = "UserKeyExpiration"
UserKeyExpiration.Parent = aaaaDeveloperConsole
UserKeyExpiration.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
UserKeyExpiration.BorderColor3 = Color3.fromRGB(0, 0, 0)
UserKeyExpiration.BorderSizePixel = 0
UserKeyExpiration.Position = UDim2.new(0.266667932, 0, 0.474785358, 0)
UserKeyExpiration.Size = UDim2.new(0, 185, 0, 21)
UserKeyExpiration.Font = Enum.Font.SourceSans
UserKeyExpiration.Text = ""
UserKeyExpiration.TextColor3 = Color3.fromRGB(255, 255, 255)
UserKeyExpiration.TextSize = 14.000
UserKeyExpiration.TextXAlignment = Enum.TextXAlignment.Left

SettingName_8.Name = "SettingName"
SettingName_8.Parent = aaaaDeveloperConsole
SettingName_8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SettingName_8.BackgroundTransparency = 1.000
SettingName_8.BorderColor3 = Color3.fromRGB(0, 0, 0)
SettingName_8.BorderSizePixel = 0
SettingName_8.Position = UDim2.new(0.0880964398, 0, 0.465776026, 0)
SettingName_8.Size = UDim2.new(0, 55, 0, 22)
SettingName_8.Font = Enum.Font.SourceSansBold
SettingName_8.Text = "Expire In:"
SettingName_8.TextColor3 = Color3.fromRGB(255, 255, 255)
SettingName_8.TextSize = 14.000
SettingName_8.TextXAlignment = Enum.TextXAlignment.Left

SettingName_9.Name = "SettingName"
SettingName_9.Parent = aaaaDeveloperConsole
SettingName_9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SettingName_9.BackgroundTransparency = 1.000
SettingName_9.BorderColor3 = Color3.fromRGB(0, 0, 0)
SettingName_9.BorderSizePixel = 0
SettingName_9.Position = UDim2.new(0.0880964398, 0, 0.703480959, 0)
SettingName_9.Size = UDim2.new(0, 55, 0, 22)
SettingName_9.Font = Enum.Font.SourceSansBold
SettingName_9.Text = "Premium:"
SettingName_9.TextColor3 = Color3.fromRGB(255, 255, 255)
SettingName_9.TextSize = 14.000
SettingName_9.TextXAlignment = Enum.TextXAlignment.Left

IsPremium.Name = "IsPremium"
IsPremium.Parent = aaaaDeveloperConsole
IsPremium.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
IsPremium.BackgroundTransparency = 1.000
IsPremium.BorderColor3 = Color3.fromRGB(0, 0, 0)
IsPremium.BorderSizePixel = 0
IsPremium.Position = UDim2.new(0.269787043, 0, 0.704000771, 0)
IsPremium.Size = UDim2.new(0, 30, 0, 21)
IsPremium.Font = Enum.Font.SourceSans
IsPremium.PlaceholderColor3 = Color3.fromRGB(3, 178, 0)
IsPremium.PlaceholderText = "Yes"
IsPremium.Text = ""
IsPremium.TextColor3 = Color3.fromRGB(55, 255, 0)
IsPremium.TextScaled = true
IsPremium.TextSize = 14.000
IsPremium.TextWrapped = true
IsPremium.TextXAlignment = Enum.TextXAlignment.Left

ConnectionStatus.Name = "@ConnectionStatus"
ConnectionStatus.Parent = Frame2
ConnectionStatus.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ConnectionStatus.BackgroundTransparency = 1.000
ConnectionStatus.BorderColor3 = Color3.fromRGB(0, 0, 0)
ConnectionStatus.BorderSizePixel = 0
ConnectionStatus.Position = UDim2.new(0, 0, 0.167938933, 0)
ConnectionStatus.Size = UDim2.new(0, 322, 0, 78)

UICorner_18.CornerRadius = UDim.new(0, 4)
UICorner_18.Parent = ConnectionStatus

SettingName_10.Name = "SettingName"
SettingName_10.Parent = ConnectionStatus
SettingName_10.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SettingName_10.BackgroundTransparency = 1.000
SettingName_10.BorderColor3 = Color3.fromRGB(0, 0, 0)
SettingName_10.BorderSizePixel = 0
SettingName_10.Position = UDim2.new(0.0202543847, 0, 0, 0)
SettingName_10.Size = UDim2.new(0, 307, 0, 27)
SettingName_10.Font = Enum.Font.SourceSansBold
SettingName_10.Text = "Connection Status"
SettingName_10.TextColor3 = Color3.fromRGB(255, 255, 255)
SettingName_10.TextSize = 14.000

BoostBtn.Name = "BoostBtn"
BoostBtn.Parent = ConnectionStatus
BoostBtn.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
BoostBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
BoostBtn.BorderSizePixel = 0
BoostBtn.Position = UDim2.new(0.0280660316, 0, 0.343025416, 0)
BoostBtn.Size = UDim2.new(0, 93, 0, 43)
BoostBtn.Font = Enum.Font.SourceSans
BoostBtn.Text = "Boost Now!"
BoostBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
BoostBtn.TextSize = 19.000
BoostBtn.TextWrapped = true

UICorner_19.CornerRadius = UDim.new(0, 4)
UICorner_19.Parent = BoostBtn

PingStatus.Name = "PingStatus"
PingStatus.Parent = ConnectionStatus
PingStatus.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
PingStatus.BorderColor3 = Color3.fromRGB(0, 0, 0)
PingStatus.BorderSizePixel = 0
PingStatus.Position = UDim2.new(0.401902944, 0, 0.346907973, 0)
PingStatus.Size = UDim2.new(0, 75, 0, 42)
PingStatus.ClearTextOnFocus = false
PingStatus.Font = Enum.Font.SourceSansBold
PingStatus.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
PingStatus.PlaceholderText = "100 Ping"
PingStatus.Text = ""
PingStatus.TextColor3 = Color3.fromRGB(0, 0, 0)
PingStatus.TextSize = 15.000

UICorner_20.CornerRadius = UDim.new(0, 4)
UICorner_20.Parent = PingStatus

FPSStatus.Name = "FPSStatus"
FPSStatus.Parent = ConnectionStatus
FPSStatus.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
FPSStatus.BorderColor3 = Color3.fromRGB(0, 0, 0)
FPSStatus.BorderSizePixel = 0
FPSStatus.Position = UDim2.new(0.703145206, 0, 0.334087461, 0)
FPSStatus.Size = UDim2.new(0, 75, 0, 42)
FPSStatus.ClearTextOnFocus = false
FPSStatus.Font = Enum.Font.SourceSansBold
FPSStatus.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
FPSStatus.PlaceholderText = "60 FPS"
FPSStatus.Text = ""
FPSStatus.TextColor3 = Color3.fromRGB(0, 0, 0)
FPSStatus.TextSize = 15.000

UICorner_21.CornerRadius = UDim.new(0, 4)
UICorner_21.Parent = FPSStatus

CloseGUIBtn_2.Name = "CloseGUIBtn"
CloseGUIBtn_2.Parent = Settings_2
CloseGUIBtn_2.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
CloseGUIBtn_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
CloseGUIBtn_2.BorderSizePixel = 0
CloseGUIBtn_2.Position = UDim2.new(0.94599998, 0, 0.0299999993, 0)
CloseGUIBtn_2.Size = UDim2.new(0, 25, 0, 17)
CloseGUIBtn_2.Font = Enum.Font.SourceSans
CloseGUIBtn_2.Text = "X"
CloseGUIBtn_2.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseGUIBtn_2.TextSize = 19.000
CloseGUIBtn_2.TextWrapped = true

UICorner_22.CornerRadius = UDim.new(0, 4)
UICorner_22.Parent = CloseGUIBtn_2

ScriptHub_2.Name = "ScriptHub"
ScriptHub_2.Parent = Evon
ScriptHub_2.AnchorPoint = Vector2.new(0.5, 0.5)
ScriptHub_2.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
ScriptHub_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScriptHub_2.BorderSizePixel = 0
ScriptHub_2.Position = UDim2.new(0.497000009, 0, 0.44600001, 0)
ScriptHub_2.Size = UDim2.new(0, 648, 0, 296)
ScriptHub_2.Visible = false

ScrollingFrame.Parent = ScriptHub_2
ScrollingFrame.Active = true
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScrollingFrame.BackgroundTransparency = 1.000
ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.Position = UDim2.new(0.0151029043, 0, 0.186629578, 0)
ScrollingFrame.Size = UDim2.new(0, 621, 0, 231)
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 4, 0)
ScrollingFrame.VerticalScrollBarInset = Enum.ScrollBarInset.Always

UIPadding_6.Parent = ScrollingFrame
UIPadding_6.PaddingLeft = UDim.new(0, 15)
UIPadding_6.PaddingTop = UDim.new(0, 12)

UIGridLayout.Parent = ScrollingFrame
UIGridLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIGridLayout.CellPadding = UDim2.new(0, 10, 0, 10)
UIGridLayout.CellSize = UDim2.new(0, 120, 0, 150)

TempScript.Name = "TempScript"
TempScript.Parent = ScrollingFrame
TempScript.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
TempScript.BorderColor3 = Color3.fromRGB(0, 0, 0)
TempScript.BorderSizePixel = 0
TempScript.Position = UDim2.new(0.35358566, 0, -1.38088595e-07, 0)
TempScript.Size = UDim2.new(0, 117, 0, 152)

Thumbnail.Name = "Thumbnail"
Thumbnail.Parent = TempScript
Thumbnail.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Thumbnail.BorderColor3 = Color3.fromRGB(0, 0, 0)
Thumbnail.BorderSizePixel = 0
Thumbnail.Position = UDim2.new(0.0689743012, 0, 0.0479256175, 0)
Thumbnail.Size = UDim2.new(0, 103, 0, 81)
Thumbnail.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"

UICorner_23.CornerRadius = UDim.new(0, 4)
UICorner_23.Parent = Thumbnail

UICorner_24.CornerRadius = UDim.new(0, 4)
UICorner_24.Parent = TempScript

ScriptName.Name = "ScriptName"
ScriptName.Parent = TempScript
ScriptName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScriptName.BackgroundTransparency = 1.000
ScriptName.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScriptName.BorderSizePixel = 0
ScriptName.Position = UDim2.new(0.0689743012, 0, 0.646666646, 0)
ScriptName.Size = UDim2.new(0, 102, 0, 17)
ScriptName.Font = Enum.Font.Unknown
ScriptName.Text = "Logi Hub"
ScriptName.TextColor3 = Color3.fromRGB(255, 255, 255)
ScriptName.TextSize = 10.000

Execute_2.Name = "Execute"
Execute_2.Parent = TempScript
Execute_2.BackgroundTransparency = 1.000
Execute_2.BorderColor3 = Color3.fromRGB(27, 42, 53)
Execute_2.Position = UDim2.new(0.800000012, 0, 0.839999974, 0)
Execute_2.Size = UDim2.new(0, 21, 0, 21)
Execute_2.ZIndex = 2
Execute_2.Image = "rbxassetid://3926307971"
Execute_2.ImageColor3 = Color3.fromRGB(132, 1, 255)
Execute_2.ImageRectOffset = Vector2.new(884, 244)
Execute_2.ImageRectSize = Vector2.new(36, 36)

SearchBox.Name = "SearchBox"
SearchBox.Parent = ScriptHub_2
SearchBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SearchBox.BackgroundTransparency = 1.000
SearchBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
SearchBox.BorderSizePixel = 0
SearchBox.Position = UDim2.new(0.0337738693, 0, 0.0709648803, 0)
SearchBox.Size = UDim2.new(0, 137, 0, 22)
SearchBox.Font = Enum.Font.Unknown
SearchBox.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
SearchBox.PlaceholderText = "Search"
SearchBox.Text = ""
SearchBox.TextColor3 = Color3.fromRGB(0, 0, 0)
SearchBox.TextSize = 14.000
SearchBox.TextWrapped = true

UICorner_25.CornerRadius = UDim.new(0, 4)
UICorner_25.Parent = SearchBox

UICorner_26.Parent = ScriptHub_2

CloseGUIBtn_3.Name = "CloseGUIBtn"
CloseGUIBtn_3.Parent = ScriptHub_2
CloseGUIBtn_3.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
CloseGUIBtn_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
CloseGUIBtn_3.BorderSizePixel = 0
CloseGUIBtn_3.Position = UDim2.new(0.94599998, 0, 0.0299999993, 0)
CloseGUIBtn_3.Size = UDim2.new(0, 25, 0, 17)
CloseGUIBtn_3.Font = Enum.Font.SourceSans
CloseGUIBtn_3.Text = "X"
CloseGUIBtn_3.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseGUIBtn_3.TextSize = 19.000
CloseGUIBtn_3.TextWrapped = true

UICorner_27.CornerRadius = UDim.new(0, 4)
UICorner_27.Parent = CloseGUIBtn_3

KeySystem.Name = "KeySystem"
KeySystem.Parent = Evon
KeySystem.AnchorPoint = Vector2.new(0.5, 0.5)
KeySystem.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
KeySystem.BorderColor3 = Color3.fromRGB(0, 0, 0)
KeySystem.BorderSizePixel = 0
KeySystem.Position = UDim2.new(0.5, 0, 0.5, 0)
KeySystem.Size = UDim2.new(0, 332, 0, 200)

UICorner_28.Parent = KeySystem

EvonLogo_2.Name = "EvonLogo"
EvonLogo_2.Parent = KeySystem
EvonLogo_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
EvonLogo_2.BackgroundTransparency = 1.000
EvonLogo_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
EvonLogo_2.BorderSizePixel = 0
EvonLogo_2.Position = UDim2.new(0.409302115, 0, 0.0782257095, 0)
EvonLogo_2.Size = UDim2.new(0, 60, 0, 60)
EvonLogo_2.Image = "rbxassetid://15517910778"

VerifyKey.Name = "VerifyKey"
VerifyKey.Parent = KeySystem
VerifyKey.BackgroundColor3 = Color3.fromRGB(128, 1, 255)
VerifyKey.BackgroundTransparency = 1.000
VerifyKey.BorderColor3 = Color3.fromRGB(0, 0, 0)
VerifyKey.BorderSizePixel = 0
VerifyKey.Position = UDim2.new(0.0753012076, 0, 0.754999995, 0)
VerifyKey.Size = UDim2.new(0, 75, 0, 28)
VerifyKey.Font = Enum.Font.Unknown
VerifyKey.Text = "Verify"
VerifyKey.TextColor3 = Color3.fromRGB(255, 255, 255)
VerifyKey.TextSize = 14.000

UICorner_29.CornerRadius = UDim.new(0, 4)
UICorner_29.Parent = VerifyKey

PasteKey.Name = "PasteKey"
PasteKey.Parent = KeySystem
PasteKey.BackgroundColor3 = Color3.fromRGB(128, 1, 255)
PasteKey.BorderColor3 = Color3.fromRGB(0, 0, 0)
PasteKey.BorderSizePixel = 0
PasteKey.Position = UDim2.new(0.379518062, 0, 0.754999995, 0)
PasteKey.Size = UDim2.new(0, 75, 0, 28)
PasteKey.Font = Enum.Font.Unknown
PasteKey.Text = "Paste Key"
PasteKey.TextColor3 = Color3.fromRGB(255, 255, 255)
PasteKey.TextSize = 14.000

UICorner_30.CornerRadius = UDim.new(0, 4)
UICorner_30.Parent = PasteKey

KeyBox.Name = "KeyBox"
KeyBox.Parent = KeySystem
KeyBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
KeyBox.BackgroundTransparency = 1.000
KeyBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
KeyBox.BorderSizePixel = 0
KeyBox.Position = UDim2.new(0.198795184, 0, 0.50999999, 0)
KeyBox.Size = UDim2.new(0, 200, 0, 31)
KeyBox.Font = Enum.Font.Unknown
KeyBox.PlaceholderText = "Input Key Here"
KeyBox.Text = ""
KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyBox.TextSize = 14.000

UICorner_31.CornerRadius = UDim.new(0, 4)
UICorner_31.Parent = KeyBox

Separator_2.Name = "Separator"
Separator_2.Parent = KeySystem
Separator_2.BackgroundColor3 = Color3.fromRGB(128, 1, 255)
Separator_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Separator_2.BorderSizePixel = 0
Separator_2.Position = UDim2.new(0.4246988, 0, 0.430000007, 0)
Separator_2.Size = UDim2.new(0, 50, 0, -2)

GetKey.Name = "GetKey"
GetKey.Parent = KeySystem
GetKey.BackgroundColor3 = Color3.fromRGB(128, 1, 255)
GetKey.BackgroundTransparency = 1.000
GetKey.BorderColor3 = Color3.fromRGB(0, 0, 0)
GetKey.BorderSizePixel = 0
GetKey.Position = UDim2.new(0.695783019, 0, 0.754999995, 0)
GetKey.Size = UDim2.new(0, 75, 0, 28)
GetKey.Font = Enum.Font.Unknown
GetKey.Text = "Get Key"
GetKey.TextColor3 = Color3.fromRGB(255, 255, 255)
GetKey.TextSize = 14.000

UICorner_32.CornerRadius = UDim.new(0, 4)
UICorner_32.Parent = GetKey

Background.Name = "Background"
Background.Parent = Evon
Background.BackgroundColor3 = Color3.fromRGB(88, 0, 178)
Background.BackgroundTransparency = 0.090
Background.BorderColor3 = Color3.fromRGB(0, 0, 0)
Background.BorderSizePixel = 0
Background.Position = UDim2.new(-0.00208340329, 0, 0, 0)
Background.Size = UDim2.new(0, 1281, 0, 798)
Background.Visible = false
Background.ZIndex = -1

ImageLabel.Parent = Background
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BackgroundTransparency = 1.000
ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel.BorderSizePixel = 0
ImageLabel.Size = UDim2.new(0, 1281, 0, 798)
ImageLabel.Image = "http://www.roblox.com/asset/?id=18512356589"

VanguardWatermarked.Name = "VanguardWatermarked"
VanguardWatermarked.Parent = Evon
VanguardWatermarked.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
VanguardWatermarked.BackgroundTransparency = 1.000
VanguardWatermarked.BorderColor3 = Color3.fromRGB(0, 0, 0)
VanguardWatermarked.BorderSizePixel = 0
VanguardWatermarked.Position = UDim2.new(0.282323331, 0, 0.715448976, 0)
VanguardWatermarked.Size = UDim2.new(0, 184, 0, 15)
VanguardWatermarked.Font = Enum.Font.SourceSans
VanguardWatermarked.Text = "Protected by Panda A+ Technology"
VanguardWatermarked.TextColor3 = Color3.fromRGB(4, 100, 184)
VanguardWatermarked.TextSize = 10.000
VanguardWatermarked.TextTransparency = 0.850
VanguardWatermarked.TextXAlignment = Enum.TextXAlignment.Left

-- Scripts:

local function AXDQYSP_fake_script() -- EvonLogo.Minimize 
	local script = Instance.new('LocalScript', EvonLogo)

	local modules = {}
	
	task.spawn(function()
		local script = script
	
		local oldreq = require
		local function require(target)
			if modules[target] then
				return modules[target]()
			end
			return oldreq(target)
		end
	
		local controls = script.Parent.Parent
		local logoBtn = controls.EvonLogo
	
		local cSizeYScale = controls.Size.Y.Scale
		local cSizeTOffset = controls.Size.Y.Offset
	
		local miniSize = UDim2.new(0, 44, cSizeYScale, cSizeTOffset)
		local expSize = UDim2.new(0, 247, cSizeYScale, cSizeTOffset)
		local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	
		local function setVisible(isVisible)
			for _, ctrl in next, controls:GetChildren() do
				if ctrl:IsA("Frame") or ctrl:IsA("TextButton") then
					ctrl.Visible = isVisible
				end
			end
		end
	
		local function isClicked()
			if controls.Size == expSize then
				local tweenGoal = {Size = miniSize}
				local tween = game:GetService("TweenService"):Create(controls, tweenInfo, tweenGoal)
	
				tween:Play()
				setVisible(false)
			else
				local tweenGoal = {Size = expSize}
				local tween = game:GetService("TweenService"):Create(controls, tweenInfo, tweenGoal)
	
				tween:Play()
				task.wait(0.5)
				setVisible(true)
			end
		end
	
		logoBtn.MouseButton1Click:Connect(isClicked)
	end)
end
coroutine.wrap(AXDQYSP_fake_script)()
local function DZTLUU_fake_script() -- EvonLogo.Dragging 
	local script = Instance.new('LocalScript', EvonLogo)

	local frame = script.Parent.Parent
	
	local dragging = false
	local dragInput
	local dragStart
	local startPos
	
	local function update(input)
		local delta = input.Position - dragStart
		frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
	
	frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = frame.Position
	
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	frame.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	
	game:GetService("UserInputService").InputChanged:Connect(function(input)
		if dragging and input == dragInput then
			update(input)
		end
	end)
	
end
coroutine.wrap(DZTLUU_fake_script)()
local function FPRN_fake_script() -- Editor.ButtonFunc 
	local script = Instance.new('LocalScript', Editor)

	local function setVisibility(editor, frameName)
		local TweenService = game:GetService("TweenService")
	
		-- Hide all frames initially
		editor.Editor.Visible = false
		editor.KeySystem.Visible = false
		editor.ScriptHub.Visible = false
		editor.Settings.Visible = false
	
		local frame = editor:FindFirstChild(frameName)
	
		-- If a frame is specified
		if frame then
			if frame.Visible and frame.Position.Y.Scale == 0.5 then
				-- Frame is currently visible, animate it to hide
				TweenService:Create(frame, TweenInfo.new(0.5), {Position = UDim2.new(0.5, 0, 5, 0)}):Play()
				-- After animation completes, set the frame to invisible
				task.delay(0.5, function()
					frame.Visible = false
				end)
			else
				-- Frame is currently hidden, animate it to show
				frame.Position = UDim2.new(0.5, 0, 5, 0)  -- Start position (off-screen)
				frame.Visible = true
				TweenService:Create(frame, TweenInfo.new(0.5), {Position = UDim2.new(0.5, 0, 0.4, 0)}):Play()
			end
		end
	end
	
	task.spawn(function()
		local script = script
	
		local editor = script.Parent.Parent.Parent.Parent
	
		script.Parent.MouseButton1Click:Connect(function()
			setVisibility(editor, "Editor")
		end)
	end)
	
end
coroutine.wrap(FPRN_fake_script)()
local function UTCJEH_fake_script() -- Settings.ButtonFunc 
	local script = Instance.new('LocalScript', Settings)

	local function setVisibility(editor, frameName)
		local TweenService = game:GetService("TweenService")
	
		-- Hide all frames initially
		editor.Editor.Visible = false
		editor.KeySystem.Visible = false
		editor.ScriptHub.Visible = false
		editor.Settings.Visible = false
	
		local frame = editor:FindFirstChild(frameName)
	
		-- If a frame is specified
		if frame then
			if frame.Visible and frame.Position.Y.Scale == 0.5 then
				-- Frame is currently visible, animate it to hide
				TweenService:Create(frame, TweenInfo.new(0.5), {Position = UDim2.new(0.5, 0, 5, 0)}):Play()
				-- After animation completes, set the frame to invisible
				task.delay(0.5, function()
					frame.Visible = false
				end)
			else
				-- Frame is currently hidden, animate it to show
				frame.Position = UDim2.new(0.5, 0, 5, 0)  -- Start position (off-screen)
				frame.Visible = true
				TweenService:Create(frame, TweenInfo.new(0.5), {Position = UDim2.new(0.5, 0, 0.4, 0)}):Play()
			end
		end
	end
	
	task.spawn(function()
		local script = script
	
		local editor = script.Parent.Parent.Parent.Parent
	
		script.Parent.MouseButton1Click:Connect(function()
			setVisibility(editor, "Settings")
		end)
	end)
	
end
coroutine.wrap(UTCJEH_fake_script)()
local function XIMTLIX_fake_script() -- ScriptHub.ButtonFunc 
	local script = Instance.new('LocalScript', ScriptHub)

	local function setVisibility(editor, frameName)
		local TweenService = game:GetService("TweenService")
	
		-- Hide all frames initially
		editor.Editor.Visible = false
		editor.KeySystem.Visible = false
		editor.ScriptHub.Visible = false
		editor.Settings.Visible = false
	
		local frame = editor:FindFirstChild(frameName)
	
		-- If a frame is specified
		if frame then
			if frame.Visible and frame.Position.Y.Scale == 0.5 then
				-- Frame is currently visible, animate it to hide
				TweenService:Create(frame, TweenInfo.new(0.5), {Position = UDim2.new(0.5, 0, 5, 0)}):Play()
				-- After animation completes, set the frame to invisible
				task.delay(0.5, function()
					frame.Visible = false
				end)
			else
				-- Frame is currently hidden, animate it to show
				frame.Position = UDim2.new(0.5, 0, 5, 0)  -- Start position (off-screen)
				frame.Visible = true
				TweenService:Create(frame, TweenInfo.new(0.5), {Position = UDim2.new(0.5, 0, 0.4, 0)}):Play()
			end
		end
	end
	
	task.spawn(function()
		local script = script
	
		local editor = script.Parent.Parent.Parent.Parent
	
		script.Parent.MouseButton1Click:Connect(function()
			setVisibility(editor, "ScriptHub")
		end)
	end)
	
end
coroutine.wrap(XIMTLIX_fake_script)()
local function WAFF_fake_script() -- Controls.ControlHandler 
	local script = Instance.new('LocalScript', Controls)

	print("Hello world!")
	
end
coroutine.wrap(WAFF_fake_script)()
local function FLQV_fake_script() -- Controls.Dragging 
	local script = Instance.new('LocalScript', Controls)

	local frame = script.Parent
	
	local dragging = false
	local dragInput
	local dragStart
	local startPos
	
	local function update(input)
		local delta = input.Position - dragStart
		frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
	
	frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = frame.Position
	
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	frame.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	
	game:GetService("UserInputService").InputChanged:Connect(function(input)
		if dragging and input == dragInput then
			update(input)
		end
	end)
	
end
coroutine.wrap(FLQV_fake_script)()
local function SGHYYUJ_fake_script() -- Clear.Clear 
	local script = Instance.new('LocalScript', Clear)

	local modules = {}
	
	-- Execute
	task.spawn(function()
		local script = script
	
		local oldreq = require
		local function require(target)
			if modules[target] then
				return modules[target]()
			end
			return oldreq(target)
		end
	
		local editor = script.Parent.Parent.Parent.Editor
		local writeCode = editor.container.WriteCode
	
	
		script.Parent.MouseButton1Click:Connect(function()
			-- Clear Button
			writeCode.Text = ""
		end)
	end)
end
-- ************************************************
-- [ Intentional Testing Development ]
-- ************************************************
local function removeTrace(str)
	local x = env[str];
	-- env[str] = nil;
	return x;
end

local runCode = removeTrace("runcode");

coroutine.wrap(SGHYYUJ_fake_script)()
local function JMSZDKK_fake_script() -- Execute.Execute 
	local script = Instance.new('LocalScript', Execute)

	local modules = {}
	
	-- Execute
	task.spawn(function()
		local script = script
	
		local oldreq = require
		local function require(target)
			if modules[target] then
				return modules[target]()
			end
			return oldreq(target)
		end
	
		local editor = script.Parent.Parent.Parent.Editor
		local writeCode = editor.container.WriteCode
	
	
		script.Parent.MouseButton1Click:Connect(function()
			-- Editor Execute Button (Lua Executor Func)
			local scriptBox = writeCode.Text
			print(scriptBox)
			runCode(scriptBox);
		end)
	end)
	
end
coroutine.wrap(JMSZDKK_fake_script)()
local function TWZIPN_fake_script() -- Paste.Paste 
	local script = Instance.new('LocalScript', Paste)

	local modules = {}
	
	-- Execute
	task.spawn(function()
		local script = script
	
		local oldreq = require
		local function require(target)
			if modules[target] then
				return modules[target]()
			end
			return oldreq(target)
		end
	
		local editor = script.Parent.Parent.Parent.Editor
		local writeCode = editor.container.WriteCode
	
	
		script.Parent.MouseButton1Click:Connect(function()
			-- Pasted Button
			writeCode.Text = getclipboard()
		end)
	end)
end
coroutine.wrap(TWZIPN_fake_script)()
local function XEBJ_fake_script() -- ExecClipboard.ExecClipboard 
	local script = Instance.new('LocalScript', ExecClipboard)

	local modules = {}
	
	-- Execute
	task.spawn(function()
		local script = script
	
		local oldreq = require
		local function require(target)
			if modules[target] then
				return modules[target]()
			end
			return oldreq(target)
		end
	
		local editor = script.Parent.Parent.Parent.Editor
		local writeCode = editor.container.WriteCode
	
	
		script.Parent.MouseButton1Click:Connect(function()
			-- Executed Clipboard Function
			local scriptBox = writeCode.Text
			print(scriptBox)
		end)
	end)
end
coroutine.wrap(XEBJ_fake_script)()
local function QOXTYN_fake_script() -- Editor_2.EditorHandler 
	local script = Instance.new('LocalScript', Editor_2)

	local Instances = {
		evon = Instance.new("ScreenGui"),
		
		-- Controls Frame --
		controls = Instance.new("Frame"),
		uiCorner_1 = Instance.new("UICorner"),
		uiPadding_1 = Instance.new("UIPadding"),
		uiStroke_1 = Instance.new("UIStroke"),
		btnContainer = Instance.new("Frame"),
		uiListLayout_1 = Instance.new("UIListLayout"),
		uiPadding_2 = Instance.new("UIPadding"),
		editorBtn = Instance.new("ImageButton"),
		scriptHubBtn = Instance.new("ImageButton"),
		settingsBtn = Instance.new("ImageButton"),
		separator = Instance.new("Frame"),
		evonLogo = Instance.new("ImageButton"),
		
		-- Editor Frame --
		editor = Instance.new("Frame"),
		uiCorner_2 = Instance.new("UICorner"),
		uiStroke_2 = Instance.new("UIStroke"),
		btnContainer_2 = Instance.new("Frame"),
		uiCorner_3 = Instance.new("UICorner"),
		uiStroke_3 = Instance.new("UIStroke"),
		uiListLayout_2 = Instance.new("UIListLayout"),
		clearBtn = Instance.new("ImageButton"),
		execClipboardBtn = Instance.new("ImageButton"),
		executeBtn = Instance.new("ImageButton"),
		pasteBtn = Instance.new("ImageButton"),
		codeEditor = Instance.new("Frame"),
		uiCorner_4 = Instance.new("UICorner"),
		uiStroke_4 = Instance.new("UIStroke"),
		container = Instance.new("ScrollingFrame"),
		uiPadding_3 = Instance.new("UIPadding"),
		lineNumbers = Instance.new("TextBox"),
		writeCode = Instance.new("TextBox"),
		displayCode = Instance.new("TextLabel"),
		
		-- Key System Frame --
		keySystem = Instance.new("Frame"),
		uiCorner_5 = Instance.new("UICorner"),
		uiStroke_5 = Instance.new("UIStroke"),
		separator_2 = Instance.new("Frame"),
		evonLogo_2 = Instance.new("ImageLabel"),
		getKey = Instance.new("TextButton"),
		pasteKey = Instance.new("TextButton"),
		verifyKey = Instance.new("TextButton"),
		inputKey = Instance.new("TextBox"),
		
		-- Script Hub Frame --
		scriptHub = Instance.new("Frame"),
		
		-- Settings Frame --
		settings = Instance.new("Frame"),
		
		-- Notification Frame --
		-- notification = Instance.new("Frame")
	}
end
coroutine.wrap(QOXTYN_fake_script)()
local function DXMQRXV_fake_script() -- Editor_3.Editor 
	local script = Instance.new('LocalScript', Editor_3)

	local modules = {}
	
	task.spawn(function()
		local script = script
	
		local oldreq = require
		local function require(target)
			if modules[target] then
				return modules[target]()
			end
			return oldreq(target)
		end
	
		local UIS = game:GetService("UserInputService")
		local editor = script.Parent
		local container = editor.container
		local lineNumbers = container.LineNumbers
		local writeCode = container.WriteCode
		local displayCode = container.DisplayCode
	
		local function updateLineNumbers()
			local lines = string.split(writeCode.Text, "\n")
			lineNumbers.Text = ""
	
			for i, _ in ipairs(lines) do
				lineNumbers.Text = lineNumbers.Text .. i .. "\n"
			end
		end
	
		local function updateDisplayCode()
			local code = writeCode.Text
			displayCode.Text = ""
	
			local keywords = {"function", "if", "else", "end", "local", "for", "while", "do", "repeat", "until", "then"}
			local others = {"and", "or", "not", "true", "false"}
	
			code = string.gsub(code, "([%a_][%w_]*)%s*%(", '<font color="rgb(90, 189, 247)">%1</font>(')
	
			-- Special case for print function
			code = string.gsub(code, "print%s*%(", '<font color="rgb(255, 255, 255)"><b>print</b></font>(')
	
			for _, keyword in ipairs(keywords) do
				code = string.gsub(code, "%f[%a]" .. keyword .. "%f[%A]", '<font color="rgb(248, 109, 124)"><b>' .. keyword .. '</b></font>')
			end
	
			for _, other in ipairs(others) do
				code = string.gsub(code, "%f[%a]" .. other .. "%f[%A]", '<font color="rgb(255, 198, 0)">' .. other .. '</font>')
			end
	
			displayCode.Text = code
		end
	
	
		writeCode.InputBegan:Connect(function(input, gameProcessedEvent)
			if input.KeyCode == Enum.KeyCode.Return and not gameProcessedEvent then
				writeCode.Text = writeCode.Text .. "\n"
				updateLineNumbers()
				updateDisplayCode()
			end
		end)
	
		writeCode:GetPropertyChangedSignal("Text"):Connect(function()
			updateLineNumbers()
			updateDisplayCode()
		end)
	
		updateLineNumbers()
		updateDisplayCode()
	
	end)
end
coroutine.wrap(DXMQRXV_fake_script)()
local function MUXKI_fake_script() -- CloseGUIBtn.BtnScript 
	local script = Instance.new('LocalScript', CloseGUIBtn)

	-- Get the button instance
	local button = script.Parent
	local ExecutorFrame = script.Parent.Parent
	-- Function to handle button click
	local function Close_Exec()
		ExecutorFrame.Visible = false
		-- You can add more actions here
	end
	
	-- Connect the function to the button's MouseButton1Click event
	button.MouseButton1Click:Connect(Close_Exec)
	
end
coroutine.wrap(MUXKI_fake_script)()
local function ZFRWYEQ_fake_script() -- Frame.SettingsHandler 
	local script = Instance.new('LocalScript', Frame)

	local evon = script.Parent.Parent
	local notif = evon.Notification
	local settingsFrame = evon.Settings
	local adb = settingsFrame.ADB
	local fpsBooster = settingsFrame.FpsBooster
	local strokeChanger = settingsFrame.StrokeChanger
	local bgChanger = settingsFrame.BgChanger
	
	local adbToggle = adb.Toggle
	local fpsBoostToggle = fpsBooster.Toggle
	local scR, scG, scB = strokeChanger.R, strokeChanger.G, strokeChanger.B
	local bcR, bcG, bcB = bgChanger.R, bgChanger.G, bgChanger.B
	
	local defaultStroke = Color3.fromRGB(128, 1, 255)
	local defaultBackground = Color3.fromRGB(15, 15, 15)
	
	local toggleTrue = Color3.new(0, 1, 0)
	local toggleFalse = Color3.new(1, 0, 0)
	
	local function color(instance, r, g, b)
		if type(r) and type(g) and type(b) == "number" then
	
		else
			local errorNotif = notif:Clone()
			errorNotif.Title = "Error"
			errorNotif.Message = "You can only use numerical values 0-9!"
			errorNotif.Visible = true
		end
	end
	
	adbToggle.MouseButton1Click:Connect(function()
	
	end)
	
	fpsBoostToggle.MouseButton1Click:Connect(function()
	
	end)
end
coroutine.wrap(ZFRWYEQ_fake_script)()
local function TJJWG_fake_script() -- HTTPToggle.HTTPDeveloper 
	local script = Instance.new('LocalScript', HTTPToggle)

	-- Get the DeveloperMode button instance
	local developerModeButton = script.Parent
	


	-- Function to handle button click
	local function DeveloperModeToggle()
		-- Toggle the state
		isDeveloperModeOn = not isDeveloperModeOn
	
		-- Print the current state
		if isDeveloperModeOn then
			print("Developer Mode ON")
		else
			print("Developer Mode OFF")
		end
	
		-- Change button color based on the state
		if isDeveloperModeOn then
			developerModeButton.BackgroundColor3 = Color3.fromRGB(50, 205, 50) -- Lime Green
		else
			developerModeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Red
		end
	end
	
	-- Connect the function to the button's MouseButton1Click event
	developerModeButton.MouseButton1Click:Connect(DeveloperModeToggle)
	
	-- Initial button color setup based on the initial state
	if isDeveloperModeOn then
		developerModeButton.BackgroundColor3 = Color3.fromRGB(50, 205, 50) -- Lime Green
	else
		developerModeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Red
	end
	
end
coroutine.wrap(TJJWG_fake_script)()
local function JRAIZ_fake_script() -- FPSToggle.FPSUnlocker 
	local script = Instance.new('LocalScript', FPSToggle)

	-- Get the FPSUnlock button instance
	local fpsUnlockButton = script.Parent
	
	-- Initialize toggle state

	
	-- Function to handle button click
	local function FPSUnlockToggle()
		-- Toggle the state
		isFPSUnlockOn = not isFPSUnlockOn
	
		-- Print the current state
		if isFPSUnlockOn then
			print("FPS Unlock ON")
		else
			print("FPS Unlock OFF")
		end
	
		-- Change button color based on the state
		if isFPSUnlockOn then
			fpsUnlockButton.BackgroundColor3 = Color3.fromRGB(50, 205, 50) -- Lime Green
		else
			fpsUnlockButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Red
		end
	end
	
	-- Connect the function to the button's MouseButton1Click event
	fpsUnlockButton.MouseButton1Click:Connect(FPSUnlockToggle)
	
	-- Initial button color setup based on the initial state
	if isFPSUnlockOn then
		fpsUnlockButton.BackgroundColor3 = Color3.fromRGB(50, 205, 50) -- Lime Green
	else
		fpsUnlockButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Red
	end
	
end
coroutine.wrap(JRAIZ_fake_script)()
local function LCCWF_fake_script() -- DevConsoleBtn.DeveloperMode 
	local script = Instance.new('LocalScript', DevConsoleBtn)

	-- Get the button instance
	local button = script.Parent
	
	-- Function to handle button click
	local function DeveloperModeBtn()
		print("Button clicked!")
		-- You can add more actions here
	end
	
	-- Connect the function to the button's MouseButton1Click event
	button.MouseButton1Click:Connect(DeveloperModeBtn)
	
end
coroutine.wrap(LCCWF_fake_script)()
local function JEVH_fake_script() -- AntiAFKToggle.AntiAFKToggleScript 
	local script = Instance.new('LocalScript', AntiAFKToggle)

	-- Get the button instance
	local button = script.Parent
	
	-- Initialize toggle state

	-- Function to handle button click
	local function AntiAFKToggle()
		-- Toggle the state
		isAntiAFKToggle = not isAntiAFKToggle
	
		-- Print the current state
		if isAntiAFKToggle then
			print("Anti-AFK Toogle is (ON)")
		else
			print("Anti-AFK Toogle is (OFF)")
		end
	
		-- Change button color based on the state
		if isAntiAFKToggle then
			button.BackgroundColor3 = Color3.fromRGB(50, 205, 50) -- Lime Green
		else
			button.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Red
		end
	end
	
	-- Connect the function to the button's MouseButton1Click event
	button.MouseButton1Click:Connect(AntiAFKToggle)
	
	-- Initial button color setup based on the initial state
	if isAntiAFKToggle then
		button.BackgroundColor3 = Color3.fromRGB(50, 205, 50) -- Lime Green
	else
		button.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Red
	end
	
end
coroutine.wrap(JEVH_fake_script)()
local function YQLY_fake_script() -- Frame2.SettingsHandler 
	local script = Instance.new('LocalScript', Frame2)

	local evon = script.Parent.Parent
	local notif = evon.Notification
	local settingsFrame = evon.Settings
	local adb = settingsFrame.ADB
	local fpsBooster = settingsFrame.FpsBooster
	local strokeChanger = settingsFrame.StrokeChanger
	local bgChanger = settingsFrame.BgChanger
	
	local adbToggle = adb.Toggle
	local fpsBoostToggle = fpsBooster.Toggle
	local scR, scG, scB = strokeChanger.R, strokeChanger.G, strokeChanger.B
	local bcR, bcG, bcB = bgChanger.R, bgChanger.G, bgChanger.B
	
	local defaultStroke = Color3.fromRGB(128, 1, 255)
	local defaultBackground = Color3.fromRGB(15, 15, 15)
	
	local toggleTrue = Color3.new(0, 1, 0)
	local toggleFalse = Color3.new(1, 0, 0)
	
	local function color(instance, r, g, b)
		if type(r) and type(g) and type(b) == "number" then
	
		else
			local errorNotif = notif:Clone()
			errorNotif.Title = "Error"
			errorNotif.Message = "You can only use numerical values 0-9!"
			errorNotif.Visible = true
		end
	end
	
	adbToggle.MouseButton1Click:Connect(function()
	
	end)
	
	fpsBoostToggle.MouseButton1Click:Connect(function()
	
	end)
end
coroutine.wrap(YQLY_fake_script)()
local function IFQVZO_fake_script() -- Toggle.ESPModeToggle 
	local script = Instance.new('LocalScript', Toggle)

	-- Get the button instance
	local button = script.Parent
	
	-- Initialize toggle state

	-- Function to handle button click
	local function ESPModeToggle()
		-- Toggle the state
		isESPModeOn = not isESPModeOn
	
		-- Print the current state
		if isESPModeOn then
			print("ESP Mode ON")
		else
			print("ESP Mode OFF")
		end
	
		-- Change button color based on the state
		if isESPModeOn then
			button.BackgroundColor3 = Color3.fromRGB(50, 205, 50) -- Lime Green
		else
			button.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Red
		end
	end
	
	-- Connect the function to the button's MouseButton1Click event
	button.MouseButton1Click:Connect(ESPModeToggle)
	
	-- Initial button color setup based on the initial state
	if isESPModeOn then
		button.BackgroundColor3 = Color3.fromRGB(50, 205, 50) -- Lime Green
	else
		button.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Red
	end
	
end
coroutine.wrap(IFQVZO_fake_script)()
local function OUPC_fake_script() -- BoostBtn.BtnScript 
	local script = Instance.new('LocalScript', BoostBtn)

	-- Get the button instance
	local button = script.Parent
	
	-- Function to handle button click
	local function BoostModeBtn()
		print("Button clicked!")
		-- You can add more actions here
	end
	
	-- Connect the function to the button's MouseButton1Click event
	button.MouseButton1Click:Connect(BoostModeBtn)
	
end
coroutine.wrap(OUPC_fake_script)()
local function LZKDEP_fake_script() -- CloseGUIBtn_2.BtnScript 
	local script = Instance.new('LocalScript', CloseGUIBtn_2)

	-- Get the button instance
	local button = script.Parent
	local SettingsFrame = script.Parent.Parent
	-- Function to handle button click
	local function Close_Settings()
		SettingsFrame.Visible = false
		-- You can add more actions here
	end
	
	-- Connect the function to the button's MouseButton1Click event
	button.MouseButton1Click:Connect(Close_Settings)
	
end
coroutine.wrap(LZKDEP_fake_script)()
local function LXHTKN_fake_script() -- ScriptHub_2.ScriptHubHandler 
	local script = Instance.new('LocalScript', ScriptHub_2)

	
end
coroutine.wrap(LXHTKN_fake_script)()
local function XQVAWJ_fake_script() -- CloseGUIBtn_3.BtnScript 
	local script = Instance.new('LocalScript', CloseGUIBtn_3)

	-- Get the button instance
	local button = script.Parent
	local ScriptHubFrame = script.Parent.Parent
	-- Function to handle button click
	local function Close_ScriptHub()
		ScriptHubFrame.Visible = false
		-- You can add more actions here
	end
	
	-- Connect the function to the button's MouseButton1Click event
	button.MouseButton1Click:Connect(Close_ScriptHub)
	
end
coroutine.wrap(XQVAWJ_fake_script)()
local function VXUJHM_fake_script() -- VerifyKey.LocalScript 
	local script = Instance.new('LocalScript', VerifyKey)

	-- Get the button instance
	local button = script.Parent
	
	local ControllerMenuFrame = script.Parent.Parent.Parent.Controls
	local KeySysManagement = script.Parent.Parent
	local KeyBoxText = script.Parent.Parent.KeyBox
	-- Function to handle button click
	local function VerifyEvonKeySystem()
        local KeyInserted = KeyBoxText.Text
		if Authenticate_Evon(KeyInserted) then
            ControllerMenuFrame.Visible = true
            KeySysManagement.Visible = false
        end
		print('Key: '.. KeyInserted)
	end
	
	-- Connect the function to the button's MouseButton1Click event
	button.MouseButton1Click:Connect(VerifyEvonKeySystem)
	
end
coroutine.wrap(VXUJHM_fake_script)()
local function SXKOTO_fake_script() -- PasteKey.LocalScript 
	local script = Instance.new('LocalScript', PasteKey)

	-- Get the button instance
	local button = script.Parent
	
	-- Function to handle button click
	local function PasteKeyEvon()
		print('(DEBUG) Pasted Key')
	end
	
	-- Connect the function to the button's MouseButton1Click event
	button.MouseButton1Click:Connect(PasteKeyEvon)
	
end
coroutine.wrap(SXKOTO_fake_script)()
local function XTEHCQV_fake_script() -- KeySystem.KeySysHandler 
	local script = Instance.new('LocalScript', KeySystem)


	local service = "evon"
	local saveFile = "pandaAuthKey.txt"
	
	local getKey = script.Parent.GetKey
	local pasteKey = script.Parent.PasteKey
	local verifyKey = script.Parent.VerifyKey
	local textBox = script.Parent.TextBox
	local controls = script.Parent.Parent.Controls
	
	pasteKey.MouseButton1Click:Connect(function() 
		textBox.Text = getclipboard() -- getclipboard()
	end)
	
	verifyKey.MouseButton1Click:Connect(function() 
		-- Panda Authentication Here
		script.Parent.Visible = false
		controls.Visible = true
	end)
	
	getKey.MouseButton1Click:Connect(function()
		-- setclipboard(pandaAuth:GetLink(service))
		textBox.PlaceholderText = "Link Copied to Clipboard"
	end)
end
coroutine.wrap(XTEHCQV_fake_script)()
local function RVCNVIN_fake_script() -- GetKey.LocalScript 
	local script = Instance.new('LocalScript', GetKey)

	-- Get the button instance
	local button = script.Parent
	
	-- Function to handle button click
	local function GetKeyEvon()
        setclipboard(Generate_Key())
	end
	
	-- Connect the function to the button's MouseButton1Click event
	button.MouseButton1Click:Connect(GetKeyEvon)
	
end
coroutine.wrap(RVCNVIN_fake_script)()


-- local Developer_Player = "271635429"
-- local test_ModeAhax = false;

-- local KeySystem_Domain = "https://pandadevelopment.net"

-- -- Evon Basic Configurations
-- local ConfigURL = "https://evon.cc/android/config/EvonConfig.json"

-- local http_service = cloneref(game:GetService("HttpService"))
-- local EvonConfiguration = http_service:JSONDecode(game:HttpGet(ConfigURL))

-- if test_ModeAhax == true then
-- 	print("********************************************************************************")
-- 	warn("**** Evon Android Undergoes Maintenance, It will be back in a few minutes **** ")
-- 	print("********************************************************************************")
-- else
-- --// Instances
-- local function EvonNotification(messages)
-- 	game.StarterGui:SetCore("SendNotification", {
-- 		Title = "Evon Android"; -- the title (ofc)
-- 		Text = messages; -- what the text says (ofc)
-- 		Icon = "rbxassetid://15509574978"; -- the image if u want. 
-- 		Duration = 5; -- how long the notification should in secounds
-- 	})
-- end


-- local function EvonDebug(text)
-- 	if tostring(game:GetService("Players").LocalPlayer.UserId) == Developer_Player then
-- 		print("[ Developer ] - ".. text)
-- 	end
-- end

-- local IsKeyLess = false -- EvonConfiguration.Keyless

-- local function EvonCheckKey(ClientKey)
-- 	------------------------------ Check Key -----------------------------------------
-- 	local evonID = "evon"
-- 	local PandaAuth = loadstring(game:HttpGet('https://raw.githubusercontent.com/Panda-Repositories/PandaKS_Libraries/main/library/LuaLib/ROBLOX/PandaBetaLib.lua'))()
-- 	if ClientKey == "skie" then
-- 		if tostring(game:GetService("Players").LocalPlayer.UserId) == Developer_Player then
-- 			return true
-- 		end
-- 		return false
-- 	elseif IsKeyLess then
-- 		EvonNotification("Key System Disabled...")
-- 		return true
-- 	elseif PandaAuth:ValidateKey(evonID, ClientKey) then
-- 		print('Authorized Complete')
-- 		return true
-- 	else
-- 		warn('Failed to Authorized...')
-- 		return false
-- 	end
-- 		------------------------------ Check Key -----------------------------------------
-- end
-- function Load_CustomFunctions()
-- 	print("Custom Features successfully loaded...")
-- end
-- --[[ Settings ]]--

-- local maxLines = 250;

-- --[[ Variables ]]--

-- local httpService = game:GetService("HttpService");
-- local teleportService = game:GetService("TeleportService");
-- local textService = game:GetService("TextService");
-- local tweenService = game:GetService("TweenService");
-- local userInputService = game:GetService("UserInputService");

-- local localPlayer = game:GetService("Players").LocalPlayer;

-- local hugeVector2 = Vector2.new(math.huge, math.huge);

-- local rScriptsApiKey = "0";

-- local env = getgenv();
-- local isFirstTimeExecution = true;

-- local _newcclosure = clonefunction(newcclosure);

-- local _setfpscap = clonefunction(setfpscap);
-- local _getfpsmax = clonefunction(getfpsmax or _newcclosure(function()
-- 	return 60;
-- end));

-- local _getconnections = clonefunction(getconnections);
-- local _getcustomasset = clonefunction(getcustomasset or getsynasset);

-- local _isfile = clonefunction(isfile);
-- local _readfile = clonefunction(readfile);
-- local _writefile = clonefunction(writefile);
-- local _delfile = clonefunction(delfile);
-- local _listfiles = clonefunction(listfiles);

-- local _isfolder = clonefunction(isfolder);
-- local _makefolder = clonefunction(makefolder);

-- local _getclipboard = clonefunction(getclipboard or _newcclosure(function()
-- 	return "";
-- end));
-- local _setclipboard = clonefunction(setclipboard);

-- local _request = clonefunction(request);
-- local _base64decode = clonefunction(crypt.base64.decode);

-- local urlEncode = clonefunction(httpService.UrlEncode);
-- local jsonEncode = clonefunction(httpService.JSONEncode);
-- local jsonDecode = clonefunction(httpService.JSONDecode);

-- local _gethui = clonefunction(gethui or _newcclosure(function()
-- 	return game:GetService("CoreGui");
-- end));

-- local validSearchFunctions = { 
-- 	ScriptBlox = "rbxassetid://13107640311",
-- 	RScripts = "rbxassetid://13107640500"
-- };

-- local serverHopModes = { "full", "empty", "bestPing", "random" };

-- local resizeFunctions, languageItems, languageDatabase = {}, {}, {
-- 	English = {
-- 		flag = "rbxassetid://13084648602",
-- 		indicator = "English",
-- 		order = 1,
-- 		phrases = {
-- 			FreeLogin = "Free Login",
-- 			AdlessLogin = "Adless Login",
-- 			EnterKey = "Enter Key",
-- 			CopyKeyLink = "Copy Key Link",
-- 			["Key..."] = "Key...",
-- 			SubmitCredentials = "Submit Credentials",
-- 			["User..."] = "Username...",
-- 			["Password..."] = "Password...",
-- 			Editor = "Editor",
-- 			Execute = "Execute",
-- 			Clear = "Clear",
-- 			Clipboard = "Clipboard",
-- 			CopyScript = "Copy Script",
-- 			LoadScript = "Load Script",
-- 			["Search..."] = "Search...",
-- 			Search = "Search",
-- 			ClearConsole = "Clear Console",
-- 			CopyConsole = "Copy Console",
-- 			UnlockFPS = "Unlock FPS",
-- 			VSync = "V-Sync",
-- 			FPS = "FPS",
-- 			AntiAFK = "Anti AFK",
-- 			Full = "Full",
-- 			Empty = "Empty",
-- 			BestPing = "Best Ping",
-- 			Random = "Random",
-- 			ServerHop = "Server Hop",
-- 			RejoinServer = "Rejoin Server"
-- 		}
-- 	},
-- 	Turkish = {
-- 		flag = "rbxassetid://13084681224",
-- 		indicator = "Türkçe",
-- 		order = 2,
-- 		phrases = {
-- 			FreeLogin = "Ücretsiz Giriş",
-- 			AdlessLogin = "Reklamsız Giriş",
-- 			EnterKey = "Anahtarı Gir",
-- 			CopyKeyLink = "Anahtar Linkini Kopyala",
-- 			["Key..."] = "Anahtar...",
-- 			SubmitCredentials = "Giriş Yap",
-- 			["User..."] = "İsim...",
-- 			["Password..."] = "Şifre...",
-- 			Editor = "Düzenleyici",
-- 			Execute = "Yürüt",
-- 			Clear = "Temizle",
-- 			Clipboard = "Pano",
-- 			CopyScript = "Panoya Kopyala",
-- 			LoadScript = "Panodan Yükle",
-- 			["Search..."] = "Arat...",
-- 			Search = "Arama",
-- 			ClearConsole = "Konsolu Temizle",
-- 			CopyConsole = "Konsolu Kopyala",
-- 			UnlockFPS = "FPS Kilidini Aç",
-- 			VSync = "",
-- 			FPS = "",
-- 			AntiAFK = "",
-- 			Full = "",
-- 			Empty = "",
-- 			BestPing = "",
-- 			Random = "",
-- 			ServerHop = "",
-- 			RejoinServer = ""
-- 		}
-- 	},
-- 	Spanish = {
-- 		flag = "rbxassetid://13084681842",
-- 		indicator = "Español",
-- 		order = 4,
-- 		phrases = {
-- 			FreeLogin = "Iniciar sesion gratis",
-- 			AdlessLogin = "Iniciar sesion sin anuncios",
-- 			EnterKey = "Ingresar Key",
-- 			CopyKeyLink = "Copiar enlace de la Key",
-- 			["Key..."] = "Key...",
-- 			SubmitCredentials = "Enviar Credenciales",
-- 			["User..."] = "Usuario...",
-- 			["Password..."] = "Contraseña...",
-- 			Editor = "Editor",
-- 			Execute = "Executar",
-- 			Clear = "Limpiar",
-- 			Clipboard = "Portapapeles",
-- 			CopyScript = "Copiar Script",
-- 			LoadScript = "Cargar Script",
-- 			["Search..."] = "Buscar...",
-- 			Search = "Buscar",
-- 			ClearConsole = "Limpiar Consola",
-- 			CopyConsole = "Copiar Consola",
-- 			UnlockFPS = "Unlocar FPS",
-- 			VSync = "",
-- 			FPS = "",
-- 			AntiAFK = "",
-- 			Full = "",
-- 			Empty = "",
-- 			BestPing = "",
-- 			Random = "",
-- 			ServerHop = "",
-- 			RejoinServer = ""
-- 		}
-- 	},
-- 	Latvian = {
-- 		flag = "rbxassetid://13084681629",
-- 		indicator = "Latviski",
-- 		order = 5,
-- 		phrases = {
-- 			FreeLogin = "Bezmaksas pieeja",
-- 			AdlessLogin = "Bez-reklāmu pieeja",
-- 			EnterKey = "Ievadi atslēgu",
-- 			CopyKeyLink = "Kopēt atslēgas saiti",
-- 			["Key..."] = "Atslēga...",
-- 			SubmitCredentials = "Apstiprināt akreditācijas datus",
-- 			["User..."] = "Lietotājs...",
-- 			["Password..."] = "Parole...",
-- 			Editor = "Redaktors",
-- 			Execute = "Izpildīt",
-- 			Clear = "Iztīrīt",
-- 			Clipboard = "Kopējumi",
-- 			CopyScript = "Kopēt skriptu",
-- 			LoadScript = "Ielādēt skriptu",
-- 			["Search..."] = "Meklēt...",
-- 			Search = "Meklēt",
-- 			ClearConsole = "Iztīrīt konsoli",
-- 			CopyConsole = "Kopēt konsoli",
-- 			UnlockFPS = "Atbloķējiet FPS",
-- 			VSync = "",
-- 			FPS = "",
-- 			AntiAFK = "",
-- 			Full = "",
-- 			Empty = "",
-- 			BestPing = "",
-- 			Random = "",
-- 			ServerHop = "",
-- 			RejoinServer = ""
-- 		}
-- 	},
-- 	Dutch = {
-- 		flag = "rbxassetid://15984949262",
-- 		indicator = "Nederlands",
-- 		order = 6,
-- 		phrases = {
-- 			FreeLogin = "Gratis Login",
-- 			AdlessLogin = "ReclameVrij Login",
-- 			EnterKey = "Toegangs Sleutel",
-- 			CopyKeyLink = "Kopieer Sleutel Link",
-- 			["Key..."] = "Sleutel...",
-- 			SubmitCredentials = "Verzend Gegevens",
-- 			["User..."] = "Gebruiker...",
-- 			["Password..."] = "Wachtwoord...",
-- 			Editor = "Editor",
-- 			Execute = "Uitvoeren",
-- 			Clear = "Clear",
-- 			Clipboard = "Klembord",
-- 			CopyScript = "Kopieer Script ",
-- 			LoadScript = "Laad Script",
-- 			["Search..."] = "Zoeken...",
-- 			Search = "Zoeken",
-- 			ClearConsole = "Clear Console",
-- 			CopyConsole = "Kopieer Console",
-- 			UnlockFPS = "Ontgrendelen FPS",
-- 			VSync = "",
-- 			FPS = "",
-- 			AntiAFK = "",
-- 			Full = "",
-- 			Empty = "",
-- 			BestPing = "",
-- 			Random = "",
-- 			ServerHop = "",
-- 			RejoinServer = ""
-- 		}
-- 	},
-- 	Filipino = {
-- 		flag = "rbxassetid://15984949030",
-- 		indicator = "Filipino",
-- 		order = 7,
-- 		phrases = {
-- 			FreeLogin = "Libreng Login",
-- 			AdlessLogin = "Ad-Free Login",
-- 			EnterKey = "Ilagay ang susi",
-- 			CopyKeyLink = "Kopyahin ang Susi Link",
-- 			["Key..."] = "Susi...",
-- 			SubmitCredentials = "Ipasa ang Kredensyals",
-- 			["User..."] = "User",
-- 			["Password..."] = "Password",
-- 			Editor = "Editor",
-- 			Execute = "Execute",
-- 			Clear = "Clear",
-- 			Clipboard = "Clipboard",
-- 			CopyScript = "Kopyahin ang script",
-- 			LoadScript = "I-Load ang script",
-- 			["Search..."] = "Maghanap...",
-- 			Search = "Maghanap",
-- 			ClearConsole = "ClearConsole",
-- 			CopyConsole = "CopyConsole",
-- 			UnlockFPS = "",
-- 			VSync = "",
-- 			FPS = "",
-- 			AntiAFK = "",
-- 			Full = "",
-- 			Empty = "",
-- 			BestPing = "",
-- 			Random = "",
-- 			ServerHop = "",
-- 			RejoinServer = ""
-- 		}
-- 	},
-- 	German = {
-- 		flag = "rbxassetid://15984949736",
-- 		indicator = "Deustch",
-- 		order = 8,
-- 		phrases = {
-- 			FreeLogin = "Kostenloser Login",
-- 			AdlessLogin = "Adless Login",
-- 			EnterKey = "Key checken",
-- 			CopyKeyLink = "Link kopieren",
-- 			["Key..."] = "Schlüssel",
-- 			SubmitCredentials = "Einloggen",
-- 			["User..."] = "Nutzername",
-- 			["Password..."] = "Passwort",
-- 			Editor = "Editor",
-- 			Execute = "Ausführen",
-- 			Clear = "Löschen",
-- 			Clipboard = "",
-- 			CopyScript = "Skript Kopieren",
-- 			LoadScript = "Skript Laden",
-- 			["Search..."] = "Suchen...",
-- 			Search = "Suchen",
-- 			ClearConsole = "Konsole löschen",
-- 			CopyConsole = "Konsole kopieren",
-- 			UnlockFPS = "Freischalten FPS",
-- 			VSync = "",
-- 			FPS = "",
-- 			AntiAFK = "",
-- 			Full = "",
-- 			Empty = "",
-- 			BestPing = "",
-- 			Random = "",
-- 			ServerHop = "",
-- 			RejoinServer = ""
-- 		}
-- 	},
-- 	Romanian = {
-- 		flag = "rbxassetid://15984948805",
-- 		indicator = "Română",
-- 		order = 9,
-- 		phrases = {
-- 			FreeLogin = "Logare Gratis",
-- 			AdlessLogin = "Logare fara reclame",
-- 			EnterKey = "Introduce cheie",
-- 			CopyKeyLink = "Copie adresa pentru cheie",
-- 			["Key..."] = "Cheie...",
-- 			SubmitCredentials = "Introduce-ti datele",
-- 			["User..."] = "Utilizator...",
-- 			["Password..."] = "Parola...",
-- 			Editor = "Editor",
-- 			Execute = "Executa",
-- 			Clear = "Goleste",
-- 			Clipboard = "Clipboard",
-- 			CopyScript = "Copiaza Script",
-- 			LoadScript = "Incarca Script",
-- 			["Search..."] = "Cauta...",
-- 			Search = "Cauta",
-- 			ClearConsole = "Goleste Consola",
-- 			CopyConsole = "Copiaza din Consola",
-- 			UnlockFPS = "Deblocați FPS",
-- 			VSync = "",
-- 			FPS = "",
-- 			AntiAFK = "",
-- 			Full = "",
-- 			Empty = "",
-- 			BestPing = "",
-- 			Random = "",
-- 			ServerHop = "",
-- 			RejoinServer = ""
-- 		}
-- 	},
-- 	Russian = {
-- 		flag = "rbxassetid://15984948564",
-- 		indicator = "Русский",
-- 		order = 10,
-- 		phrases = {
-- 			FreeLogin = "Бесплатный логин",
-- 			AdlessLogin = "Логин с рекламой ",
-- 			EnterKey = "Ввести ключ ",
-- 			CopyKeyLink = "Скопировать ссылку на ключ",
-- 			["Key..."] = "Ключ...",
-- 			SubmitCredentials = "Подтвердить реквизиты для входа",
-- 			["User..."] = "Юзер...",
-- 			["Password..."] = "Пароль...",
-- 			Editor = "Эдитор",
-- 			Execute = "Запустить",
-- 			Clear = "Очистить",
-- 			Clipboard = "Буфер Обмена",
-- 			CopyScript = "Скопировать скрипт",
-- 			LoadScript = "Загрузить скрипт",
-- 			["Search..."] = "Искать...",
-- 			Search = "Искать",
-- 			ClearConsole = "Очистить консоль",
-- 			CopyConsole = "Скопировать консоль",
-- 			UnlockFPS = "Разблокировать FPS",
-- 			VSync = "",
-- 			FPS = "",
-- 			AntiAFK = "",
-- 			Full = "",
-- 			Empty = "",
-- 			BestPing = "",
-- 			Random = "",
-- 			ServerHop = "",
-- 			RejoinServer = ""
-- 		}
-- 	},
-- 	French = {
-- 		flag = "rbxassetid://15984949489",
-- 		indicator = "Français",
-- 		order = 11,
-- 		phrases = {
-- 			FreeLogin = "Connexion gratuite",
-- 			AdlessLogin = "Connexion AdLess",
-- 			EnterKey = "Confirmer la clé",
-- 			CopyKeyLink = "Copier le lien de la clé",
-- 			["Key..."] = "Clé...",
-- 			SubmitCredentials = "Se connecter",
-- 			["User..."] = "Nom d'utilisateur...",
-- 			["Password..."] = "Mot de passe...",
-- 			Editor = "Éditeur",
-- 			Execute = "Exécuter",
-- 			Clear = "Effacer",
-- 			Clipboard = "Presse-papier",
-- 			CopyScript = "Copier le script",
-- 			LoadScript = "Charger le script",
-- 			["Search..."] = "Rechercher...",
-- 			Search = "Chercher",
-- 			ClearConsole = "Effacer la console",
-- 			CopyConsole = "Copier la console",
-- 			UnlockFPS = "Déverrouiller les FPS",
-- 			VSync = "Synchronisation verticale",
-- 			FPS = "FPS",
-- 			AntiAFK = "Anti-AFK",
-- 			Full = "Rempli",
-- 			Empty = "Vide",
-- 			BestPing = "Meilleur ping",
-- 			Random = "Au hasard",
-- 			ServerHop = "Changer de serveur",
-- 			RejoinServer = "Rejoindre le serveur"
-- 		}
-- 	},
-- 	Arabic = {
-- 		flag = "rbxassetid://15984948296",
-- 		indicator = "عربي",
-- 		order = 12,
-- 		phrases = {
-- 			FreeLogin = "المجاني الدخول تسجيل",
-- 			AdlessLogin = "إعلانات بلا دخول تسجيل",
-- 			EnterKey = "المفتاح أدخل",
-- 			CopyKeyLink = "المفتاح رابط نسخ",
-- 			["Key..."] = "المفتاح",
-- 			SubmitCredentials = "الاعتماد بيانات إرسال",
-- 			["User..."] = "المستخدم",
-- 			["Password..."] = "المرور كلمة",
-- 			Editor = "المحرر",
-- 			Execute = "تنفيذ",
-- 			Clear = "إخلاء",
-- 			Clipboard = "الحافظة",
-- 			CopyScript = "النصي البرنامج نسخ",
-- 			LoadScript = "النصي البرنامج حمل",
-- 			["Search..."] = "بحث",
-- 			Search = "بحث",
-- 			ClearConsole = "التحكم وحدة إخلاء",
-- 			CopyConsole = "التحكم وحدة نسخ",
-- 			UnlockFPS = "افتح FPS",
-- 			VSync = "",
-- 			FPS = "",
-- 			AntiAFK = "",
-- 			Full = "",
-- 			Empty = "",
-- 			BestPing = "",
-- 			Random = "",
-- 			ServerHop = "",
-- 			RejoinServer = ""
-- 		}
-- 	}
-- };

-- local sortedLanguageDatabase = {};
-- for i, v in next, languageDatabase do
-- 	sortedLanguageDatabase[v.order] = {
-- 		key = i,
-- 		value = v
-- 	};
-- end

-- --[[ Settings ]]--

-- local uiSettings = {
-- 	key = "",
-- 	userName = "",
-- 	editorInit = "print(\"Evon-Android >>>\");",
-- 	searchAPI = "ScriptBlox",
-- 	language = "English",
-- 	unlockFps = false,
-- 	vSync = false,
-- 	fps = 60,
-- 	antiAfk = false,
-- 	serverHopMode = "full"
-- };

-- if _isfolder("evonui") == false then
-- 	_makefolder("evonui");
-- end
-- if _isfile("evonui/settings.json") then
-- 	isFirstTimeExecution = false;
-- 	local succ, res = pcall(jsonDecode, httpService, _readfile("evonui/settings.json"));
-- 	if succ then
-- 		for i, v in next, uiSettings do
-- 			if res[i] ~= nil and type(res[i]) == type(v) then
-- 				uiSettings[i] = res[i];
-- 			end
-- 		end
-- 	end
-- 	if languageDatabase[uiSettings.language] == nil then
-- 		uiSettings.language = "English";
-- 	end
-- 	if validSearchFunctions[uiSettings.searchAPI] == nil then
-- 		uiSettings.searchAPI = "ScriptBlox";
-- 	end
-- 	if table.find(serverHopModes, uiSettings.serverHopMode) == nil then
-- 		uiSettings.serverHopMode = serverHopModes[1];
-- 	end
-- end

-- --[[ Functions ]]--

-- local function create(className, properties, children)
-- 	local inst = Instance.new(className);
-- 	for i, v in next, properties do
-- 		if i == "LanguageItem" then
-- 			languageItems[inst] = v;
-- 			print(v.identifier);
-- 			inst[v.property] = languageDatabase[uiSettings.language].phrases[v.identifier];
-- 		elseif i ~= "Parent" then
-- 			inst[i] = v;
-- 		end
-- 	end
-- 	if children then
-- 		for i, v in next, children do
-- 			v.Parent = inst;
-- 		end
-- 	end
-- 	inst.Parent = properties.Parent;
-- 	return inst;
-- end

-- local function tween(obj, dur, props, ...)
-- 	local t = tweenService:Create(obj, TweenInfo.new(dur, ...), props);
-- 	t:Play();
-- 	return t;
-- end

-- local function addTransparencyHighlights(btn)
-- 	btn.MouseButton1Down:Connect(function()
-- 		tween(btn, 0.18, {
-- 			BackgroundTransparency = 0
-- 		});
-- 	end);
-- 	btn.MouseButton1Up:Connect(function()
-- 		tween(btn, 0.18, {
-- 			BackgroundTransparency = 1
-- 		});
-- 	end);
-- end

-- local function addColourHighlights(btn, col)
-- 	local original = btn.BackgroundColor3;
-- 	btn.MouseButton1Down:Connect(function()
-- 		tween(btn, 0.18, {
-- 			BackgroundColor3 = col
-- 		});
-- 	end);
-- 	btn.MouseButton1Up:Connect(function()
-- 		tween(btn, 0.18, {
-- 			BackgroundColor3 = original
-- 		});
-- 	end);
-- end

-- local function removeTrace(str)
-- 	local x = env[str];
-- 	-- env[str] = nil;
-- 	return x;
-- end

-- local function changeLanguage(lang)
-- 	local language = languageDatabase[lang] or languageDatabase.English;
-- 	uiSettings.language = language == languageDatabase.English and "English" or lang;
-- 	for i, v in next, languageItems do
-- 		local phrase = language.phrases[v.identifier];
-- 		i[v.property] = phrase ~= "" and phrase or languageDatabase.English.phrases[v.identifier];
-- 	end
-- 	task.defer(function() -- To give the TextBounds property a chance to update, it's not as immediate as you might think
-- 		for i = 1, #resizeFunctions do
-- 			resizeFunctions[i]();
-- 		end
-- 	end);
-- end

-- local function updateSettings(key, value)
-- 	uiSettings[key] = value;
-- 	if key == "language" then
-- 		changeLanguage(value);
-- 	end
-- 	pcall(_writefile, "evonui/settings.json", jsonEncode(httpService, uiSettings));
-- end

-- --[[ Create UI ]]--

-- local gui = create("ScreenGui", { 
-- 	DisplayOrder = 11, 
-- 	IgnoreGuiInset = true, 
-- 	Name = "androidCheat", 
-- 	Parent = _gethui(), 
-- 	ResetOnSpawn = false
-- });

-- local function loadKeyUI(callback)
-- 	--local libVersion = "v2"
-- 	--local libType = "roblox"
-- 	--nlocal serviceID = "evon"

-- 	-- local pandaAuth = loadstring(game:HttpGet(string.format("https://pandadevelopment.net/servicelib?service=%s&core=%s&param=%s", serviceID, libType, libVersion)))()

-- 	local keyFrame = create("Frame", { 
-- 		AnchorPoint = Vector2.new(0.5, 0), 
-- 		BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 		BorderSizePixel = 0, 
-- 		Name = "keyFrame", 
-- 		Parent = gui, 
-- 		Position = UDim2.new(0.5, 0, 0, 25), 
-- 		Size = UDim2.new(1, -110, 0, 94)
-- 	}, {
-- 		create("UIGradient", { 
-- 			Color = ColorSequence.new({ 
-- 				ColorSequenceKeypoint.new(0, Color3.fromHex("1c1c1c")), 
-- 				ColorSequenceKeypoint.new(1, Color3.fromHex("242424"))
-- 			}), 
-- 			Name = "gradient", 
-- 			Rotation = 78
-- 		}),
-- 		create("UICorner", { 
-- 			CornerRadius = UDim.new(0, 4), 
-- 			Name = "corner"
-- 		}),
-- 		create("TextButton", { 
-- 			AutoButtonColor = false, 
-- 			BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 			BackgroundTransparency = 1, 
-- 			FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal), 
-- 			FontSize = Enum.FontSize.Size14, 
-- 			Name = "clickThroughBlocker", 
-- 			Size = UDim2.new(1, 0, 1, 0), 
-- 			Text = "", 
-- 			TextColor3 = Color3.fromHex("000000"), 
-- 			TextSize = 14, 
-- 			ZIndex = 0
-- 		}),
-- 		create("ImageLabel", { 
-- 			AnchorPoint = Vector2.new(0.5, 0.5), 
-- 			BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 			BackgroundTransparency = 1, 
-- 			Image = "rbxassetid://12874061329", 
-- 			ImageColor3 = Color3.fromHex("000000"), 
-- 			Name = "blur", 
-- 			Position = UDim2.new(0.5, 0, 0.5, 0), 
-- 			ScaleType = Enum.ScaleType.Slice, 
-- 			Size = UDim2.new(1, 10, 1, 10), 
-- 			SliceCenter = Rect.new(10, 10, 118, 118), 
-- 			ZIndex = 0
-- 		}),
-- 		create("UIStroke", { 
-- 			ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
-- 			Color = Color3.fromHex("141414"), 
-- 			Name = "stroke", 
-- 			Thickness = 0.8
-- 		}),
-- 		create("UISizeConstraint", { 
-- 			MaxSize = Vector2.new(800, 94), 
-- 			Name = "constraint"
-- 		}),
-- 		create("Frame", { 
-- 			AnchorPoint = Vector2.new(0.5, 0.5), 
-- 			BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 			BackgroundTransparency = 1, 
-- 			Name = "content", 
-- 			Position = UDim2.new(0.5, 0, 0.5, 0), 
-- 			Size = UDim2.new(1, 0, 1, 0)
-- 		}, {
-- 			create("UIListLayout", { 
-- 				FillDirection = Enum.FillDirection.Horizontal, 
-- 				Name = "list", 
-- 				Padding = UDim.new(0, 8), 
-- 				SortOrder = Enum.SortOrder.LayoutOrder
-- 			}),
-- 			create("UIPadding", { 
-- 				Name = "padding", 
-- 				PaddingBottom = UDim.new(0, 8), 
-- 				PaddingLeft = UDim.new(0, 8), 
-- 				PaddingRight = UDim.new(0, 8), 
-- 				PaddingTop = UDim.new(0, 8)
-- 			}),
-- 			create("Frame", { 
-- 				AnchorPoint = Vector2.new(0, 0.5), 
-- 				BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 				BackgroundTransparency = 1, 
-- 				Name = "buttons", 
-- 				Position = UDim2.new(0, 8, 0.5, 0), 
-- 				Size = UDim2.new(0, 124, 1, 0)
-- 			}, {
-- 				create("TextButton", { 
-- 					AnchorPoint = Vector2.new(0.5, 0), 
-- 					AutoButtonColor = false, 
-- 					BackgroundColor3 = Color3.fromHex("181818"), 
-- 					FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal), 
-- 					FontSize = Enum.FontSize.Size11, 
-- 					Name = "freemium", 
-- 					Position = UDim2.new(0.5, 0, 0, 0), 
-- 					Size = UDim2.new(1, 0, 0, 34), 
-- 					Text = "", 
-- 					TextColor3 = Color3.fromHex("ebebeb"), 
-- 					TextSize = 11
-- 				}, {
-- 					create("UICorner", { 
-- 						CornerRadius = UDim.new(0, 4), 
-- 						Name = "corner"
-- 					}),
-- 					create("UIStroke", { 
-- 						ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
-- 						Color = Color3.fromHex("141414"), 
-- 						Name = "stroke", 
-- 						Thickness = 1.2
-- 					}),
-- 					create("ImageLabel", { 
-- 						AnchorPoint = Vector2.new(1, 0.5), 
-- 						BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 						BackgroundTransparency = 1, 
-- 						Image = "rbxassetid://13048298432", 
-- 						Name = "icon", 
-- 						Position = UDim2.new(1, -7, 0.5, 0), 
-- 						Size = UDim2.new(0, 20, 0, 20)
-- 					}),
-- 					create("TextLabel", { 
-- 						LanguageItem = {
-- 							property = "Text",
-- 							identifier = "FreeLogin"
-- 						},
-- 						AnchorPoint = Vector2.new(0, 0.5), 
-- 						BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 						BackgroundTransparency = 1, 
-- 						FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal), 
-- 						FontSize = Enum.FontSize.Size14, 
-- 						Name = "title", 
-- 						Position = UDim2.new(0, 8, 0.5, 0), 
-- 						Size = UDim2.new(1, -43, 1, 0), 
-- 						TextColor3 = Color3.fromHex("ebebeb"), 
-- 						TextSize = 13, 
-- 						TextXAlignment = Enum.TextXAlignment.Left
-- 					})
-- 				}),
-- 				create("TextButton", { 
-- 					AnchorPoint = Vector2.new(0.5, 1), 
-- 					AutoButtonColor = false, 
-- 					BackgroundColor3 = Color3.fromHex("181818"), 
-- 					FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal), 
-- 					FontSize = Enum.FontSize.Size11, 
-- 					Name = "premium", 
-- 					Position = UDim2.new(0.5, 0, 1, 0), 
-- 					Size = UDim2.new(1, 0, 0, 34), 
-- 					Text = "", 
-- 					TextColor3 = Color3.fromHex("ebebeb"), 
-- 					TextSize = 11,
-- 					Visible = false
-- 				}, {
-- 					create("UICorner", { 
-- 						CornerRadius = UDim.new(0, 4), 
-- 						Name = "corner"
-- 					}),
-- 					create("UIStroke", { 
-- 						ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
-- 						Color = Color3.fromHex("141414"), 
-- 						Name = "stroke", 
-- 						Thickness = 1.2
-- 					}),
-- 					create("ImageLabel", { 
-- 						AnchorPoint = Vector2.new(1, 0.5), 
-- 						BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 						BackgroundTransparency = 1, 
-- 						Image = "rbxassetid://13048298207", 
-- 						Name = "icon", 
-- 						Position = UDim2.new(1, -7, 0.5, 0), 
-- 						Size = UDim2.new(0, 20, 0, 20)
-- 					}),
-- 					create("TextLabel", { 
-- 						LanguageItem = {
-- 							property = "Text",
-- 							identifier = "AdlessLogin"
-- 						},
-- 						AnchorPoint = Vector2.new(0, 0.5), 
-- 						BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 						BackgroundTransparency = 1, 
-- 						FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal), 
-- 						FontSize = Enum.FontSize.Size14, 
-- 						Name = "title", 
-- 						Position = UDim2.new(0, 8, 0.5, 0), 
-- 						Size = UDim2.new(1, -43, 1, 0), 
-- 						TextColor3 = Color3.fromHex("ebebeb"), 
-- 						TextSize = 13, 
-- 						TextXAlignment = Enum.TextXAlignment.Left
-- 					})
-- 				})
-- 			}),
-- 			create("Frame", { 
-- 				BackgroundColor3 = Color3.fromHex("141414"), 
-- 				BorderSizePixel = 0, 
-- 				Name = "separator", 
-- 				Position = UDim2.new(0, 140, 0, 0), 
-- 				Size = UDim2.new(0, 1, 1, 0)
-- 			}),
-- 			create("Frame", { 
-- 				BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 				BackgroundTransparency = 1, 
-- 				Name = "tabs", 
-- 				Size = UDim2.new(1, -140, 1, 0)
-- 			}, {
-- 				create("Frame", { 
-- 					AnchorPoint = Vector2.new(0.5, 0.5), 
-- 					BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 					BackgroundTransparency = 1, 
-- 					Name = "freemium", 
-- 					Position = UDim2.new(0.5, 0, 0.5, 0), 
-- 					Size = UDim2.new(1, 0, 1, 0)
-- 				}, {
-- 					create("TextButton", { 
-- 						LanguageItem = {
-- 							property = "Text",
-- 							identifier = "EnterKey"
-- 						},
-- 						AnchorPoint = Vector2.new(1, 1), 
-- 						AutoButtonColor = false, 
-- 						BackgroundColor3 = Color3.fromHex("181818"), 
-- 						FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal), 
-- 						FontSize = Enum.FontSize.Size11, 
-- 						Name = "enterKey", 
-- 						Position = UDim2.new(1, 0, 1, 0), 
-- 						Size = UDim2.new(0, 90, 0, 34), 
-- 						TextColor3 = Color3.fromHex("ebebeb"), 
-- 						TextSize = 11
-- 					}, {
-- 						create("UICorner", { 
-- 							CornerRadius = UDim.new(0, 4), 
-- 							Name = "corner"
-- 						}),
-- 						create("UIStroke", { 
-- 							ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
-- 							Color = Color3.fromHex("141414"), 
-- 							Name = "stroke", 
-- 							Thickness = 1.2
-- 						})
-- 					}),
-- 					create("TextButton", { 
-- 						LanguageItem = {
-- 							property = "Text",
-- 							identifier = "CopyKeyLink"
-- 						},
-- 						AnchorPoint = Vector2.new(0, 1), 
-- 						AutoButtonColor = false, 
-- 						BackgroundColor3 = Color3.fromHex("181818"), 
-- 						FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal), 
-- 						FontSize = Enum.FontSize.Size11, 
-- 						Name = "getKeyLink", 
-- 						Position = UDim2.new(0, 0, 1, 0), 
-- 						Size = UDim2.new(0, 105, 0, 34), 
-- 						TextColor3 = Color3.fromHex("ebebeb"), 
-- 						TextSize = 11
-- 					}, {
-- 						create("UICorner", { 
-- 							CornerRadius = UDim.new(0, 4), 
-- 							Name = "corner"
-- 						}),
-- 						create("UIStroke", { 
-- 							ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
-- 							Color = Color3.fromHex("141414"), 
-- 							Name = "stroke", 
-- 							Thickness = 1.2
-- 						})
-- 					}),
-- 					create("TextBox", { 
-- 						LanguageItem = {
-- 							property = "PlaceholderText",
-- 							identifier = "Key..."
-- 						},
-- 						AnchorPoint = Vector2.new(0.5, 0), 
-- 						BackgroundColor3 = Color3.fromHex("181818"), 
-- 						FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal), 
-- 						FontSize = Enum.FontSize.Size11, 
-- 						Name = "keyInput", 
-- 						Position = UDim2.new(0.5, 0, 0, 0), 
-- 						Size = UDim2.new(1, 0, 0, 34), 
-- 						Text = "", 
-- 						TextColor3 = Color3.fromHex("ebebeb"), 
-- 						TextSize = 11, 
-- 						TextXAlignment = Enum.TextXAlignment.Left
-- 					}, {
-- 						create("UICorner", { 
-- 							CornerRadius = UDim.new(0, 4), 
-- 							Name = "corner"
-- 						}),
-- 						create("UIPadding", { 
-- 							Name = "padding", 
-- 							PaddingLeft = UDim.new(0, 8), 
-- 							PaddingRight = UDim.new(0, 8)
-- 						}),
-- 						create("UIStroke", { 
-- 							ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
-- 							Color = Color3.fromHex("141414"), 
-- 							Name = "stroke", 
-- 							Thickness = 1.2
-- 						})
-- 					})
-- 				}),
-- 				create("Frame", { 
-- 					AnchorPoint = Vector2.new(0.5, 0.5), 
-- 					BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 					BackgroundTransparency = 1, 
-- 					Name = "premium", 
-- 					Position = UDim2.new(0.5, 0, 0.5, 0), 
-- 					Size = UDim2.new(1, 0, 1, 0), 
-- 					Visible = false
-- 				}, {
-- 					create("TextButton", { 
-- 						LanguageItem = {
-- 							property = "Text",
-- 							identifier = "SubmitCredentials"
-- 						},
-- 						AnchorPoint = Vector2.new(1, 1), 
-- 						AutoButtonColor = false, 
-- 						BackgroundColor3 = Color3.fromHex("181818"), 
-- 						FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal), 
-- 						FontSize = Enum.FontSize.Size11, 
-- 						Name = "enterDetails", 
-- 						Position = UDim2.new(1, 0, 1, 0), 
-- 						Size = UDim2.new(0, 130, 0, 34), 
-- 						TextColor3 = Color3.fromHex("ebebeb"), 
-- 						TextSize = 11
-- 					}, {
-- 						create("UICorner", { 
-- 							CornerRadius = UDim.new(0, 4), 
-- 							Name = "corner"
-- 						}),
-- 						create("UIStroke", { 
-- 							ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
-- 							Color = Color3.fromHex("141414"), 
-- 							Name = "stroke", 
-- 							Thickness = 1.2
-- 						})
-- 					}),
-- 					create("TextBox", { 
-- 						LanguageItem = {
-- 							property = "PlaceholderText",
-- 							identifier = "User..."
-- 						},
-- 						AnchorPoint = Vector2.new(0.5, 0), 
-- 						BackgroundColor3 = Color3.fromHex("181818"), 
-- 						FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal), 
-- 						FontSize = Enum.FontSize.Size11, 
-- 						Name = "userInput", 
-- 						Position = UDim2.new(0.5, 0, 0, 0), 
-- 						Size = UDim2.new(1, 0, 0, 34), 
-- 						Text = uiSettings.userName, 
-- 						TextColor3 = Color3.fromHex("ebebeb"), 
-- 						TextSize = 11, 
-- 						TextXAlignment = Enum.TextXAlignment.Left
-- 					}, {
-- 						create("UICorner", { 
-- 							CornerRadius = UDim.new(0, 4), 
-- 							Name = "corner"
-- 						}),
-- 						create("UIPadding", { 
-- 							Name = "padding", 
-- 							PaddingLeft = UDim.new(0, 8), 
-- 							PaddingRight = UDim.new(0, 8)
-- 						}),
-- 						create("UIStroke", { 
-- 							ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
-- 							Color = Color3.fromHex("141414"), 
-- 							Name = "stroke", 
-- 							Thickness = 1.2
-- 						})
-- 					}),
-- 					create("TextBox", { 
-- 						LanguageItem = {
-- 							property = "PlaceholderText",
-- 							identifier = "Password..."
-- 						},
-- 						AnchorPoint = Vector2.new(0, 1), 
-- 						BackgroundColor3 = Color3.fromHex("181818"), 
-- 						FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal), 
-- 						FontSize = Enum.FontSize.Size11, 
-- 						Name = "passInput", 
-- 						Position = UDim2.new(0, 0, 1, 0), 
-- 						Size = UDim2.new(1, -140, 0, 34), 
-- 						Text = "", 
-- 						TextColor3 = Color3.fromHex("000000"), 
-- 						TextSize = 11, 
-- 						TextXAlignment = Enum.TextXAlignment.Left
-- 					}, {
-- 						create("UICorner", { 
-- 							CornerRadius = UDim.new(0, 4), 
-- 							Name = "corner"
-- 						}),
-- 						create("UIPadding", { 
-- 							Name = "padding", 
-- 							PaddingLeft = UDim.new(0, 8), 
-- 							PaddingRight = UDim.new(0, 8)
-- 						}),
-- 						create("UIStroke", { 
-- 							ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
-- 							Color = Color3.fromHex("141414"), 
-- 							Name = "stroke", 
-- 							Thickness = 1.2
-- 						}),
-- 						create("TextLabel", { 
-- 							BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 							BackgroundTransparency = 1, 
-- 							FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal), 
-- 							FontSize = Enum.FontSize.Size11, 
-- 							Name = "dots", 
-- 							Size = UDim2.new(1, 0, 1, 0), 
-- 							Text = "", 
-- 							TextColor3 = Color3.fromHex("ebebeb"), 
-- 							TextSize = 11, 
-- 							TextXAlignment = Enum.TextXAlignment.Left
-- 						})
-- 					})
-- 				})
-- 			})
-- 		}),
-- 		create("Frame", { 
-- 			AnchorPoint = Vector2.new(1, 0), 
-- 			BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 			Name = "languages", 
-- 			Position = UDim2.new(1, 0, 1, 10), 
-- 			Size = UDim2.new(0, 200, 0, 156), 
-- 			Visible = isFirstTimeExecution
-- 		}, {
-- 			create("UIGradient", { 
-- 				Color = ColorSequence.new({ 
-- 					ColorSequenceKeypoint.new(0, Color3.fromHex("1c1c1c")), 
-- 					ColorSequenceKeypoint.new(1, Color3.fromHex("242424"))
-- 				}), 
-- 				Name = "gradient", 
-- 				Rotation = 78
-- 			}),
-- 			create("UICorner", { 
-- 				CornerRadius = UDim.new(0, 4), 
-- 				Name = "corner"
-- 			}),
-- 			create("ImageLabel", { 
-- 				AnchorPoint = Vector2.new(0.5, 0.5), 
-- 				BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 				BackgroundTransparency = 1, 
-- 				Image = "rbxassetid://12874061329", 
-- 				ImageColor3 = Color3.fromHex("000000"), 
-- 				Name = "blur", 
-- 				Position = UDim2.new(0.5, 0, 0.5, 0), 
-- 				ScaleType = Enum.ScaleType.Slice, 
-- 				Size = UDim2.new(1, 10, 1, 10), 
-- 				SliceCenter = Rect.new(10, 10, 118, 118), 
-- 				ZIndex = 0
-- 			}),
-- 			create("ScrollingFrame", { 
-- 				Active = true, 
-- 				AnchorPoint = Vector2.new(0.5, 0.5), 
-- 				BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 				BackgroundTransparency = 1, 
-- 				BorderSizePixel = 0, 
-- 				BottomImage = "rbxassetid://12651249430", 
-- 				CanvasSize = UDim2.new(),
-- 				MidImage = "rbxassetid://12651249103", 
-- 				Name = "container", 
-- 				Position = UDim2.new(0.5, 0, 0.5, 0), 
-- 				ScrollBarImageColor3 = Color3.fromHex("141414"), 
-- 				ScrollBarThickness = 4, 
-- 				Size = UDim2.new(1, -16, 1, -16), 
-- 				TopImage = "rbxassetid://12651248921"
-- 			}, {
-- 				create("UIListLayout", { 
-- 					Name = "list", 
-- 					Padding = UDim.new(0, 6), 
-- 					SortOrder = Enum.SortOrder.LayoutOrder
-- 				}),
-- 				create("UIPadding", { 
-- 					Name = "padding", 
-- 					PaddingBottom = UDim.new(0, 1), 
-- 					PaddingLeft = UDim.new(0, 1), 
-- 					PaddingRight = UDim.new(0, 1), 
-- 					PaddingTop = UDim.new(0, 1)
-- 				})
-- 			})
-- 		}),
-- 		create("TextButton", { 
-- 			AutoButtonColor = false, 
-- 			BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 			BorderColor3 = Color3.fromHex("1b2a35"), 
-- 			FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal), 
-- 			FontSize = Enum.FontSize.Size14, 
-- 			Name = "toggleLanguages", 
-- 			Position = UDim2.new(1, 10, 0, 0), 
-- 			Size = UDim2.new(0, 34, 0, 34), 
-- 			Text = "", 
-- 			TextColor3 = Color3.fromHex("000000"), 
-- 			TextSize = 14
-- 		}, {
-- 			create("UICorner", { 
-- 				CornerRadius = UDim.new(0, 4), 
-- 				Name = "corner"
-- 			}),
-- 			create("UIGradient", { 
-- 				Color = ColorSequence.new({ 
-- 					ColorSequenceKeypoint.new(0, Color3.fromHex("1c1c1c")), 
-- 					ColorSequenceKeypoint.new(1, Color3.fromHex("242424"))
-- 				}), 
-- 				Name = "gradient", 
-- 				Rotation = 78
-- 			}),
-- 			create("ImageLabel", { 
-- 				AnchorPoint = Vector2.new(0.5, 0.5), 
-- 				BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 				BackgroundTransparency = 1, 
-- 				Image = "rbxassetid://13084553682", 
-- 				Name = "icon", 
-- 				Position = UDim2.new(0.5, 0, 0.5, 0), 
-- 				Size = UDim2.new(1, -14, 1, -14)
-- 			}),
-- 			create("ImageLabel", { 
-- 				AnchorPoint = Vector2.new(0.5, 0.5), 
-- 				BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 				BackgroundTransparency = 1, 
-- 				Image = "rbxassetid://12874061329", 
-- 				ImageColor3 = Color3.fromHex("000000"), 
-- 				Name = "blur", 
-- 				Position = UDim2.new(0.5, 0, 0.5, 0), 
-- 				ScaleType = Enum.ScaleType.Slice, 
-- 				Size = UDim2.new(1, 10, 1, 10), 
-- 				SliceCenter = Rect.new(10, 10, 118, 118), 
-- 				ZIndex = 0
-- 			})
-- 		})
-- 	});

-- 	--[[ Start ]]--

-- 	local content = keyFrame.content;
-- 	local tabs = content.tabs;

-- 	local function validLogin()
-- 		-- Custom Func
-- 		Load_CustomFunctions()
-- 		table.clear(resizeFunctions);
-- 		gui.keyFrame:Destroy();
-- 		callback();
-- 	end

-- 	--[[ Select Tabs ]]--

-- 	do
-- 		local selectedTab = tabs.freemium;
-- 		local buttons = content.buttons;

-- 		local function selectTab(name)
-- 			local btn, tab = buttons[name], tabs[name];
-- 			if selectedTab ~= tab then
-- 				selectedTab.Visible = false;
-- 				--[[tween(buttons[selectedTab.Name], 0.18, {
-- 					BackgroundTransparency = 1;
-- 				});]]
-- 				selectedTab = tab;
-- 				tab.Visible = true;
-- 				--[[tween(btn, 0.18, {
-- 					BackgroundTransparency = 0;
-- 				});]]
-- 			end
-- 		end

-- 		local buttonList = buttons:GetChildren();
-- 		for i = 1, #buttonList do
-- 			local v = buttonList[i];
-- 			local tab = tabs[v.Name];
-- 			v.MouseButton1Click:Connect(function()
-- 				selectTab(v.Name);
-- 			end);
-- 		end

-- 		resizeFunctions[#resizeFunctions + 1] = function()
-- 			local size = math.max(buttons.freemium.title.TextBounds.X, buttons.premium.title.TextBounds.X) + 47;
-- 			buttons.Size = UDim2.new(0, size, 1, 0);
-- 			tabs.Size = UDim2.new(1, -(size + 16), 1, 0);
-- 		end;
-- 	end

-- 	--[[ Freemium ]]--

-- 	do
-- 		local freeFrame = tabs.freemium;

-- 		local getKeyLink = freeFrame.getKeyLink;
-- 		local enterKey = freeFrame.enterKey;

-- 		getKeyLink.MouseButton1Click:Connect(function()
-- 			local PandaAuth = loadstring(game:HttpGet('https://raw.githubusercontent.com/Panda-Repositories/PandaKS_Libraries/main/library/LuaLib/ROBLOX/PandaBetaLib.lua'))()
-- 			local url = PandaAuth:GetKey("evon")
-- 			_setclipboard(url);
-- 			EvonNotification("Successfully Copied Key")
-- 		end);

-- 		enterKey.MouseButton1Click:Connect(function()
-- 			if EvonCheckKey(freeFrame.keyInput.Text) then
-- 				updateSettings("key", freeFrame.keyInput.Text);
-- 				validLogin();
-- 				if freeFrame.keyInput.Text == "skie" then
-- 					updateSettings("key", "");
-- 				end
-- 			else
-- 				EvonNotification("Invalid Key")
-- 			end
-- 		end);

-- 		resizeFunctions[#resizeFunctions + 1] = function()
-- 			getKeyLink.Size = UDim2.new(0, getKeyLink.TextBounds.X + 30, 0, 34);
-- 			enterKey.Size = UDim2.new(0, enterKey.TextBounds.X + 30, 0, 34);
-- 		end;
-- 	end

-- 	--[[ Adless ]]--

-- 	--[[do
-- 		local paidFrame = tabs.premium;

-- 		local userInput = paidFrame.userInput;
-- 		local passInput = paidFrame.passInput;
-- 		local enterDetails = paidFrame.enterDetails;

-- 		passInput:GetPropertyChangedSignal("Text"):Connect(function()
-- 			local inputLength = #passInput.Text
-- 			passInput.dots.Text = string.rep("•", inputLength);
-- 			passInput.TextTransparency = inputLength == 0 and 0 or 1;
-- 		end);

-- 		enterDetails.MouseButton1Click:Connect(function()
-- 			if CHECK_WHITELIST_FUNCTION_HERE(userInput.Text, passInput.Text) then
-- 				updateSettings("userName", userInput.Text);
-- 				validLogin();
-- 			end
-- 		end);

-- 		resizeFunctions[#resizeFunctions + 1] = function()
-- 			enterDetails.Size = UDim2.new(0, enterDetails.TextBounds.X + 30, 0, 34);
-- 			passInput.Size = UDim2.new(1, -(enterDetails.TextBounds.X + 40), 0, 34);
-- 		end;
-- 	end]]

-- 	--[[ Languages ]]--

-- 	do
-- 		do
-- 			local isOpen = isFirstTimeExecution;

-- 			keyFrame.toggleLanguages.MouseButton1Click:Connect(function()
-- 				isOpen = not isOpen;
-- 				keyFrame.languages.Visible = isOpen;
-- 			end);
-- 		end

-- 		local template = create("TextButton", { 
-- 			AutoButtonColor = false,
-- 			BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 			BackgroundTransparency = 1, 
-- 			Text = "",
-- 			Name = "languageExample", 
-- 			Size = UDim2.new(1, 0, 0, 30)
-- 		}, {
-- 			create("Frame", { 
-- 				BackgroundColor3 = Color3.fromHex("181818"), 
-- 				Name = "flagContainer", 
-- 				Size = UDim2.new(0, 40, 0, 30)
-- 			}, {
-- 				create("UIStroke", { 
-- 					ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
-- 					Color = Color3.fromHex("141414"), 
-- 					Name = "stroke", 
-- 					Thickness = 1.2
-- 				}),
-- 				create("UICorner", { 
-- 					CornerRadius = UDim.new(0, 4), 
-- 					Name = "corner"
-- 				}),
-- 				create("ImageLabel", { 
-- 					AnchorPoint = Vector2.new(0.5, 0.5), 
-- 					BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 					BackgroundTransparency = 1, 
-- 					Image = "", 
-- 					Name = "icon", 
-- 					Position = UDim2.new(0.5, 0, 0.5, 0), 
-- 					Size = UDim2.new(1, -8, 1, -6)
-- 				})
-- 			}),
-- 			create("TextLabel", { 
-- 				AnchorPoint = Vector2.new(1, 0.5), 
-- 				BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 				BackgroundTransparency = 1, 
-- 				FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal), 
-- 				FontSize = Enum.FontSize.Size11, 
-- 				Name = "title", 
-- 				Position = UDim2.new(1, 0, 0.5, 0), 
-- 				Size = UDim2.new(1, -50, 1, 0), 
-- 				Text = "", 
-- 				TextColor3 = Color3.fromHex("ebebeb"), 
-- 				TextSize = 11, 
-- 				TextXAlignment = Enum.TextXAlignment.Left
-- 			})
-- 		});

-- 		local languages = keyFrame.languages;

-- 		local container = languages.container;

-- 		container.list:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
-- 			container.CanvasSize = UDim2.new(0, 0, 0, container.list.AbsoluteContentSize.Y + 2);			
-- 		end);

-- 		for i, v in next, sortedLanguageDatabase do
-- 			local clone = template:Clone();
-- 			clone.Name = v.key;
-- 			clone.title.Text = v.value.indicator;
-- 			clone.flagContainer.icon.Image = v.value.flag;

-- 			clone.MouseButton1Click:Connect(function()
-- 				updateSettings("language", v.key);
-- 			end);

-- 			clone.Parent = container;
-- 		end
-- 	end

-- 	changeLanguage(uiSettings.language);

-- 	if EvonCheckKey(uiSettings.key) then
-- 		validLogin();
-- 	else
-- 		EvonNotification("Saved Key is no longer valid")
-- 	end
-- end

-- local function loadMainUI()
-- 	local toggleMain = create("TextButton", { 
-- 		AnchorPoint = Vector2.new(0.5, 0.5), 
-- 		AutoButtonColor = false, 
-- 		BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 		FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal), 
-- 		FontSize = Enum.FontSize.Size14, 
-- 		Name = "toggleMain", 
-- 		Parent = gui, 
-- 		Position = UDim2.new(1, -25, 0.5, 0), 
-- 		Size = UDim2.new(0, 40, 0, 40), 
-- 		Text = "", 
-- 		TextColor3 = Color3.fromHex("000000"), 
-- 		TextSize = 14, 
-- 		ZIndex = 99
-- 	}, {
-- 		create("UICorner", { 
-- 			CornerRadius = UDim.new(0, 4), 
-- 			Name = "corner"
-- 		}),
-- 		create("UIGradient", { 
-- 			Color = ColorSequence.new({ 
-- 				ColorSequenceKeypoint.new(0, Color3.fromHex("1c1c1c")), 
-- 				ColorSequenceKeypoint.new(1, Color3.fromHex("242424"))
-- 			}), 
-- 			Name = "gradient", 
-- 			Rotation = 78
-- 		}),
-- 		create("ImageLabel", { 
-- 			AnchorPoint = Vector2.new(0.5, 0.5), 
-- 			BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 			BackgroundTransparency = 1, 
-- 			Image = "rbxassetid://15984664361", 
-- 			ImageColor3 = Color3.fromRGB(151, 0, 255),
-- 			Name = "icon", 
-- 			Position = UDim2.new(0.5, 0, 0.5, 0), 
-- 			Size = UDim2.new(1, -6, 1, -6), 
-- 			ZIndex = 99
-- 		})
-- 	});

-- 	local main = create("Frame", { 
-- 		AnchorPoint = Vector2.new(0.5, 0.5), 
-- 		BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 		BorderSizePixel = 0, 
-- 		Name = "main", 
-- 		Parent = gui, 
-- 		Position = UDim2.new(0.5, 0, 0.5, 0), 
-- 		Size = UDim2.new(1, -110, 1, -80),
-- 		Visible = false
-- 	}, {
-- 		create("UIGradient", { 
-- 			Color = ColorSequence.new({ 
-- 				ColorSequenceKeypoint.new(0, Color3.fromHex("1c1c1c")), 
-- 				ColorSequenceKeypoint.new(1, Color3.fromHex("242424"))
-- 			}), 
-- 			Name = "gradient", 
-- 			Rotation = 78
-- 		}),
-- 		create("Frame", { 
-- 			BackgroundColor3 = Color3.fromHex("181818"), 
-- 			BorderSizePixel = 0, 
-- 			Name = "left", 
-- 			Size = UDim2.new(0, 38, 1, 0)
-- 		}, {
-- 			create("UICorner", { 
-- 				CornerRadius = UDim.new(0, 4), 
-- 				Name = "corner"
-- 			}),
-- 			create("ImageLabel", { 
-- 				AnchorPoint = Vector2.new(0.5, 0), 
-- 				BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 				BackgroundTransparency = 1, 
-- 				Image = "rbxassetid://15984664361", 
-- 				ImageColor3 = Color3.fromRGB(151, 0, 255),
-- 				Name = "icon", 
-- 				Position = UDim2.new(0.5, 0, 0, 8), 
-- 				Size = UDim2.new(0, 28, 0, 28)
-- 			}),
-- 			create("Frame", { 
-- 				AnchorPoint = Vector2.new(0.5, 1), 
-- 				BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 				BackgroundTransparency = 1, 
-- 				Name = "buttons", 
-- 				Position = UDim2.new(0.5, 0, 1, 0), 
-- 				Size = UDim2.new(1, -8, 1, -44)
-- 			}, {
-- 				create("UIListLayout", { 
-- 					Name = "list", 
-- 					Padding = UDim.new(0, 4), 
-- 					SortOrder = Enum.SortOrder.LayoutOrder
-- 				}),
-- 				create("TextButton", { 
-- 					AnchorPoint = Vector2.new(0.5, 0.5), 
-- 					AutoButtonColor = false, 
-- 					BackgroundColor3 = Color3.fromHex("303030"), 
-- 					FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal), 
-- 					FontSize = Enum.FontSize.Size14, 
-- 					Name = "editor", 
-- 					Position = UDim2.new(0.5, 0, 0.5, 0), 
-- 					Size = UDim2.new(0, 30, 0, 30), 
-- 					Text = "", 
-- 					TextColor3 = Color3.fromHex("000000"), 
-- 					TextSize = 14
-- 				}, {
-- 					create("ImageLabel", { 
-- 						AnchorPoint = Vector2.new(0.5, 0.5), 
-- 						BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 						BackgroundTransparency = 1, 
-- 						Image = "rbxassetid://12874034829", 
-- 						Name = "icon", 
-- 						Position = UDim2.new(0.5, 0, 0.5, 0), 
-- 						Size = UDim2.new(1, -10, 1, -10)
-- 					}),
-- 					create("UICorner", { 
-- 						CornerRadius = UDim.new(0, 4), 
-- 						Name = "corner"
-- 					})
-- 				}),
-- 				create("TextButton", { 
-- 					AnchorPoint = Vector2.new(0.5, 0.5), 
-- 					AutoButtonColor = false, 
-- 					BackgroundColor3 = Color3.fromHex("303030"), 
-- 					BackgroundTransparency = 1, 
-- 					FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal), 
-- 					FontSize = Enum.FontSize.Size14, 
-- 					Name = "games", 
-- 					Position = UDim2.new(0.5, 0, 0.5, 0), 
-- 					Size = UDim2.new(0, 30, 0, 30), 
-- 					Text = "", 
-- 					TextColor3 = Color3.fromHex("000000"), 
-- 					TextSize = 14
-- 				}, {
-- 					create("ImageLabel", { 
-- 						AnchorPoint = Vector2.new(0.5, 0.5), 
-- 						BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 						BackgroundTransparency = 1, 
-- 						Image = "rbxassetid://12874034639", 
-- 						Name = "icon", 
-- 						Position = UDim2.new(0.5, 0, 0.5, 0), 
-- 						Size = UDim2.new(1, -10, 1, -10)
-- 					}),
-- 					create("UICorner", { 
-- 						CornerRadius = UDim.new(0, 4), 
-- 						Name = "corner"
-- 					})
-- 				}),
-- 				create("TextButton", { 
-- 					AnchorPoint = Vector2.new(0.5, 0.5), 
-- 					AutoButtonColor = false, 
-- 					BackgroundColor3 = Color3.fromHex("303030"), 
-- 					BackgroundTransparency = 1, 
-- 					FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal), 
-- 					FontSize = Enum.FontSize.Size14, 
-- 					Name = "console", 
-- 					Position = UDim2.new(0.5, 0, 0.5, 0), 
-- 					Size = UDim2.new(0, 30, 0, 30), 
-- 					Text = "", 
-- 					TextColor3 = Color3.fromHex("000000"), 
-- 					TextSize = 14
-- 				}, {
-- 					create("ImageLabel", { 
-- 						AnchorPoint = Vector2.new(0.5, 0.5), 
-- 						BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 						BackgroundTransparency = 1, 
-- 						Image = "rbxassetid://12874035024", 
-- 						Name = "icon", 
-- 						Position = UDim2.new(0.5, 0, 0.5, 0), 
-- 						Size = UDim2.new(1, -10, 1, -10)
-- 					}),
-- 					create("UICorner", { 
-- 						CornerRadius = UDim.new(0, 4), 
-- 						Name = "corner"
-- 					})
-- 				}),
-- 				create("TextButton", { 
-- 					AnchorPoint = Vector2.new(0.5, 0.5), 
-- 					AutoButtonColor = false, 
-- 					BackgroundColor3 = Color3.fromHex("303030"), 
-- 					BackgroundTransparency = 1, 
-- 					FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal), 
-- 					FontSize = Enum.FontSize.Size14, 
-- 					Name = "settings", 
-- 					Position = UDim2.new(0.5, 0, 0.5, 0), 
-- 					Size = UDim2.new(0, 30, 0, 30), 
-- 					Text = "", 
-- 					TextColor3 = Color3.fromHex("000000"), 
-- 					TextSize = 14
-- 				}, {
-- 					create("ImageLabel", { 
-- 						AnchorPoint = Vector2.new(0.5, 0.5), 
-- 						BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 						BackgroundTransparency = 1, 
-- 						Image = "rbxassetid://12874034503", 
-- 						Name = "icon", 
-- 						Position = UDim2.new(0.5, 0, 0.5, 0), 
-- 						Size = UDim2.new(1, -10, 1, -10)
-- 					}),
-- 					create("UICorner", { 
-- 						CornerRadius = UDim.new(0, 4), 
-- 						Name = "corner"
-- 					})
-- 				})
-- 			}),
-- 			create("Frame", { 
-- 				AnchorPoint = Vector2.new(1, 0), 
-- 				BackgroundColor3 = Color3.fromHex("181818"), 
-- 				BorderSizePixel = 0, 
-- 				Name = "topRightCover", 
-- 				Position = UDim2.new(1, 0, 0, 0), 
-- 				Size = UDim2.new(0, 4, 0, 4)
-- 			}),
-- 			create("Frame", { 
-- 				AnchorPoint = Vector2.new(1, 1), 
-- 				BackgroundColor3 = Color3.fromHex("181818"), 
-- 				BorderSizePixel = 0, 
-- 				Name = "bottomRightCover", 
-- 				Position = UDim2.new(1, 0, 1, 0), 
-- 				Size = UDim2.new(0, 4, 0, 4)
-- 			})
-- 		}),
-- 		create("UICorner", { 
-- 			CornerRadius = UDim.new(0, 4), 
-- 			Name = "corner"
-- 		}),
-- 		create("TextButton", { 
-- 			AutoButtonColor = false, 
-- 			BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 			BackgroundTransparency = 1, 
-- 			FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal), 
-- 			FontSize = Enum.FontSize.Size14, 
-- 			Name = "clickThroughBlocker", 
-- 			Size = UDim2.new(1, 0, 1, 0), 
-- 			Text = "", 
-- 			TextColor3 = Color3.fromHex("000000"), 
-- 			TextSize = 14, 
-- 			ZIndex = 0
-- 		}),
-- 		create("Folder", { 
-- 			Name = "tabs"
-- 		}, {
-- 			create("Frame", { 
-- 				AnchorPoint = Vector2.new(1, 0.5), 
-- 				BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 				BackgroundTransparency = 1, 
-- 				Name = "editor", 
-- 				Position = UDim2.new(1, 0, 0.5, 0), 
-- 				Size = UDim2.new(1, -38, 1, 0)
-- 			}, {
-- 				create("UIListLayout", {
-- 					Name = "list", 
-- 					FillDirection = Enum.FillDirection.Horizontal, 
-- 					Padding = UDim.new(0, 8), 
-- 					SortOrder = Enum.SortOrder.LayoutOrder
-- 				}),
-- 				create("UIPadding", {
-- 					Name = "padding",
-- 					PaddingBottom = UDim.new(0, 8), 
-- 					PaddingLeft = UDim.new(0, 8), 
-- 					PaddingRight = UDim.new(0, 8), 
-- 					PaddingTop = UDim.new(0, 8)
-- 				}),
-- 				create("Frame", { 
-- 					AnchorPoint = Vector2.new(0, 0.5), 
-- 					BackgroundColor3 = Color3.fromHex("181818"), 
-- 					Name = "main", 
-- 					Position = UDim2.new(0, 8, 0.5, 0), 
-- 					Size = UDim2.new(1, -118, 1, 0)
-- 				}, {
-- 					create("UICorner", { 
-- 						CornerRadius = UDim.new(0, 4), 
-- 						Name = "corner"
-- 					}),
-- 					create("UIListLayout", { 
-- 						FillDirection = Enum.FillDirection.Horizontal, 
-- 						Name = "list", 
-- 						Padding = UDim.new(0, 4), 
-- 						SortOrder = Enum.SortOrder.LayoutOrder
-- 					}),
-- 					create("ScrollingFrame", { 
-- 						Active = true, 
-- 						AnchorPoint = Vector2.new(0.5, 0.5), 
-- 						BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 						BackgroundTransparency = 1, 
-- 						BorderSizePixel = 0, 
-- 						BottomImage = "rbxassetid://12651249430", 
-- 						CanvasSize = UDim2.new(0, 6, 1, 0), 
-- 						MidImage = "rbxassetid://12651249103", 
-- 						Name = "lineNumbers", 
-- 						Position = UDim2.new(0.5, 0, 0.5, 0), 
-- 						ScrollBarImageColor3 = Color3.fromHex("484848"), 
-- 						ScrollBarThickness = 0, 
-- 						ScrollingDirection = Enum.ScrollingDirection.Y, 
-- 						ScrollingEnabled = false, 
-- 						Size = UDim2.new(0, 6, 1, 0), 
-- 						TopImage = "rbxassetid://12651248921"
-- 					}, {
-- 						create("TextLabel", { 
-- 							BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 							BackgroundTransparency = 1, 
-- 							FontFace = Font.new("rbxasset://fonts/families/Ubuntu.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal), 
-- 							FontSize = Enum.FontSize.Size11, 
-- 							Name = "label", 
-- 							Size = UDim2.new(1, 0, 1, 0), 
-- 							Text = "1", 
-- 							TextColor3 = Color3.fromHex("d2d2d2"), 
-- 							TextSize = 11, 
-- 							TextXAlignment = Enum.TextXAlignment.Right, 
-- 							TextYAlignment = Enum.TextYAlignment.Top
-- 						})
-- 					}),
-- 					create("UIPadding", { 
-- 						Name = "padding", 
-- 						PaddingBottom = UDim.new(0, 8), 
-- 						PaddingLeft = UDim.new(0, 8), 
-- 						PaddingRight = UDim.new(0, 8), 
-- 						PaddingTop = UDim.new(0, 8)
-- 					}),
-- 					create("Frame", { 
-- 						BackgroundColor3 = Color3.fromHex("b2b2b2"), 
-- 						BorderSizePixel = 0, 
-- 						Name = "separator", 
-- 						Size = UDim2.new(0, 1, 1, 0)
-- 					}),
-- 					create("ScrollingFrame", { 
-- 						Active = true, 
-- 						AnchorPoint = Vector2.new(0.5, 0.5), 
-- 						BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 						BackgroundTransparency = 1, 
-- 						BorderSizePixel = 0, 
-- 						BottomImage = "rbxassetid://12651249430", 
-- 						CanvasSize = UDim2.new(1, -15, 1, 0), 
-- 						MidImage = "rbxassetid://12651249103", 
-- 						Name = "container", 
-- 						Position = UDim2.new(0.5, 0, 0.5, 0), 
-- 						ScrollBarImageColor3 = Color3.fromHex("484848"), 
-- 						ScrollBarThickness = 4, 
-- 						Size = UDim2.new(1, -15, 1, 0), 
-- 						TopImage = "rbxassetid://12651248921"
-- 					}, {
-- 						create("TextBox", { 
-- 							BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 							BackgroundTransparency = 1, 
-- 							ClearTextOnFocus = false, 
-- 							FontFace = Font.new("rbxasset://fonts/families/Ubuntu.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal), 
-- 							FontSize = Enum.FontSize.Size11, 
-- 							MultiLine = true, 
-- 							Name = "content", 
-- 							Size = UDim2.new(1, 0, 1, 0), 
-- 							Text = uiSettings.editorInit, 
-- 							TextColor3 = Color3.fromHex("b2b2b2"), 
-- 							TextSize = 11, 
-- 							TextTruncate = Enum.TextTruncate.AtEnd, 
-- 							TextWrap = true, 
-- 							TextWrapped = true, 
-- 							TextXAlignment = Enum.TextXAlignment.Left, 
-- 							TextYAlignment = Enum.TextYAlignment.Top
-- 						})
-- 					}),
-- 					create("UIStroke", { 
-- 						ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
-- 						Color = Color3.fromHex("141414"), 
-- 						Name = "stroke", 
-- 						Thickness = 1.2
-- 					})
-- 				}),
-- 				create("Frame", { 
-- 					BackgroundColor3 = Color3.fromHex("181818"), 
-- 					BorderSizePixel = 0, 
-- 					Name = "right", 
-- 					Size = UDim2.new(0, 110, 1, 0)
-- 				}, {
-- 					create("UICorner", { 
-- 						CornerRadius = UDim.new(0, 4), 
-- 						Name = "corner"
-- 					}),
-- 					create("Frame", { 
-- 						AnchorPoint = Vector2.new(0.5, 0.5), 
-- 						BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 						BackgroundTransparency = 1, 
-- 						Name = "buttons", 
-- 						Position = UDim2.new(0.5, 0, 0.5, 0), 
-- 						Size = UDim2.new(1, -8, 1, -8)
-- 					}, {
-- 						create("UIListLayout", { 
-- 							Name = "list", 
-- 							Padding = UDim.new(0, 4), 
-- 							SortOrder = Enum.SortOrder.LayoutOrder
-- 						}),
-- 						create("TextLabel", { 
-- 							LanguageItem = {
-- 								property = "Text",
-- 								identifier = "Editor"
-- 							},
-- 							BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 							BackgroundTransparency = 1, 
-- 							FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal), 
-- 							FontSize = Enum.FontSize.Size12, 
-- 							Name = "boxLabel", 
-- 							Size = UDim2.new(1, 0, 0, 16), 
-- 							TextColor3 = Color3.fromHex("bebebe"), 
-- 							TextSize = 12, 
-- 							TextXAlignment = Enum.TextXAlignment.Left, 
-- 							TextYAlignment = Enum.TextYAlignment.Bottom
-- 						}),
-- 						create("TextButton", { 
-- 							AnchorPoint = Vector2.new(0.5, 0.5), 
-- 							AutoButtonColor = false, 
-- 							BackgroundColor3 = Color3.fromHex("303030"), 
-- 							BackgroundTransparency = 1, 
-- 							FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal), 
-- 							FontSize = Enum.FontSize.Size14, 
-- 							Name = "executeBox", 
-- 							Position = UDim2.new(0.5, 0, 0.5, 0), 
-- 							Size = UDim2.new(1, 0, 0, 22), 
-- 							Text = "", 
-- 							TextColor3 = Color3.fromHex("000000"), 
-- 							TextSize = 14
-- 						}, {
-- 							create("ImageLabel", { 
-- 								AnchorPoint = Vector2.new(1, 0.5), 
-- 								BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 								BackgroundTransparency = 1, 
-- 								Image = "rbxassetid://12778482262", 
-- 								Name = "icon", 
-- 								Position = UDim2.new(1, -6, 0.5, 0), 
-- 								Size = UDim2.new(0, 14, 0, 14)
-- 							}),
-- 							create("UICorner", { 
-- 								CornerRadius = UDim.new(0, 4), 
-- 								Name = "corner"
-- 							}),
-- 							create("TextLabel", { 
-- 								LanguageItem = {
-- 									property = "Text",
-- 									identifier = "Execute"
-- 								},
-- 								AnchorPoint = Vector2.new(0, 0.5), 
-- 								BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 								BackgroundTransparency = 1, 
-- 								FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal), 
-- 								FontSize = Enum.FontSize.Size11, 
-- 								Name = "title", 
-- 								Position = UDim2.new(0, 6, 0.5, 0), 
-- 								Size = UDim2.new(1, -30, 1, 0), 
-- 								TextColor3 = Color3.fromHex("ebebeb"), 
-- 								TextSize = 11, 
-- 								TextXAlignment = Enum.TextXAlignment.Left
-- 							})
-- 						}),
-- 						create("TextButton", { 
-- 							AnchorPoint = Vector2.new(0.5, 0.5), 
-- 							AutoButtonColor = false, 
-- 							BackgroundColor3 = Color3.fromHex("303030"), 
-- 							BackgroundTransparency = 1, 
-- 							FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal), 
-- 							FontSize = Enum.FontSize.Size14, 
-- 							Name = "clearBox", 
-- 							Position = UDim2.new(0.5, 0, 0.5, 0), 
-- 							Size = UDim2.new(1, 0, 0, 22), 
-- 							Text = "", 
-- 							TextColor3 = Color3.fromHex("000000"), 
-- 							TextSize = 14
-- 						}, {
-- 							create("ImageLabel", { 
-- 								AnchorPoint = Vector2.new(1, 0.5), 
-- 								BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 								BackgroundTransparency = 1, 
-- 								Image = "rbxassetid://12778483354", 
-- 								Name = "icon", 
-- 								Position = UDim2.new(1, -6, 0.5, 0), 
-- 								Size = UDim2.new(0, 14, 0, 14)
-- 							}),
-- 							create("UICorner", { 
-- 								CornerRadius = UDim.new(0, 4), 
-- 								Name = "corner"
-- 							}),
-- 							create("TextLabel", { 
-- 								LanguageItem = {
-- 									property = "Text",
-- 									identifier = "Clear"
-- 								},
-- 								AnchorPoint = Vector2.new(0, 0.5), 
-- 								BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 								BackgroundTransparency = 1, 
-- 								FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal), 
-- 								FontSize = Enum.FontSize.Size11, 
-- 								Name = "title", 
-- 								Position = UDim2.new(0, 6, 0.5, 0), 
-- 								Size = UDim2.new(1, -30, 1, 0), 
-- 								TextColor3 = Color3.fromHex("ebebeb"), 
-- 								TextSize = 11, 
-- 								TextXAlignment = Enum.TextXAlignment.Left
-- 							})
-- 						}),
-- 						create("Frame", { 
-- 							BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 							BackgroundTransparency = 1, 
-- 							Name = "separator", 
-- 							Size = UDim2.new(1, 0, 0, 1)
-- 						}, {
-- 							create("Frame", { 
-- 								AnchorPoint = Vector2.new(0.5, 0.5), 
-- 								BackgroundColor3 = Color3.fromHex("363636"), 
-- 								BorderSizePixel = 0, 
-- 								Name = "bar", 
-- 								Position = UDim2.new(0.5, 0, 0.5, 0), 
-- 								Size = UDim2.new(1, -8, 1, 0)
-- 							}, {
-- 								create("UIGradient", { 
-- 									Name = "gradient", 
-- 									Transparency = NumberSequence.new({ 
-- 										NumberSequenceKeypoint.new(0, 1), 
-- 										NumberSequenceKeypoint.new(0.1, 0.28), 
-- 										NumberSequenceKeypoint.new(0.28, 0), 
-- 										NumberSequenceKeypoint.new(0.72, 0), 
-- 										NumberSequenceKeypoint.new(0.9, 0.28), 
-- 										NumberSequenceKeypoint.new(1, 1)
-- 									})
-- 								})
-- 							})
-- 						}),
-- 						create("TextLabel", { 
-- 							LanguageItem = {
-- 								property = "Text",
-- 								identifier = "Clipboard"
-- 							},
-- 							BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 							BackgroundTransparency = 1, 
-- 							FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal), 
-- 							FontSize = Enum.FontSize.Size12, 
-- 							Name = "clipboardLabel", 
-- 							Size = UDim2.new(1, 0, 0, 16), 
-- 							TextColor3 = Color3.fromHex("bebebe"), 
-- 							TextSize = 12, 
-- 							TextXAlignment = Enum.TextXAlignment.Left, 
-- 							TextYAlignment = Enum.TextYAlignment.Bottom
-- 						}),
-- 						create("TextButton", { 
-- 							AnchorPoint = Vector2.new(0.5, 0.5), 
-- 							AutoButtonColor = false, 
-- 							BackgroundColor3 = Color3.fromHex("303030"), 
-- 							BackgroundTransparency = 1, 
-- 							FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal), 
-- 							FontSize = Enum.FontSize.Size14, 
-- 							Name = "executeClip", 
-- 							Position = UDim2.new(0.5, 0, 0.5, 0), 
-- 							Size = UDim2.new(1, 0, 0, 22), 
-- 							Text = "", 
-- 							TextColor3 = Color3.fromHex("000000"), 
-- 							TextSize = 14
-- 						}, {
-- 							create("ImageLabel", { 
-- 								AnchorPoint = Vector2.new(1, 0.5), 
-- 								BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 								BackgroundTransparency = 1, 
-- 								Image = "rbxassetid://12778483177", 
-- 								Name = "icon", 
-- 								Position = UDim2.new(1, -6, 0.5, 0), 
-- 								Size = UDim2.new(0, 14, 0, 14)
-- 							}),
-- 							create("UICorner", { 
-- 								CornerRadius = UDim.new(0, 4), 
-- 								Name = "corner"
-- 							}),
-- 							create("TextLabel", { 
-- 								LanguageItem = {
-- 									property = "Text",
-- 									identifier = "Execute"
-- 								},
-- 								AnchorPoint = Vector2.new(0, 0.5), 
-- 								BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 								BackgroundTransparency = 1, 
-- 								FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal), 
-- 								FontSize = Enum.FontSize.Size11, 
-- 								Name = "title", 
-- 								Position = UDim2.new(0, 6, 0.5, 0), 
-- 								Size = UDim2.new(1, -30, 1, 0), 
-- 								TextColor3 = Color3.fromHex("ebebeb"), 
-- 								TextSize = 11, 
-- 								TextXAlignment = Enum.TextXAlignment.Left
-- 							})
-- 						}),
-- 						create("TextButton", { 
-- 							AnchorPoint = Vector2.new(0.5, 0.5), 
-- 							AutoButtonColor = false, 
-- 							BackgroundColor3 = Color3.fromHex("303030"), 
-- 							BackgroundTransparency = 1, 
-- 							FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal), 
-- 							FontSize = Enum.FontSize.Size14, 
-- 							Name = "copyClip", 
-- 							Position = UDim2.new(0.5, 0, 0.5, 0), 
-- 							Size = UDim2.new(1, 0, 0, 22), 
-- 							Text = "", 
-- 							TextColor3 = Color3.fromHex("000000"), 
-- 							TextSize = 14
-- 						}, {
-- 							create("ImageLabel", { 
-- 								AnchorPoint = Vector2.new(1, 0.5), 
-- 								BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 								BackgroundTransparency = 1, 
-- 								Image = "rbxassetid://12778483077", 
-- 								Name = "icon", 
-- 								Position = UDim2.new(1, -6, 0.5, 0), 
-- 								Size = UDim2.new(0, 14, 0, 14)
-- 							}),
-- 							create("UICorner", { 
-- 								CornerRadius = UDim.new(0, 4), 
-- 								Name = "corner"
-- 							}),
-- 							create("TextLabel", { 
-- 								LanguageItem = {
-- 									property = "Text",
-- 									identifier = "CopyScript"
-- 								},
-- 								AnchorPoint = Vector2.new(0, 0.5), 
-- 								BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 								BackgroundTransparency = 1, 
-- 								FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal), 
-- 								FontSize = Enum.FontSize.Size11, 
-- 								Name = "title", 
-- 								Position = UDim2.new(0, 6, 0.5, 0), 
-- 								Size = UDim2.new(1, -30, 1, 0), 
-- 								TextColor3 = Color3.fromHex("ebebeb"), 
-- 								TextSize = 11, 
-- 								TextXAlignment = Enum.TextXAlignment.Left
-- 							})
-- 						}),
-- 						create("TextButton", { 
-- 							AnchorPoint = Vector2.new(0.5, 0.5), 
-- 							AutoButtonColor = false, 
-- 							BackgroundColor3 = Color3.fromHex("303030"), 
-- 							BackgroundTransparency = 1, 
-- 							FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal), 
-- 							FontSize = Enum.FontSize.Size14, 
-- 							Name = "loadClip", 
-- 							Position = UDim2.new(0.5, 0, 0.5, 0), 
-- 							Size = UDim2.new(1, 0, 0, 22), 
-- 							Text = "", 
-- 							TextColor3 = Color3.fromHex("000000"), 
-- 							TextSize = 14
-- 						}, {
-- 							create("ImageLabel", { 
-- 								AnchorPoint = Vector2.new(1, 0.5), 
-- 								BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 								BackgroundTransparency = 1, 
-- 								Image = "rbxassetid://12778482928", 
-- 								Name = "icon", 
-- 								Position = UDim2.new(1, -6, 0.5, 0), 
-- 								Size = UDim2.new(0, 14, 0, 14)
-- 							}),
-- 							create("UICorner", { 
-- 								CornerRadius = UDim.new(0, 4), 
-- 								Name = "corner"
-- 							}),
-- 							create("TextLabel", { 
-- 								LanguageItem = {
-- 									property = "Text",
-- 									identifier = "LoadScript"
-- 								},
-- 								AnchorPoint = Vector2.new(0, 0.5), 
-- 								BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 								BackgroundTransparency = 1, 
-- 								FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal), 
-- 								FontSize = Enum.FontSize.Size11, 
-- 								Name = "title", 
-- 								Position = UDim2.new(0, 6, 0.5, 0), 
-- 								Size = UDim2.new(1, -30, 1, 0), 
-- 								TextColor3 = Color3.fromHex("ebebeb"), 
-- 								TextSize = 11, 
-- 								TextXAlignment = Enum.TextXAlignment.Left
-- 							})
-- 						})
-- 					}),
-- 					create("UIStroke", { 
-- 						ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
-- 						Color = Color3.fromHex("141414"), 
-- 						Name = "stroke", 
-- 						Thickness = 1.2
-- 					})
-- 				})
-- 			}),
-- 			create("Frame", { 
-- 				AnchorPoint = Vector2.new(1, 0.5), 
-- 				BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 				BackgroundTransparency = 1, 
-- 				Name = "games", 
-- 				Position = UDim2.new(1, 0, 0.5, 0), 
-- 				Size = UDim2.new(1, -38, 1, 0), 
-- 				Visible = false
-- 			}, {
-- 				create("TextBox", { 
-- 					LanguageItem = {
-- 						property = "PlaceholderText",
-- 						identifier = "Search..."
-- 					},
-- 					BackgroundColor3 = Color3.fromHex("181818"), 
-- 					FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal), 
-- 					FontSize = Enum.FontSize.Size11, 
-- 					Name = "searchInput", 
-- 					Position = UDim2.new(0, 8, 0, 8), 
-- 					Size = UDim2.new(1, -90, 0, 30), 
-- 					Text = "", 
-- 					TextColor3 = Color3.fromHex("ebebeb"), 
-- 					TextSize = 11, 
-- 					TextXAlignment = Enum.TextXAlignment.Left
-- 				}, {
-- 					create("UICorner", { 
-- 						CornerRadius = UDim.new(0, 4), 
-- 						Name = "corner"
-- 					}),
-- 					create("UIPadding", { 
-- 						Name = "padding", 
-- 						PaddingLeft = UDim.new(0, 8), 
-- 						PaddingRight = UDim.new(0, 8)
-- 					}),
-- 					create("UIStroke", { 
-- 						ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
-- 						Color = Color3.fromHex("141414"), 
-- 						Name = "stroke", 
-- 						Thickness = 1.2
-- 					})
-- 				}),
-- 				create("ScrollingFrame", { 
-- 					Active = true, 
-- 					AnchorPoint = Vector2.new(0.5, 1), 
-- 					BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 					BackgroundTransparency = 1, 
-- 					BorderSizePixel = 0, 
-- 					CanvasSize = UDim2.new(0, 0, 0, 0), 
-- 					Name = "container", 
-- 					Position = UDim2.new(0.5, 0, 1, -7), 
-- 					ScrollBarImageColor3 = Color3.fromHex("000000"), 
-- 					ScrollBarThickness = 0, 
-- 					Size = UDim2.new(1, -14, 1, -52)
-- 				}, {
-- 					create("UIGridLayout", { 
-- 						CellPadding = UDim2.new(0, 8, 0, 6), 
-- 						CellSize = UDim2.new(0, 0, 0, 0), 
-- 						Name = "grid", 
-- 						SortOrder = Enum.SortOrder.LayoutOrder
-- 					}),
-- 					create("UIPadding", { 
-- 						Name = "padding", 
-- 						PaddingBottom = UDim.new(0, 1), 
-- 						PaddingLeft = UDim.new(0, 1), 
-- 						PaddingRight = UDim.new(0, 1), 
-- 						PaddingTop = UDim.new(0, 1)
-- 					})
-- 				}),
-- 				create("TextButton", {
-- 					LanguageItem = {
-- 						property = "Text",
-- 						identifier = "Search"
-- 					}, 
-- 					AnchorPoint = Vector2.new(1, 0), 
-- 					AutoButtonColor = false, 
-- 					BackgroundColor3 = Color3.fromHex("181818"), 
-- 					FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal), 
-- 					FontSize = Enum.FontSize.Size11, 
-- 					Name = "search", 
-- 					Position = UDim2.new(1, -8, 0, 8), 
-- 					Size = UDim2.new(0, 66, 0, 30), 
-- 					TextColor3 = Color3.fromHex("ebebeb"), 
-- 					TextSize = 11
-- 				}, {
-- 					create("UICorner", { 
-- 						CornerRadius = UDim.new(0, 4), 
-- 						Name = "corner"
-- 					}),
-- 					create("UIStroke", { 
-- 						ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
-- 						Color = Color3.fromHex("141414"), 
-- 						Name = "stroke", 
-- 						Thickness = 1.2
-- 					})
-- 				})
-- 			}),
-- 			create("Frame", { 
-- 				AnchorPoint = Vector2.new(1, 0.5), 
-- 				BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 				BackgroundTransparency = 1, 
-- 				Name = "console", 
-- 				Position = UDim2.new(1, 0, 0.5, 0), 
-- 				Size = UDim2.new(1, -38, 1, 0), 
-- 				Visible = false
-- 			}, {
-- 				create("Frame", { 
-- 					AnchorPoint = Vector2.new(0.5, 0), 
-- 					BackgroundColor3 = Color3.fromHex("181818"), 
-- 					Name = "main", 
-- 					Position = UDim2.new(0.5, 0, 0, 8), 
-- 					Size = UDim2.new(1, -16, 1, -54)
-- 				}, {
-- 					create("UICorner", { 
-- 						CornerRadius = UDim.new(0, 4), 
-- 						Name = "corner"
-- 					}),
-- 					create("ScrollingFrame", { 
-- 						Active = true, 
-- 						AnchorPoint = Vector2.new(0.5, 0.5), 
-- 						BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 						BackgroundTransparency = 1, 
-- 						BorderSizePixel = 0, 
-- 						BottomImage = "rbxassetid://12651249430", 
-- 						CanvasSize = UDim2.new(1, -16, 1, -16), 
-- 						MidImage = "rbxassetid://12651249103", 
-- 						Name = "container", 
-- 						Position = UDim2.new(0.5, 0, 0.5, 0), 
-- 						ScrollBarImageColor3 = Color3.fromHex("484848"), 
-- 						ScrollBarThickness = 4, 
-- 						Size = UDim2.new(1, -16, 1, -16), 
-- 						TopImage = "rbxassetid://12651248921"
-- 					}, {
-- 						create("TextLabel", { 
-- 							BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 							BackgroundTransparency = 1, 
-- 							FontFace = Font.new("rbxasset://fonts/families/Ubuntu.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal), 
-- 							FontSize = Enum.FontSize.Size11, 
-- 							Name = "content", 
-- 							RichText = true, 
-- 							Size = UDim2.new(1, 0, 1, 0), 
-- 							Text = "", 
-- 							TextColor3 = Color3.fromHex("b2b2b2"), 
-- 							TextSize = 11, 
-- 							TextTruncate = Enum.TextTruncate.AtEnd, 
-- 							TextWrap = true, 
-- 							TextWrapped = true, 
-- 							TextXAlignment = Enum.TextXAlignment.Left, 
-- 							TextYAlignment = Enum.TextYAlignment.Top
-- 						})
-- 					}),
-- 					create("UIStroke", { 
-- 						ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
-- 						Color = Color3.fromHex("141414"), 
-- 						Name = "stroke", 
-- 						Thickness = 1.2
-- 					})
-- 				}),
-- 				create("Frame", { 
-- 					AnchorPoint = Vector2.new(0.5, 1), 
-- 					BackgroundColor3 = Color3.fromHex("181818"), 
-- 					Name = "bottom", 
-- 					Position = UDim2.new(0.5, 0, 1, -8), 
-- 					Size = UDim2.new(1, -16, 0, 30)
-- 				}, {
-- 					create("TextButton", { 
-- 						AnchorPoint = Vector2.new(0, 0.5), 
-- 						AutoButtonColor = false, 
-- 						BackgroundColor3 = Color3.fromHex("303030"), 
-- 						BackgroundTransparency = 1, 
-- 						FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal), 
-- 						FontSize = Enum.FontSize.Size14, 
-- 						Name = "clearConsole", 
-- 						Position = UDim2.new(0, 4, 0.5, 0), 
-- 						Size = UDim2.new(0, 63, 0, 22), 
-- 						Text = "", 
-- 						TextColor3 = Color3.fromHex("000000"), 
-- 						TextSize = 14
-- 					}, {
-- 						create("ImageLabel", { 
-- 							AnchorPoint = Vector2.new(1, 0.5), 
-- 							BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 							BackgroundTransparency = 1, 
-- 							Image = "rbxassetid://12778483354", 
-- 							Name = "icon", 
-- 							Position = UDim2.new(1, -6, 0.5, 0), 
-- 							Size = UDim2.new(0, 14, 0, 14)
-- 						}),
-- 						create("UICorner", { 
-- 							CornerRadius = UDim.new(0, 4), 
-- 							Name = "corner"
-- 						}),
-- 						create("TextLabel", { 
-- 							LanguageItem = {
-- 								property = "Text",
-- 								identifier = "ClearConsole"
-- 							},
-- 							AnchorPoint = Vector2.new(0, 0.5), 
-- 							BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 							BackgroundTransparency = 1, 
-- 							FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal), 
-- 							FontSize = Enum.FontSize.Size11, 
-- 							Name = "title", 
-- 							Position = UDim2.new(0, 6, 0.5, 0), 
-- 							Size = UDim2.new(1, -30, 1, 0), 
-- 							TextColor3 = Color3.fromHex("ebebeb"), 
-- 							TextSize = 11, 
-- 							TextXAlignment = Enum.TextXAlignment.Left
-- 						})
-- 					}),
-- 					create("TextButton", { 
-- 						AnchorPoint = Vector2.new(1, 0.5), 
-- 						AutoButtonColor = false, 
-- 						BackgroundColor3 = Color3.fromHex("303030"), 
-- 						BackgroundTransparency = 1, 
-- 						FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal), 
-- 						FontSize = Enum.FontSize.Size14, 
-- 						Name = "copyConsole", 
-- 						Position = UDim2.new(1, -4, 0.5, 0), 
-- 						Size = UDim2.new(0, 109, 0, 22), 
-- 						Text = "", 
-- 						TextColor3 = Color3.fromHex("000000"), 
-- 						TextSize = 14
-- 					}, {
-- 						create("ImageLabel", { 
-- 							AnchorPoint = Vector2.new(1, 0.5), 
-- 							BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 							BackgroundTransparency = 1, 
-- 							Image = "rbxassetid://12778483077", 
-- 							Name = "icon", 
-- 							Position = UDim2.new(1, -6, 0.5, 0), 
-- 							Size = UDim2.new(0, 14, 0, 14)
-- 						}),
-- 						create("UICorner", { 
-- 							CornerRadius = UDim.new(0, 4), 
-- 							Name = "corner"
-- 						}),
-- 						create("TextLabel", { 
-- 							LanguageItem = {
-- 								property = "Text",
-- 								identifier = "CopyConsole"
-- 							},
-- 							AnchorPoint = Vector2.new(0, 0.5), 
-- 							BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 							BackgroundTransparency = 1, 
-- 							FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal), 
-- 							FontSize = Enum.FontSize.Size11, 
-- 							Name = "title", 
-- 							Position = UDim2.new(0, 6, 0.5, 0), 
-- 							Size = UDim2.new(1, -30, 1, 0), 
-- 							TextColor3 = Color3.fromHex("ebebeb"), 
-- 							TextSize = 11, 
-- 							TextXAlignment = Enum.TextXAlignment.Left
-- 						})
-- 					}),
-- 					create("UICorner", { 
-- 						CornerRadius = UDim.new(0, 4), 
-- 						Name = "corner"
-- 					}),
-- 					create("UIStroke", { 
-- 						ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
-- 						Color = Color3.fromHex("141414"), 
-- 						Name = "stroke", 
-- 						Thickness = 1.2
-- 					})
-- 				})
-- 			}),
-- 			create("Frame", { 
-- 				AnchorPoint = Vector2.new(1, 0.5), 
-- 				BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 				BackgroundTransparency = 1, 
-- 				Name = "settings", 
-- 				Position = UDim2.new(1, 0, 0.5, 0), 
-- 				Size = UDim2.new(1, -38, 1, 0), 
-- 				Visible = false
-- 			}, {
-- 				create("ScrollingFrame", { 
-- 					AnchorPoint = Vector2.new(0, 0.5), 
-- 					BackgroundTransparency = 1, 
-- 					BorderSizePixel = 0, 
-- 					CanvasSize = UDim2.new(), 
-- 					Name = "left", 
-- 					Position = UDim2.new(0, 8, 0.5, 0), 
-- 					ScrollBarThickness = 0, 
-- 					Size = UDim2.new(0.5, -12, 1, -16)
-- 				}, {
-- 					create("UIListLayout", { 
-- 						Name = "list", 
-- 						Padding = UDim.new(0, 8), 
-- 						SortOrder = Enum.SortOrder.LayoutOrder
-- 					}),
-- 					create("Frame", { 
-- 						BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 						BackgroundTransparency = 1, 
-- 						Name = "languages", 
-- 						Size = UDim2.new(1, 0, 0, 28)
-- 					}, {
-- 						create("TextButton", { 
-- 							AnchorPoint = Vector2.new(0, 0.5), 
-- 							AutoButtonColor = false, 
-- 							BackgroundColor3 = Color3.fromHex("181818"), 
-- 							BorderColor3 = Color3.fromHex("1b2a35"), 
-- 							FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal), 
-- 							FontSize = Enum.FontSize.Size14, 
-- 							Name = "indicator", 
-- 							Position = UDim2.new(0, 0, 0.5, 0), 
-- 							Size = UDim2.new(0, 28, 0, 28), 
-- 							Text = "", 
-- 							TextColor3 = Color3.fromHex("000000"), 
-- 							TextSize = 14
-- 						}, {
-- 							create("UICorner", { 
-- 								CornerRadius = UDim.new(0, 4), 
-- 								Name = "corner"
-- 							}),
-- 							create("ImageLabel", { 
-- 								AnchorPoint = Vector2.new(0.5, 0.5), 
-- 								BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 								BackgroundTransparency = 1, 
-- 								Image = "rbxassetid://13084553682", 
-- 								Name = "icon", 
-- 								Position = UDim2.new(0.5, 0, 0.5, 0), 
-- 								Size = UDim2.new(1, -8, 1, -8)
-- 							}),
-- 							create("UIStroke", { 
-- 								ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
-- 								Color = Color3.fromHex("141414"), 
-- 								Name = "stroke", 
-- 								Thickness = 1.2
-- 							})
-- 						}),
-- 						create("TextButton", { 
-- 							AnchorPoint = Vector2.new(1, 0.5), 
-- 							AutoButtonColor = false, 
-- 							BackgroundColor3 = Color3.fromHex("181818"), 
-- 							FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal), 
-- 							FontSize = Enum.FontSize.Size11, 
-- 							Name = "title", 
-- 							Position = UDim2.new(1, 0, 0.5, 0), 
-- 							Size = UDim2.new(1, -36, 1, 0), 
-- 							Text = "English", 
-- 							TextColor3 = Color3.fromHex("ebebeb"), 
-- 							TextSize = 11
-- 						}, {
-- 							create("UICorner", { 
-- 								CornerRadius = UDim.new(0, 4), 
-- 								Name = "corner"
-- 							}),
-- 							create("UIStroke", { 
-- 								ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
-- 								Color = Color3.fromHex("141414"), 
-- 								Name = "stroke", 
-- 								Thickness = 1.2
-- 							})
-- 						}),
-- 						create("Frame", { 
-- 							AnchorPoint = Vector2.new(1, 0), 
-- 							BackgroundColor3 = Color3.fromHex("181818"), 
-- 							Name = "drop", 
-- 							Position = UDim2.new(1, 0, 1, 8), 
-- 							Size = UDim2.new(1, -36, 0, 156), 
-- 							Visible = false, 
-- 							ZIndex = 2
-- 						}, {
-- 							create("UIStroke", { 
-- 								ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
-- 								Color = Color3.fromHex("141414"), 
-- 								Name = "stroke", 
-- 								Thickness = 1.2
-- 							}),
-- 							create("UICorner", { 
-- 								CornerRadius = UDim.new(0, 4), 
-- 								Name = "corner"
-- 							}),
-- 							create("ScrollingFrame", { 
-- 								Active = true, 
-- 								AnchorPoint = Vector2.new(0.5, 0.5), 
-- 								BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 								BackgroundTransparency = 1, 
-- 								BorderSizePixel = 0, 
-- 								BottomImage = "rbxassetid://12651249430", 
-- 								CanvasSize = UDim2.new(0, 0, 0, 0), 
-- 								MidImage = "rbxassetid://12651249103", 
-- 								Name = "container", 
-- 								Position = UDim2.new(0.5, 0, 0.5, 0), 
-- 								ScrollBarImageColor3 = Color3.fromHex("141414"), 
-- 								ScrollBarThickness = 4, 
-- 								Size = UDim2.new(1, -16, 1, -16), 
-- 								TopImage = "rbxassetid://12651248921", 
-- 								ZIndex = 2
-- 							}, {
-- 								create("UIListLayout", { 
-- 									Name = "list", 
-- 									Padding = UDim.new(0, 6), 
-- 									SortOrder = Enum.SortOrder.LayoutOrder
-- 								}),
-- 								create("UIPadding", { 
-- 									Name = "padding", 
-- 									PaddingBottom = UDim.new(0, 1), 
-- 									PaddingLeft = UDim.new(0, 1), 
-- 									PaddingRight = UDim.new(0, 1), 
-- 									PaddingTop = UDim.new(0, 1)
-- 								})
-- 							})
-- 						})
-- 					}),
-- 					create("Frame", { 
-- 						BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 						BackgroundTransparency = 1, 
-- 						BorderSizePixel = 0, 
-- 						Name = "separator", 
-- 						Size = UDim2.new(1, 0, 0, 11)
-- 					}, {
-- 						create("Frame", { 
-- 							AnchorPoint = Vector2.new(0.5, 0.5), 
-- 							BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 							BorderSizePixel = 0, 
-- 							Name = "bar", 
-- 							Position = UDim2.new(0.5, 0, 0.5, 0), 
-- 							Size = UDim2.new(1, 0, 0, 1)
-- 						}, {
-- 							create("UIGradient", { 
-- 								Color = ColorSequence.new({ 
-- 									ColorSequenceKeypoint.new(0, Color3.fromHex("3c3c3c")), 
-- 									ColorSequenceKeypoint.new(1, Color3.fromHex("3c3c3c"))
-- 								}), 
-- 								Transparency = NumberSequence.new({ 
-- 									NumberSequenceKeypoint.new(0, 1), 
-- 									NumberSequenceKeypoint.new(0.2, 0), 
-- 									NumberSequenceKeypoint.new(0.8, 0), 
-- 									NumberSequenceKeypoint.new(1, 1)
-- 								})
-- 							})
-- 						})
-- 					}),
-- 					create("TextButton", { 
-- 						AutoButtonColor = false, 
-- 						BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 						BackgroundTransparency = 1, 
-- 						FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal), 
-- 						FontSize = Enum.FontSize.Size14, 
-- 						Name = "unlockFps", 
-- 						Size = UDim2.new(1, 0, 0, 28), 
-- 						Text = "", 
-- 						TextColor3 = Color3.fromHex("000000"), 
-- 						TextSize = 14
-- 					}, {
-- 						create("Frame", { 
-- 							AnchorPoint = Vector2.new(0, 0.5), 
-- 							BackgroundColor3 = Color3.fromHex("181818"), 
-- 							Name = "indicator", 
-- 							Position = UDim2.new(0, 0, 0.5, 0), 
-- 							Size = UDim2.new(0, 28, 0, 28)
-- 						}, {
-- 							create("UICorner", { 
-- 								CornerRadius = UDim.new(0, 4), 
-- 								Name = "corner"
-- 							}),
-- 							create("UIStroke", { 
-- 								ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
-- 								Color = Color3.fromHex("141414"), 
-- 								Name = "stroke", 
-- 								Thickness = 1.2
-- 							}),
-- 							create("ImageLabel", { 
-- 								AnchorPoint = Vector2.new(0.5, 0.5), 
-- 								BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 								BackgroundTransparency = 1, 
-- 								Image = "rbxassetid://13107126808", 
-- 								ImageTransparency = uiSettings.unlockFps and 0 or 1, 
-- 								Name = "icon", 
-- 								Position = UDim2.new(0.5, 0, 0.5, 0), 
-- 								Size = UDim2.new(1, -8, 1, -8)
-- 							})
-- 						}),
-- 						create("TextLabel", { 
-- 							LanguageItem = {
-- 								property = "Text",
-- 								identifier = "UnlockFPS"
-- 							},
-- 							AnchorPoint = Vector2.new(1, 0.5), 
-- 							BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 							BackgroundTransparency = 1, 
-- 							FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal), 
-- 							FontSize = Enum.FontSize.Size11, 
-- 							Name = "title", 
-- 							Position = UDim2.new(1, 0, 0.5, 0), 
-- 							Size = UDim2.new(1, -40, 1, 0), 
-- 							TextColor3 = Color3.fromHex("ebebeb"), 
-- 							TextSize = 11, 
-- 							TextXAlignment = Enum.TextXAlignment.Left
-- 						})
-- 					}),
-- 					create("TextButton", { 
-- 						AutoButtonColor = false, 
-- 						BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 						BackgroundTransparency = 1, 
-- 						FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal), 
-- 						FontSize = Enum.FontSize.Size14, 
-- 						Name = "vSync", 
-- 						Size = UDim2.new(1, 0, 0, 28), 
-- 						Text = "", 
-- 						TextColor3 = Color3.fromHex("000000"), 
-- 						TextSize = 14
-- 					}, {
-- 						create("Frame", { 
-- 							AnchorPoint = Vector2.new(0, 0.5), 
-- 							BackgroundColor3 = Color3.fromHex("181818"), 
-- 							Name = "indicator", 
-- 							Position = UDim2.new(0, 0, 0.5, 0), 
-- 							Size = UDim2.new(0, 28, 0, 28)
-- 						}, {
-- 							create("UICorner", { 
-- 								CornerRadius = UDim.new(0, 4), 
-- 								Name = "corner"
-- 							}),
-- 							create("UIStroke", { 
-- 								ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
-- 								Color = Color3.fromHex("141414"), 
-- 								Name = "stroke", 
-- 								Thickness = 1.2
-- 							}),
-- 							create("ImageLabel", { 
-- 								AnchorPoint = Vector2.new(0.5, 0.5), 
-- 								BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 								BackgroundTransparency = 1, 
-- 								Image = "rbxassetid://13107126808", 
-- 								ImageTransparency = uiSettings.vSync and 0 or 1, 
-- 								Name = "icon", 
-- 								Position = UDim2.new(0.5, 0, 0.5, 0), 
-- 								Size = UDim2.new(1, -8, 1, -8)
-- 							})
-- 						}),
-- 						create("TextLabel", { 
-- 							LanguageItem = {
-- 								property = "Text",
-- 								identifier = "VSync"
-- 							},
-- 							AnchorPoint = Vector2.new(1, 0.5), 
-- 							BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 							BackgroundTransparency = 1, 
-- 							FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal), 
-- 							FontSize = Enum.FontSize.Size11, 
-- 							Name = "title", 
-- 							Position = UDim2.new(1, 0, 0.5, 0), 
-- 							Size = UDim2.new(1, -40, 1, 0), 
-- 							TextColor3 = Color3.fromHex("ebebeb"), 
-- 							TextSize = 11, 
-- 							TextXAlignment = Enum.TextXAlignment.Left
-- 						})
-- 					}),
-- 					create("Frame", { 
-- 						BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 						BackgroundTransparency = 1, 
-- 						Name = "fpsValue", 
-- 						Size = UDim2.new(1, 0, 0, 38)
-- 					}, {
-- 						create("TextLabel", { 
-- 							LanguageItem = {
-- 								property = "Text",
-- 								identifier = "FPS"
-- 							},
-- 							BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 							BackgroundTransparency = 1, 
-- 							FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal), 
-- 							FontSize = Enum.FontSize.Size11, 
-- 							Name = "title", 
-- 							Position = UDim2.new(0, 4, 0, 0), 
-- 							Size = UDim2.new(1, -8, 0, 24), 
-- 							TextColor3 = Color3.fromHex("ebebeb"), 
-- 							TextSize = 11, 
-- 							TextXAlignment = Enum.TextXAlignment.Left
-- 						}),
-- 						create("TextLabel", { 
-- 							BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 							BackgroundTransparency = 1, 
-- 							FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal), 
-- 							FontSize = Enum.FontSize.Size11, 
-- 							Name = "value", 
-- 							Position = UDim2.new(0, 4, 0, 0), 
-- 							Size = UDim2.new(1, -8, 0, 24), 
-- 							Text = "60", 
-- 							TextColor3 = Color3.fromHex("ebebeb"), 
-- 							TextSize = 11, 
-- 							TextXAlignment = Enum.TextXAlignment.Right
-- 						}),
-- 						create("Frame", { 
-- 							AnchorPoint = Vector2.new(0.5, 1), 
-- 							BackgroundColor3 = Color3.fromHex("181818"), 
-- 							ClipsDescendants = true, 
-- 							Name = "container", 
-- 							Position = UDim2.new(0.5, 0, 1, 0), 
-- 							Size = UDim2.new(1, 0, 0, 12)
-- 						}, {
-- 							create("UICorner", { 
-- 								CornerRadius = UDim.new(1, 0), 
-- 								Name = "corner"
-- 							}),
-- 							create("UIStroke", { 
-- 								ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
-- 								Color = Color3.fromHex("141414"), 
-- 								Name = "stroke", 
-- 								Thickness = 1.2
-- 							}),
-- 							create("Frame", { 
-- 								BackgroundColor3 = Color3.fromHex("303030"), 
-- 								Name = "indicator", 
-- 								Size = UDim2.new(59 / 998, 0, 1, 0)
-- 							}, {
-- 								create("UICorner", { 
-- 									CornerRadius = UDim.new(1, 0), 
-- 									Name = "corner"
-- 								}),
-- 								create("UIStroke", { 
-- 									ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
-- 									Color = Color3.fromHex("141414"), 
-- 									Name = "stroke", 
-- 									Thickness = 1.2
-- 								})
-- 							})
-- 						})
-- 					})
-- 				}),
-- 				create("ScrollingFrame", { 
-- 					AnchorPoint = Vector2.new(1, 0.5), 
-- 					BackgroundTransparency = 1, 
-- 					BorderSizePixel = 0, 
-- 					CanvasSize = UDim2.new(), 
-- 					Name = "right", 
-- 					Position = UDim2.new(1, -8, 0.5, 0), 
-- 					ScrollBarThickness = 0, 
-- 					Size = UDim2.new(0.5, -12, 1, -16)
-- 				}, {
-- 					create("UIListLayout", { 
-- 						Name = "list", 
-- 						Padding = UDim.new(0, 8), 
-- 						SortOrder = Enum.SortOrder.LayoutOrder
-- 					}),
-- 					create("Frame", { 
-- 						BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 						BackgroundTransparency = 1, 
-- 						Name = "scriptApi", 
-- 						Size = UDim2.new(1, 0, 0, 28)
-- 					}, {
-- 						create("TextButton", { 
-- 							AnchorPoint = Vector2.new(0, 0.5), 
-- 							AutoButtonColor = false, 
-- 							BackgroundColor3 = Color3.fromHex("181818"), 
-- 							BorderColor3 = Color3.fromHex("1b2a35"), 
-- 							FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal), 
-- 							FontSize = Enum.FontSize.Size14, 
-- 							Name = "indicator", 
-- 							Position = UDim2.new(0, 0, 0.5, 0), 
-- 							Size = UDim2.new(0, 28, 0, 28), 
-- 							Text = "", 
-- 							TextColor3 = Color3.fromHex("000000"), 
-- 							TextSize = 14
-- 						}, {
-- 							create("UICorner", { 
-- 								CornerRadius = UDim.new(0, 4), 
-- 								Name = "corner"
-- 							}),
-- 							create("ImageLabel", { 
-- 								AnchorPoint = Vector2.new(0.5, 0.5), 
-- 								BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 								BackgroundTransparency = 1, 
-- 								Image = "rbxassetid://12874034639", 
-- 								Name = "icon", 
-- 								Position = UDim2.new(0.5, 0, 0.5, 0), 
-- 								Size = UDim2.new(1, -8, 1, -8)
-- 							}),
-- 							create("UIStroke", { 
-- 								ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
-- 								Color = Color3.fromHex("141414"), 
-- 								Name = "stroke", 
-- 								Thickness = 1.2
-- 							})
-- 						}),
-- 						create("TextButton", { 
-- 							AnchorPoint = Vector2.new(1, 0.5), 
-- 							AutoButtonColor = false, 
-- 							BackgroundColor3 = Color3.fromHex("181818"), 
-- 							FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal), 
-- 							FontSize = Enum.FontSize.Size11, 
-- 							Name = "title", 
-- 							Position = UDim2.new(1, 0, 0.5, 0), 
-- 							Size = UDim2.new(1, -36, 1, 0), 
-- 							Text = uiSettings.searchAPI, 
-- 							TextColor3 = Color3.fromHex("ebebeb"), 
-- 							TextSize = 11
-- 						}, {
-- 							create("UICorner", { 
-- 								CornerRadius = UDim.new(0, 4), 
-- 								Name = "corner"
-- 							}),
-- 							create("UIStroke", { 
-- 								ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
-- 								Color = Color3.fromHex("141414"), 
-- 								Name = "stroke", 
-- 								Thickness = 1.2
-- 							})
-- 						}),
-- 						create("Frame", { 
-- 							AnchorPoint = Vector2.new(1, 0), 
-- 							BackgroundColor3 = Color3.fromHex("181818"), 
-- 							Name = "drop", 
-- 							Position = UDim2.new(1, 0, 1, 8), 
-- 							Size = UDim2.new(1, -36, 0, 84), 
-- 							Visible = false, 
-- 							ZIndex = 2
-- 						}, {
-- 							create("UIStroke", { 
-- 								ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
-- 								Color = Color3.fromHex("141414"), 
-- 								Name = "stroke", 
-- 								Thickness = 1.2
-- 							}),
-- 							create("UICorner", { 
-- 								CornerRadius = UDim.new(0, 4), 
-- 								Name = "corner"
-- 							}),
-- 							create("ScrollingFrame", { 
-- 								Active = true, 
-- 								AnchorPoint = Vector2.new(0.5, 0.5), 
-- 								BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 								BackgroundTransparency = 1, 
-- 								BorderSizePixel = 0, 
-- 								BottomImage = "rbxassetid://12651249430", 
-- 								CanvasSize = UDim2.new(0, 0, 0, 0), 
-- 								MidImage = "rbxassetid://12651249103", 
-- 								Name = "container", 
-- 								Position = UDim2.new(0.5, 0, 0.5, 0), 
-- 								ScrollBarImageColor3 = Color3.fromHex("141414"), 
-- 								ScrollBarThickness = 4, 
-- 								Size = UDim2.new(1, -16, 1, -16), 
-- 								TopImage = "rbxassetid://12651248921", 
-- 								ZIndex = 2
-- 							}, {
-- 								create("UIListLayout", { 
-- 									Name = "list", 
-- 									Padding = UDim.new(0, 6), 
-- 									SortOrder = Enum.SortOrder.LayoutOrder
-- 								}),
-- 								create("UIPadding", { 
-- 									Name = "padding", 
-- 									PaddingBottom = UDim.new(0, 1), 
-- 									PaddingLeft = UDim.new(0, 1), 
-- 									PaddingRight = UDim.new(0, 1), 
-- 									PaddingTop = UDim.new(0, 1)
-- 								})
-- 							})
-- 						})
-- 					}),
-- 					create("Frame", { 
-- 						BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 						BackgroundTransparency = 1, 
-- 						BorderSizePixel = 0, 
-- 						Name = "separator", 
-- 						Size = UDim2.new(1, 0, 0, 13)
-- 					}, {
-- 						create("Frame", { 
-- 							AnchorPoint = Vector2.new(0.5, 0.5), 
-- 							BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 							BorderSizePixel = 0, 
-- 							Name = "bar", 
-- 							Position = UDim2.new(0.5, 0, 0.5, 0), 
-- 							Size = UDim2.new(1, 0, 0, 1)
-- 						}, {
-- 							create("UIGradient", { 
-- 								Color = ColorSequence.new({ 
-- 									ColorSequenceKeypoint.new(0, Color3.fromHex("3c3c3c")), 
-- 									ColorSequenceKeypoint.new(1, Color3.fromHex("3c3c3c"))
-- 								}), 
-- 								Transparency = NumberSequence.new({ 
-- 									NumberSequenceKeypoint.new(0, 1), 
-- 									NumberSequenceKeypoint.new(0.2, 0), 
-- 									NumberSequenceKeypoint.new(0.8, 0), 
-- 									NumberSequenceKeypoint.new(1, 1)
-- 								})
-- 							})
-- 						})
-- 					}),
-- 					create("TextButton", { 
-- 						AutoButtonColor = false, 
-- 						BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 						BackgroundTransparency = 1, 
-- 						FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal), 
-- 						FontSize = Enum.FontSize.Size14, 
-- 						Name = "antiAfk", 
-- 						Size = UDim2.new(1, 0, 0, 28), 
-- 						Text = "", 
-- 						TextColor3 = Color3.fromHex("000000"), 
-- 						TextSize = 14
-- 					}, {
-- 						create("Frame", { 
-- 							AnchorPoint = Vector2.new(0, 0.5), 
-- 							BackgroundColor3 = Color3.fromHex("181818"), 
-- 							Name = "indicator", 
-- 							Position = UDim2.new(0, 0, 0.5, 0), 
-- 							Size = UDim2.new(0, 28, 0, 28)
-- 						}, {
-- 							create("UICorner", { 
-- 								CornerRadius = UDim.new(0, 4), 
-- 								Name = "corner"
-- 							}),
-- 							create("UIStroke", { 
-- 								ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
-- 								Color = Color3.fromHex("141414"), 
-- 								Name = "stroke", 
-- 								Thickness = 1.2
-- 							}),
-- 							create("ImageLabel", { 
-- 								AnchorPoint = Vector2.new(0.5, 0.5), 
-- 								BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 								BackgroundTransparency = 1, 
-- 								Image = "rbxassetid://13107126808", 
-- 								ImageTransparency = uiSettings.antiAfk and 0 or 1, 
-- 								Name = "icon", 
-- 								Position = UDim2.new(0.5, 0, 0.5, 0), 
-- 								Size = UDim2.new(1, -8, 1, -8)
-- 							})
-- 						}),
-- 						create("TextLabel", { 
-- 							LanguageItem = {
-- 								property = "Text",
-- 								identifier = "AntiAFK"
-- 							},
-- 							AnchorPoint = Vector2.new(1, 0.5), 
-- 							BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 							BackgroundTransparency = 1, 
-- 							FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal), 
-- 							FontSize = Enum.FontSize.Size11, 
-- 							Name = "title", 
-- 							Position = UDim2.new(1, 0, 0.5, 0), 
-- 							Size = UDim2.new(1, -40, 1, 0), 
-- 							TextColor3 = Color3.fromHex("ebebeb"), 
-- 							TextSize = 11, 
-- 							TextXAlignment = Enum.TextXAlignment.Left
-- 						})
-- 					}),
-- 					create("Frame", { 
-- 						BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 						BackgroundTransparency = 1, 
-- 						BorderSizePixel = 0, 
-- 						Name = "separator", 
-- 						Size = UDim2.new(1, 0, 0, 11)
-- 					}, {
-- 						create("Frame", { 
-- 							AnchorPoint = Vector2.new(0.5, 0.5), 
-- 							BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 							BorderSizePixel = 0, 
-- 							Name = "bar", 
-- 							Position = UDim2.new(0.5, 0, 0.5, 0), 
-- 							Size = UDim2.new(1, 0, 0, 1)
-- 						}, {
-- 							create("UIGradient", { 
-- 								Color = ColorSequence.new({ 
-- 									ColorSequenceKeypoint.new(0, Color3.fromHex("3c3c3c")), 
-- 									ColorSequenceKeypoint.new(1, Color3.fromHex("3c3c3c"))
-- 								}), 
-- 								Transparency = NumberSequence.new({ 
-- 									NumberSequenceKeypoint.new(0, 1), 
-- 									NumberSequenceKeypoint.new(0.2, 0), 
-- 									NumberSequenceKeypoint.new(0.8, 0), 
-- 									NumberSequenceKeypoint.new(1, 1)
-- 								})
-- 							})
-- 						})
-- 					}),
-- 					create("Frame", { 
-- 						BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 						BackgroundTransparency = 1, 
-- 						Name = "serverHopMode", 
-- 						Size = UDim2.new(1, 0, 0, 28)
-- 					}, {
-- 						create("UIListLayout", { 
-- 							FillDirection = Enum.FillDirection.Horizontal, 
-- 							Name = "list", 
-- 							Padding = UDim.new(0, 8), 
-- 							SortOrder = Enum.SortOrder.LayoutOrder
-- 						}),
-- 						create("TextButton", { 
-- 							LanguageItem = {
-- 								property = "Text",
-- 								identifier = "Full"
-- 							},
-- 							AnchorPoint = Vector2.new(1, 0.5), 
-- 							AutoButtonColor = false, 
-- 							BackgroundColor3 = Color3.fromHex(uiSettings.serverHopMode == "full" and "303030" or "181818"), 
-- 							FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal), 
-- 							FontSize = Enum.FontSize.Size11, 
-- 							Name = "full", 
-- 							Position = UDim2.new(1, 0, 0.5, 0), 
-- 							Size = UDim2.new(0, 35, 1, 0), 
-- 							TextColor3 = Color3.fromHex("ebebeb"), 
-- 							TextSize = 11
-- 						}, {
-- 							create("UICorner", { 
-- 								CornerRadius = UDim.new(0, 4), 
-- 								Name = "corner"
-- 							}),
-- 							create("UIStroke", { 
-- 								ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
-- 								Color = Color3.fromHex("141414"), 
-- 								Name = "stroke", 
-- 								Thickness = 0.8
-- 							})
-- 						}),
-- 						create("TextButton", { 
-- 							LanguageItem = {
-- 								property = "Text",
-- 								identifier = "Empty"
-- 							},
-- 							AnchorPoint = Vector2.new(1, 0.5), 
-- 							AutoButtonColor = false, 
-- 							BackgroundColor3 = Color3.fromHex(uiSettings.serverHopMode == "empty" and "303030" or "181818"), 
-- 							FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal), 
-- 							FontSize = Enum.FontSize.Size11, 
-- 							Name = "empty", 
-- 							Position = UDim2.new(1, 0, 0.5, 0), 
-- 							Size = UDim2.new(0, 49, 1, 0), 
-- 							TextColor3 = Color3.fromHex("ebebeb"), 
-- 							TextSize = 11
-- 						}, {
-- 							create("UICorner", { 
-- 								CornerRadius = UDim.new(0, 4), 
-- 								Name = "corner"
-- 							}),
-- 							create("UIStroke", { 
-- 								ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
-- 								Color = Color3.fromHex("141414"), 
-- 								Name = "stroke", 
-- 								Thickness = 0.8
-- 							})
-- 						}),
-- 						create("TextButton", { 
-- 							LanguageItem = {
-- 								property = "Text",
-- 								identifier = "BestPing"
-- 							},
-- 							AnchorPoint = Vector2.new(1, 0.5), 
-- 							AutoButtonColor = false, 
-- 							BackgroundColor3 = Color3.fromHex(uiSettings.serverHopMode == "bestPing" and "303030" or "181818"), 
-- 							FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal), 
-- 							FontSize = Enum.FontSize.Size11, 
-- 							Name = "bestPing", 
-- 							Position = UDim2.new(1, 0, 0.5, 0), 
-- 							Size = UDim2.new(0, 65, 1, 0), 
-- 							TextColor3 = Color3.fromHex("ebebeb"), 
-- 							TextSize = 11
-- 						}, {
-- 							create("UICorner", { 
-- 								CornerRadius = UDim.new(0, 4), 
-- 								Name = "corner"
-- 							}),
-- 							create("UIStroke", { 
-- 								ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
-- 								Color = Color3.fromHex("141414"), 
-- 								Name = "stroke", 
-- 								Thickness = 0.8
-- 							})
-- 						}),
-- 						create("TextButton", { 
-- 							LanguageItem = {
-- 								property = "Text",
-- 								identifier = "Random"
-- 							},
-- 							AnchorPoint = Vector2.new(1, 0.5), 
-- 							AutoButtonColor = false, 
-- 							BackgroundColor3 = Color3.fromHex(uiSettings.serverHopMode == "random" and "303030" or "181818"), 
-- 							FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal), 
-- 							FontSize = Enum.FontSize.Size11, 
-- 							Name = "random", 
-- 							Position = UDim2.new(1, 0, 0.5, 0), 
-- 							Size = UDim2.new(0, 59, 1, 0), 
-- 							TextColor3 = Color3.fromHex("ebebeb"), 
-- 							TextSize = 11
-- 						}, {
-- 							create("UICorner", { 
-- 								CornerRadius = UDim.new(0, 4), 
-- 								Name = "corner"
-- 							}),
-- 							create("UIStroke", { 
-- 								ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
-- 								Color = Color3.fromHex("141414"), 
-- 								Name = "stroke", 
-- 								Thickness = 0.8
-- 							})
-- 						})
-- 					}),
-- 					create("UIPadding", { 
-- 						Name = "padding", 
-- 						PaddingBottom = UDim.new(0, 1), 
-- 						PaddingLeft = UDim.new(0, 1), 
-- 						PaddingRight = UDim.new(0, 1), 
-- 						PaddingTop = UDim.new(0, 1)
-- 					}),
-- 					create("Frame", { 
-- 						BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 						BackgroundTransparency = 1, 
-- 						Name = "serverHop", 
-- 						Size = UDim2.new(1, 0, 0, 28)
-- 					}, {
-- 						create("TextButton", { 
-- 							LanguageItem = {
-- 								property = "Text",
-- 								identifier = "RejoinServer"
-- 							},
-- 							AnchorPoint = Vector2.new(1, 0.5), 
-- 							AutoButtonColor = false, 
-- 							BackgroundColor3 = Color3.fromHex("181818"), 
-- 							FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal), 
-- 							FontSize = Enum.FontSize.Size11, 
-- 							Name = "rejoin", 
-- 							Position = UDim2.new(1, 0, 0.5, 0), 
-- 							Size = UDim2.new(0.5, -4, 1, 0), 
-- 							TextColor3 = Color3.fromHex("ebebeb"), 
-- 							TextSize = 11
-- 						}, {
-- 							create("UICorner", { 
-- 								CornerRadius = UDim.new(0, 4), 
-- 								Name = "corner"
-- 							}),
-- 							create("UIStroke", { 
-- 								ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
-- 								Color = Color3.fromHex("141414"), 
-- 								Name = "stroke", 
-- 								Thickness = 0.8
-- 							})
-- 						}),
-- 						create("TextButton", { 
-- 							LanguageItem = {
-- 								property = "Text",
-- 								identifier = "ServerHop"
-- 							},
-- 							AnchorPoint = Vector2.new(0, 0.5), 
-- 							AutoButtonColor = false, 
-- 							BackgroundColor3 = Color3.fromHex("181818"), 
-- 							FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal), 
-- 							FontSize = Enum.FontSize.Size11, 
-- 							Name = "hop", 
-- 							Position = UDim2.new(0, 0, 0.5, 0), 
-- 							Size = UDim2.new(0.5, -4, 1, 0), 
-- 							TextColor3 = Color3.fromHex("ebebeb"), 
-- 							TextSize = 11
-- 						}, {
-- 							create("UICorner", { 
-- 								CornerRadius = UDim.new(0, 4), 
-- 								Name = "corner"
-- 							}),
-- 							create("UIStroke", { 
-- 								ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
-- 								Color = Color3.fromHex("141414"), 
-- 								Name = "stroke", 
-- 								Thickness = 0.8
-- 							})
-- 						})
-- 					})
-- 				})
-- 			})
-- 		}),
-- 		create("UISizeConstraint", { 
-- 			MaxSize = Vector2.new(800, 500), 
-- 			Name = "constraint"
-- 		}),
-- 		create("ImageLabel", { 
-- 			AnchorPoint = Vector2.new(0.5, 0.5), 
-- 			BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 			BackgroundTransparency = 1, 
-- 			Image = "rbxassetid://12874061329", 
-- 			ImageColor3 = Color3.fromHex("000000"), 
-- 			Name = "blur", 
-- 			Position = UDim2.new(0.5, 0, 0.5, 0), 
-- 			ScaleType = Enum.ScaleType.Slice, 
-- 			Size = UDim2.new(1, 10, 1, 10), 
-- 			SliceCenter = Rect.new(10, 10, 118, 118), 
-- 			ZIndex = 0
-- 		}),
-- 		create("UIStroke", { 
-- 			ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
-- 			Color = Color3.fromHex("141414"), 
-- 			Name = "stroke", 
-- 			Thickness = 0.8
-- 		})
-- 	});

-- 	--[[ Start ]]--

-- 	local runCode = removeTrace("runcode");

-- 	local tabs = main.tabs;
-- 	local tabButtons = main.left.buttons;

-- 	--[[ Toggle UI ]]--

-- 	do
-- 		local isOpen = false;

-- 		toggleMain.MouseButton1Click:Connect(function()
-- 			isOpen = not isOpen;
-- 			main.Visible = isOpen;
-- 		end);
-- 	end

-- 	--[[ Toggle Drag ]]--

-- 	do
-- 		local currentCamera = workspace.CurrentCamera;

-- 		toggleMain.InputBegan:Connect(function(input)
-- 			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
-- 				local inputConn = userInputService.InputChanged:Connect(function(input)
-- 					if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
-- 						tween(toggleMain, 0.18, {
-- 							Position = UDim2.new(0, math.clamp(input.Position.X, 25, currentCamera.ViewportSize.X - 25), 0, math.clamp(input.Position.Y, 25, currentCamera.ViewportSize.Y - 25))
-- 						});
-- 					end
-- 				end);
-- 				local conn; conn = input.Changed:Connect(function()
-- 					if input.UserInputState == Enum.UserInputState.End then
-- 						inputConn:Disconnect();
-- 						conn:Disconnect();
-- 					end
-- 				end);
-- 			end
-- 		end);
-- 	end

-- 	--[[ Select Tabs ]]--

-- 	local selectedTab = tabs.editor;

-- 	local function selectTab(name)
-- 		local btn, tab = tabButtons[name], tabs[name];
-- 		if selectedTab ~= tab then
-- 			selectedTab.Visible = false;
-- 			tween(tabButtons[selectedTab.Name], 0.18, {
-- 				BackgroundTransparency = 1;
-- 			});
-- 			selectedTab = tab;
-- 			tab.Visible = true;
-- 			tween(btn, 0.18, {
-- 				BackgroundTransparency = 0;
-- 			});
-- 		end
-- 	end

-- 	do
-- 		local buttonList = tabButtons:GetChildren();
-- 		for i = 1, #buttonList do
-- 			local v = buttonList[i];
-- 			if v:IsA("TextButton") then
-- 				local tab = tabs[v.Name];
-- 				v.MouseButton1Click:Connect(function()
-- 					selectTab(v.Name);
-- 				end);
-- 			end
-- 		end
-- 	end

-- 	--[[ Editor ]]--

-- 	do
-- 		local editor = tabs.editor;

-- 		local scroll = editor.main.container;
-- 		local content = scroll.content;

-- 		do
-- 			local lineNumbers = editor.main.lineNumbers;
-- 			local lineLabel = lineNumbers.label;

-- 			local function getTextBounds(input)
-- 				return textService:GetTextSize(input, content.TextSize, content.Font, hugeVector2);
-- 			end

-- 			content:GetPropertyChangedSignal("Text"):Connect(function()
-- 				local input = content.Text;
-- 				local lines = math.min(#string.split(input, "\n"), maxLines);
-- 				local digitLength = #tostring(lines) * 6;
-- 				local textBounds = getTextBounds(input);
-- 				local textHeight = math.min(textBounds.Y, maxLines * 11);
-- 				local str = "";
-- 				for i = 1, lines do
-- 					str ..= string.format("%d%s", i, i == lines and "" or "\n");
-- 				end
-- 				lineLabel.Text = str;
-- 				lineNumbers.Size = UDim2.new(0, digitLength, 1, 0);
-- 				lineNumbers.CanvasSize = UDim2.new(0, digitLength, 0, textHeight);
-- 				scroll.Size = UDim2.new(1, -(9 + digitLength), 1, 0);
-- 				scroll.CanvasSize = UDim2.new(0, textBounds.X + digitLength, 0, textHeight);
-- 			end);

-- 			scroll:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
-- 				lineNumbers.CanvasPosition = Vector2.new(0, scroll.CanvasPosition.Y);
-- 			end);
-- 		end		

-- 		do
-- 			local right = editor.right.buttons;
-- 			local items = right:GetChildren();
-- 			for i = 1, #items do
-- 				local v = items[i];
-- 				if v:IsA("TextButton") then
-- 					addTransparencyHighlights(v);
-- 				end
-- 			end

-- 			right.executeBox.MouseButton1Click:Connect(function()
-- 				runCode(content.Text);
-- 			end);

-- 			right.clearBox.MouseButton1Click:Connect(function()
-- 				content.Text = "";
-- 			end);

-- 			right.executeClip.MouseButton1Click:Connect(function()
-- 				runCode(_getclipboard());
-- 			end);

-- 			right.copyClip.MouseButton1Click:Connect(function()
-- 				_setclipboard(content.Text);
-- 			end);

-- 			right.loadClip.MouseButton1Click:Connect(function()
-- 				local text = _getclipboard();
-- 				if #text > 16384 then
-- 					rconsolewarn("Clipboard Text is too large to be loaded to the editor. Execute directly using \"Execute Clipboard\".");
-- 				else
-- 					content.Text = text;
-- 				end
-- 			end);

-- 			resizeFunctions[#resizeFunctions + 1] = function()
-- 				local maxBound = 0;
-- 				for i = 1, #items do
-- 					local v = items[i];
-- 					if v:IsA("TextButton") then
-- 						local bound = v.title.TextBounds.X;
-- 						if bound > maxBound then
-- 							maxBound = bound;
-- 						end
-- 					end
-- 				end
-- 				editor.right.Size = UDim2.new(0, maxBound + 48, 1, 0);
-- 				editor.main.Size = UDim2.new(1, -(maxBound + 56), 1, 0);
-- 			end
-- 		end
-- 	end

-- 	--[[ Games ]]--

-- 	do
-- 		local games = tabs.games;

-- 		local scroll = games.container;
-- 		local layout = scroll.grid;

-- 		layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
-- 			scroll.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 4);
-- 		end);

-- 		do
-- 			local search = games.search;
-- 			local searchInput = games.searchInput;

-- 			local template = create("Frame", { 
-- 				BackgroundColor3 = Color3.fromHex("181818"), 
-- 				Name = "template",
-- 				Size = UDim2.new(0, 100, 0, 100)
-- 			}, {
-- 				create("UICorner", { 
-- 					CornerRadius = UDim.new(0, 4), 
-- 					Name = "corner"
-- 				}),
-- 				create("UIStroke", { 
-- 					ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
-- 					Color = Color3.fromHex("141414"), 
-- 					Name = "stroke", 
-- 					Thickness = 1.2
-- 				}),
-- 				create("ImageLabel", { 
-- 					AnchorPoint = Vector2.new(0.5, 0), 
-- 					BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 					BackgroundTransparency = 1, 
-- 					Image = "", 
-- 					Name = "icon", 
-- 					Position = UDim2.new(0.5, 0, 0, 0), 
-- 					Size = UDim2.new(1, 0, 1, -30)
-- 				}, {
-- 					create("UICorner", { 
-- 						CornerRadius = UDim.new(0, 5), 
-- 						Name = "corner"
-- 					})
-- 				}),
-- 				create("TextLabel", { 
-- 					AnchorPoint = Vector2.new(0.5, 0), 
-- 					BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 					BackgroundTransparency = 1, 
-- 					FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), 
-- 					FontSize = Enum.FontSize.Size12, 
-- 					Name = "title", 
-- 					Position = UDim2.new(0.5, 0, 0, 0), 
-- 					Size = UDim2.new(1, -16, 0, 24), 
-- 					Text = "", 
-- 					TextColor3 = Color3.fromHex("ebebeb"), 
-- 					TextSize = 12, 
-- 					TextStrokeColor3 = Color3.fromHex("0c0c0c"), 
-- 					TextStrokeTransparency = 0.25, 
-- 					TextTruncate = Enum.TextTruncate.AtEnd, 
-- 					TextXAlignment = Enum.TextXAlignment.Right
-- 				}),
-- 				create("TextButton", { 
-- 					AnchorPoint = Vector2.new(0.5, 1), 
-- 					AutoButtonColor = false, 
-- 					BackgroundColor3 = Color3.fromHex("303030"), 
-- 					BackgroundTransparency = 1, 
-- 					FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal), 
-- 					FontSize = Enum.FontSize.Size14, 
-- 					Name = "execute", 
-- 					Position = UDim2.new(0.5, 0, 1, -4), 
-- 					Size = UDim2.new(1, -8, 0, 22), 
-- 					Text = "", 
-- 					TextColor3 = Color3.fromHex("000000"), 
-- 					TextSize = 14
-- 				}, {
-- 					create("ImageLabel", { 
-- 						AnchorPoint = Vector2.new(1, 0.5), 
-- 						BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 						BackgroundTransparency = 1, 
-- 						Image = "rbxassetid://12778482262", 
-- 						Name = "icon", 
-- 						Position = UDim2.new(1, -2, 0.5, 0), 
-- 						Size = UDim2.new(0, 16, 0, 16)
-- 					}),
-- 					create("UICorner", { 
-- 						CornerRadius = UDim.new(0, 4), 
-- 						Name = "corner"
-- 					}),
-- 					create("TextLabel", { 
-- 						LanguageItem = {
-- 							property = "Text",
-- 							identifier = "Execute"
-- 						},
-- 						AnchorPoint = Vector2.new(0, 0.5), 
-- 						BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 						BackgroundTransparency = 1, 
-- 						FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal), 
-- 						FontSize = Enum.FontSize.Size12, 
-- 						Name = "title", 
-- 						Position = UDim2.new(0, 2, 0.5, 0), 
-- 						Size = UDim2.new(1, -30, 1, 0), 
-- 						TextColor3 = Color3.fromHex("ebebeb"), 
-- 						TextSize = 12, 
-- 						TextXAlignment = Enum.TextXAlignment.Left
-- 					})
-- 				})
-- 			});

-- 			local validExtensions = { "png", "jpg", "jpeg" };

-- 			local function sendRequest(query, method, headers, body)
-- 				local succ, res = pcall(_request, {
-- 					Url = query,
-- 					Method = method,
-- 					Headers = headers,
-- 					Body = body
-- 				});
-- 				if succ == false or res.Success == false then
-- 					return;
-- 				end
-- 				return res.Body;
-- 			end

-- 			local function setIcon(icon, path)
-- 				local fileName = urlEncode(httpService, path);
-- 				local ext = select(-1, unpack(string.split(fileName, "%2E")));
-- 				local res = sendRequest(path, "GET");
-- 				if res and icon.Parent.Parent == scroll then
-- 					local filePath = string.format("evonui/search/%s.%s", fileName, ext);
-- 					_writefile(filePath, res);
-- 					icon.Image = _getcustomasset(filePath);
-- 				end
-- 			end

-- 			local function addScript(title, icon, source)
-- 				local item = template:Clone();
-- 				item.title.Text = title;
-- 				item.Parent = scroll;

-- 				task.defer(setIcon, item.icon, icon);
-- 				addTransparencyHighlights(item.execute);

-- 				item.execute.MouseButton1Click:Connect(function()
-- 					runCode(source);
-- 				end);
-- 			end

-- 			local function calculateCellSize()
-- 				local absoluteSize = scroll.AbsoluteSize;
-- 				local sizeX = absoluteSize.X * 0.25 - 6;
-- 				local sizeY = 0;
-- 				for i = 5, 1, -1 do
-- 					local potentialValue = (absoluteSize.Y - (2 + 6 * (i - 1))) / i;
-- 					if sizeX and potentialValue > sizeX then
-- 						break;
-- 					end
-- 					sizeY = potentialValue;
-- 				end
-- 				layout.CellSize = UDim2.new(0.25, -6, 0, sizeY);
-- 			end

-- 			local isSearching = false;

-- 			local searchFunctions = {
-- 				ScriptBlox = function(query)
-- 					local res = sendRequest(string.format("https://scriptblox.com/api/script/search?q=%s&max=20&mode=free", query), "GET");
-- 					if res then
-- 						local scripts = jsonDecode(httpService, res).result.scripts;
-- 						for i = 1, #scripts do
-- 							local scriptResult = scripts[i];
-- 							if scriptResult.isPatched == false then
-- 								if string.sub(scriptResult.game.imageUrl, -4) == "webp" then
-- 									scriptResult.game.imageUrl = string.format("https://assetgame.roblox.com/Game/Tools/ThumbnailAsset.ashx?aid=%d&fmt=png&wd=1920&ht=1080", scriptResult.isUniversal and 4483381587 or scriptResult.game.gameId);
-- 								elseif string.sub(scriptResult.game.imageUrl, 1, 1) == "/" then
-- 									scriptResult.game.imageUrl = "https://scriptblox.com" .. scriptResult.game.imageUrl;
-- 								end
-- 								addScript(scriptResult.title, scriptResult.game.imageUrl, scriptResult.script);
-- 							end
-- 						end
-- 					end
-- 				end,
-- 				RScripts = function(query)
-- 					if rScriptsApiKey == "0" then
-- 						warn("RScripts API Key Not Supplied");
-- 						return;
-- 					end
				
-- 					local res = sendRequest(string.format("https://api.rscripts.net/search/basic/%s/views/desc/1/%s", query, rScriptsApiKey), "GET");
-- 					if res then
-- 						local scripts = jsonDecode(httpService, res).scripts;
-- 						if scripts then
-- 							for i = 1, #scripts do
-- 								local v = scripts[i];
-- 								if v.download then
-- 									addScript(v.title, v.image, string.format("loadstring(game:HttpGet(\"%s\", true))();", v.download));
-- 								end
-- 							end
-- 						end -- else they got no scripts lol
-- 					end
-- 				end
-- 			};

-- 			search.MouseButton1Click:Connect(function()
-- 				if isSearching == false then
-- 					isSearching = true;
-- 					local children = scroll:GetChildren();
-- 					for i = 1, #children do
-- 						local v = children[i];
-- 						if v:IsA("Frame") then
-- 							v:Destroy();
-- 						end
-- 					end
-- 					if _isfolder("evonui/search") == false then
-- 						_makefolder("evonui/search");
-- 					end
-- 					local files = _listfiles("evonui/search");
-- 					for i = 1, #files do
-- 						_delfile(files[i]);
-- 					end
-- 					calculateCellSize();
-- 					searchFunctions[uiSettings.searchAPI](urlEncode(httpService, searchInput.Text));
-- 					isSearching = false;
-- 				end
-- 			end);

-- 			resizeFunctions[#resizeFunctions + 1] = function()
-- 				search.Size = UDim2.new(0, search.TextBounds.X + 30, 0, 30);
-- 				searchInput.Size = UDim2.new(1, -(search.TextBounds.X + 54), 0, 30);
-- 			end
-- 		end
-- 	end

-- 	--[[ Console ]]--

-- 	do
-- 		local console = tabs.console;

-- 		local scroll = console.main.container;
-- 		local content = scroll.content;

-- 		do
-- 			local function getTextBounds(input)
-- 				return textService:GetTextSize(input, content.TextSize, content.Font, hugeVector2);
-- 			end

-- 			content:GetPropertyChangedSignal("Text"):Connect(function()
-- 				local input = content.Text;
-- 				local textBounds = getTextBounds(input);
-- 				scroll.CanvasSize = UDim2.new(0, textBounds.X, 0, math.min(textBounds.Y, maxLines * 11));
-- 			end);
-- 		end

-- 		do
-- 			local bottom = console.bottom;
-- 			local items = bottom:GetChildren();
-- 			for i = 1, #items do
-- 				local v = items[i];
-- 				if v:IsA("TextButton") then
-- 					addTransparencyHighlights(v);
-- 				end
-- 			end

-- 			local clearConsole = bottom.clearConsole;
-- 			local copyConsole = bottom.copyConsole;

-- 			clearConsole.MouseButton1Click:Connect(function()
-- 				content.Text = "";
-- 			end);

-- 			copyConsole.MouseButton1Click:Connect(function()
-- 				_setclipboard(content.Text);
-- 			end);

-- 			resizeFunctions[#resizeFunctions + 1] = function()
-- 				clearConsole.Size = UDim2.new(0, clearConsole.title.TextBounds.X + 36, 0, 22);
-- 				copyConsole.Size = UDim2.new(0, copyConsole.title.TextBounds.X + 36, 0, 22);
-- 			end
-- 		end

-- 		do
-- 			local typeToInfo = {
-- 				MessageOutput = {
-- 					colour = "#45cc57",
-- 					prefix = "Output"
-- 				},
-- 				MessageInfo = {
-- 					colour = "#2f6cd6",
-- 					prefix = "Info"
-- 				},
-- 				MessageWarning = {
-- 					colour = "#d49d37",
-- 					prefix = "Warning"
-- 				},
-- 				MessageError = {
-- 					colour = "#d44437",
-- 					prefix = "Error"
-- 				}
-- 			};

-- 			local function appendConsole(msg, msgType)
-- 				local info = typeToInfo[msgType.Name];
-- 				if info == nil then
-- 					return;
-- 				end
-- 				content.Text ..= (content.Text == "" and "​ ​ " or "\n") .. string.format("<font color=\"%s\">[%d:%s]</font> %s", info.colour, os.time(), info.prefix, msg);
-- 			end

-- 			game:GetService("LogService").MessageOut:Connect(appendConsole);

-- 			do
-- 				local lprint, linfo, lwarn, lerror = removeTrace("logprint"), removeTrace("loginfo"), removeTrace("logwarn"), removeTrace("logerror");

-- 				env.rconsoleprint = _newcclosure(function(msg)
-- 					appendConsole(msg, Enum.MessageType.MessageOutput);
-- 					lprint(msg);
-- 				end);

-- 				env.rconsoleinfo = _newcclosure(function(msg)
-- 					appendConsole(msg, Enum.MessageType.MessageInfo);
-- 					linfo(msg);
-- 				end);

-- 				env.rconsolewarn = _newcclosure(function(msg)
-- 					appendConsole(msg, Enum.MessageType.MessageWarning);
-- 					lwarn(msg);
-- 				end);

-- 				env.rconsoleerror = _newcclosure(function(msg)
-- 					appendConsole(msg, Enum.MessageType.MessageError);
-- 					lerror(msg);
-- 				end);

-- 				env.rconsoleclear = _newcclosure(function()
-- 					content.Text = "";
-- 				end);

-- 				env.rconsoleshow = _newcclosure(function()
-- 					if selectedTab ~= console then
-- 						selectTab("console");
-- 					end
-- 				end);

-- 				env.rconsolehide = _newcclosure(function()
-- 					if selectedTab == console then
-- 						selectTab("editor");
-- 					end
-- 				end);

-- 				env.rconsoletoggle = _newcclosure(function()
-- 					selectTab(selectedTab == console and "editor" or "console");
-- 				end);

-- 				env.rconsolehidden = _newcclosure(function()
-- 					return selectedTab ~= console;
-- 				end);
-- 			end
-- 		end
-- 	end

-- 	--[[ Settings ]]--

-- 	do
-- 		local _settings = tabs.settings;

-- 		do
-- 			local template = create("TextButton", { 
-- 				AutoButtonColor = false,
-- 				BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 				BackgroundTransparency = 1, 
-- 				Text = "",
-- 				Name = "languageExample", 
-- 				Size = UDim2.new(1, 0, 0, 30), 
-- 				ZIndex = 2
-- 			}, {
-- 				create("Frame", { 
-- 					BackgroundColor3 = Color3.fromHex("141414"), 
-- 					Name = "flagContainer", 
-- 					Size = UDim2.new(0, 40, 0, 30), 
-- 					ZIndex = 2
-- 				}, {
-- 					create("UIStroke", { 
-- 						ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
-- 						Color = Color3.fromHex("101010"), 
-- 						Name = "stroke", 
-- 						Thickness = 1.2
-- 					}),
-- 					create("UICorner", { 
-- 						CornerRadius = UDim.new(0, 4), 
-- 						Name = "corner"
-- 					}),
-- 					create("ImageLabel", { 
-- 						AnchorPoint = Vector2.new(0.5, 0.5), 
-- 						BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 						BackgroundTransparency = 1, 
-- 						Image = "", 
-- 						Name = "icon", 
-- 						Position = UDim2.new(0.5, 0, 0.5, 0), 
-- 						Size = UDim2.new(1, -8, 1, -6), 
-- 						ZIndex = 2
-- 					})
-- 				}),
-- 				create("TextLabel", { 
-- 					AnchorPoint = Vector2.new(1, 0.5), 
-- 					BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 					BackgroundTransparency = 1, 
-- 					FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal), 
-- 					FontSize = Enum.FontSize.Size11, 
-- 					Name = "title", 
-- 					Position = UDim2.new(1, 0, 0.5, 0), 
-- 					Size = UDim2.new(1, -50, 1, 0), 
-- 					Text = "", 
-- 					TextColor3 = Color3.fromHex("ebebeb"), 
-- 					TextSize = 11, 
-- 					TextXAlignment = Enum.TextXAlignment.Left, 
-- 					ZIndex = 2
-- 				})
-- 			});

-- 			local languages = _settings.left.languages;
-- 			local title = languages.title;

-- 			local drop = languages.drop;
-- 			local container = drop.container;

-- 			container.list:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
-- 				container.CanvasSize = UDim2.new(0, 0, 0, container.list.AbsoluteContentSize.Y + 2);			
-- 			end);

-- 			for i, v in next, sortedLanguageDatabase do
-- 				local clone = template:Clone();
-- 				clone.Name = v.key;
-- 				clone.title.Text = v.value.indicator;
-- 				clone.flagContainer.icon.Image = v.value.flag;

-- 				clone.MouseButton1Click:Connect(function()
-- 					title.Text = v.value.indicator;
-- 					updateSettings("language", v.key);
-- 				end);

-- 				clone.Parent = container;
-- 			end

-- 			do
-- 				local isOpen = false;

-- 				local function toggleDrop()
-- 					isOpen = not isOpen;
-- 					drop.Visible = isOpen;
-- 				end

-- 				title.MouseButton1Click:Connect(toggleDrop);
-- 				languages.indicator.MouseButton1Click:Connect(toggleDrop);
-- 			end
-- 		end

-- 		do
-- 			local template = create("TextButton", {
-- 				AutoButtonColor = false, 
-- 				BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 				BackgroundTransparency = 1, 
-- 				Name = "apiExample", 
-- 				Size = UDim2.new(1, 0, 0, 30), 
-- 				Text = "", 
-- 				ZIndex = 2
-- 			}, {
-- 				create("Frame", { 
-- 					BackgroundColor3 = Color3.fromHex("141414"), 
-- 					Name = "iconContainer", 
-- 					Size = UDim2.new(0, 30, 0, 30), 
-- 					ZIndex = 2
-- 				}, {
-- 					create("UIStroke", { 
-- 						ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
-- 						Color = Color3.fromHex("101010"), 
-- 						Name = "stroke", 
-- 						Thickness = 1.2
-- 					}),
-- 					create("UICorner", { 
-- 						CornerRadius = UDim.new(0, 4), 
-- 						Name = "corner"
-- 					}),
-- 					create("ImageLabel", { 
-- 						AnchorPoint = Vector2.new(0.5, 0.5), 
-- 						BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 						BackgroundTransparency = 1, 
-- 						Image = "", 
-- 						Name = "icon", 
-- 						Position = UDim2.new(0.5, 0, 0.5, 0), 
-- 						Size = UDim2.new(1, -6, 1, -6), 
-- 						ZIndex = 2
-- 					})
-- 				}),
-- 				create("TextLabel", { 
-- 					AnchorPoint = Vector2.new(1, 0.5), 
-- 					BackgroundColor3 = Color3.fromHex("ffffff"), 
-- 					BackgroundTransparency = 1, 
-- 					FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal), 
-- 					FontSize = Enum.FontSize.Size11, 
-- 					Name = "title", 
-- 					Position = UDim2.new(1, 0, 0.5, 0), 
-- 					Size = UDim2.new(1, -40, 1, 0), 
-- 					Text = "", 
-- 					TextColor3 = Color3.fromHex("ebebeb"), 
-- 					TextSize = 11, 
-- 					TextXAlignment = Enum.TextXAlignment.Left, 
-- 					ZIndex = 2
-- 				})
-- 			});

-- 			local scriptApi = _settings.right.scriptApi;
-- 			local title = scriptApi.title;

-- 			local drop = scriptApi.drop;
-- 			local container = drop.container;

-- 			for i, v in next, validSearchFunctions do
-- 				local clone = template:Clone();
-- 				clone.Name = i;
-- 				clone.title.Text = i;
-- 				clone.iconContainer.icon.Image = v;

-- 				clone.MouseButton1Click:Connect(function()
-- 					title.Text = i;
-- 					updateSettings("searchAPI", i);
-- 				end);

-- 				clone.Parent = container;
-- 			end

-- 			do
-- 				local isOpen = false;

-- 				local function toggleDrop()
-- 					isOpen = not isOpen;
-- 					drop.Visible = isOpen;
-- 				end

-- 				title.MouseButton1Click:Connect(toggleDrop);
-- 				scriptApi.indicator.MouseButton1Click:Connect(toggleDrop);
-- 			end
-- 		end

-- 		local function updateToggle(toggle, key, value)
-- 			tween(toggle.indicator.icon, 0.18, {
-- 				ImageTransparency = value and 0 or 1;
-- 			});
-- 			updateSettings(key, value);
-- 		end

-- 		do
-- 			local unlockFps = _settings.left.unlockFps;

-- 			local function run(state)
-- 				_setfpscap(state and (uiSettings.vSync and _getfpsmax() or uiSettings.fps) or 60);
-- 			end

-- 			unlockFps.MouseButton1Click:Connect(function()
-- 				local state = not uiSettings.unlockFps;
-- 				updateToggle(unlockFps, "unlockFps", state);
-- 				run(state);
-- 			end);

-- 			if uiSettings.unlockFps then
-- 				run(true);
-- 			end
-- 		end

-- 		do
-- 			local vSync = _settings.left.vSync;

-- 			local function run(state)
-- 				if uiSettings.unlockFps then
-- 					_setfpscap(state and _getfpsmax() or uiSettings.fps);
-- 				end
-- 			end

-- 			vSync.MouseButton1Click:Connect(function()
-- 				local state = not uiSettings.vSync;
-- 				updateToggle(vSync, "vSync", state);
-- 				run(state);
-- 			end);

-- 			if uiSettings.vSync then
-- 				run(true);
-- 			end
-- 		end

-- 		do
-- 			local fpsValue = _settings.left.fpsValue;

-- 			local container = fpsValue.container;
-- 			local indicator = container.indicator;

-- 			local function run(value)
-- 				tween(indicator, 0.18, {
-- 					Size = UDim2.new((value - 1) / 998, 0, 1, 0)
-- 				});
-- 				fpsValue.value.Text = tostring(value);
-- 				if uiSettings.unlockFps then
-- 					_setfpscap(value);
-- 				end
-- 			end

-- 			container.InputBegan:Connect(function(input)
-- 				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
-- 					local inputConn = userInputService.InputChanged:Connect(function(input)
-- 						if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
-- 							local value = math.clamp(math.round(1 + (998 * (input.Position.X - container.AbsolutePosition.X) / container.AbsoluteSize.X)), 1, 999);
-- 							uiSettings.fps = value;
-- 							run(value);
-- 						end
-- 					end);
-- 					local conn; conn = input.Changed:Connect(function()
-- 						if input.UserInputState == Enum.UserInputState.End then
-- 							inputConn:Disconnect();
-- 							conn:Disconnect();
-- 							updateSettings("fps", uiSettings.fps);
-- 						end
-- 					end);
-- 				end
-- 			end);

-- 			if uiSettings.fps ~= 60 then
-- 				run(uiSettings.fps);
-- 			end
-- 		end

-- 		do
-- 			local antiAfk = _settings.right.antiAfk;

-- 			local function run(state)
-- 				local conns = _getconnections(localPlayer.Idled);
-- 				for i = 1, #conns do
-- 					local v = conns[i];
-- 					if state then
-- 						v:Disable();
-- 					else
-- 						v:Enable();
-- 					end
-- 				end
-- 			end

-- 			antiAfk.MouseButton1Click:Connect(function()
-- 				local state = not uiSettings.antiAfk;
-- 				updateToggle(antiAfk, "antiAfk", state);
-- 				run(state);
-- 			end);

-- 			if uiSettings.antiAfk then
-- 				run(true);
-- 			end
-- 		end

-- 		do
-- 			local hopModeBtns = _settings.right.serverHopMode;
-- 			local selectedBtn = hopModeBtns[uiSettings.serverHopMode];

-- 			local function selectMode(btn)
-- 				if selectedBtn ~= btn then
-- 					tween(selectedBtn, 0.18, {
-- 						BackgroundColor3 = Color3.fromHex("181818");
-- 					});
-- 					selectedBtn = btn;
-- 					tween(btn, 0.18, {
-- 						BackgroundColor3 = Color3.fromHex("303030");
-- 					});
-- 					updateSettings("serverHopMode", btn.Name);
-- 				end
-- 			end

-- 			local buttonList = hopModeBtns:GetChildren();
-- 			for i = 1, #buttonList do
-- 				local v = buttonList[i];
-- 				if v:IsA("TextButton") then
-- 					v.MouseButton1Click:Connect(function()
-- 						selectMode(v);
-- 					end);
-- 				end
-- 			end
			
-- 			task.defer(function()
-- 				local data, count, total = {}, 0, 2;
-- 				for i = 1, #buttonList do
-- 					local v = buttonList[i];
-- 					if v:IsA("TextButton") then
-- 						count, total, data[v] = count + 1, total + v.TextBounds.X, v.TextBounds.X;
-- 					end
-- 				end
-- 				local suffix = (hopModeBtns.AbsoluteSize.X - (total + 8 * (count - 1))) / count;
-- 				for i, v in next, data do
-- 					i.Size = UDim2.new(0, v + suffix, 0, 28);
-- 				end
-- 			end);
-- 		end

-- 		do
-- 			local function teleport(jobId)
-- 				teleportService:TeleportToPlaceInstance(game.PlaceId, jobId);
-- 			end

-- 			local function serverHop()
-- 				local mode, jobId = uiSettings.serverHopMode, nil;
-- 				if mode == "bestPing" or mode == "random" then
-- 					local servers = {};
-- 					local cursor, count = "", 0;
-- 					repeat
-- 						local res = jsonDecode(httpService, game:HttpGetAsync(string.format("https://games.roblox.com/v1/games/%d/servers/0?&excludeFullGames=true&cursor=%s", game.PlaceId, cursor), true));
-- 						for i = 1, #res.data do
-- 							local v = res.data[i];
-- 							if v.id ~= game.JobId then
-- 								servers[#servers + 1] = v;
-- 							end
-- 						end
-- 						cursor = res.nextPageCursor;
-- 						count = count + 1;
-- 					until cursor == nil or count >= 25;
-- 					if mode == "Ping" then
-- 						table.sort(servers, function(a, b)
-- 							return a.ping < b.ping;
-- 						end);
-- 						jobId = servers[1] and servers[1].id;
-- 					else
-- 						jobId = servers[1] and servers[math.random(1, #servers)].id;
-- 					end
-- 				else
-- 					local res = jsonDecode(httpService, game:HttpGetAsync(string.format("https://games.roblox.com/v1/games/%d/servers/0?sortOrder=%d&excludeFullGames=true&limit=10", game.PlaceId, mode == "full" and 2 or 1), true));
-- 					for i = 1, #res.data do
-- 						local v = res.data[i];
-- 						if v.id ~= game.JobId then
-- 							jobId = v.id;
-- 							break;
-- 						end
-- 					end
-- 				end
-- 				if jobId then
-- 					teleport(jobId);
-- 				end
-- 			end

-- 			_settings.right.serverHop.hop.MouseButton1Click:Connect(serverHop);
-- 			_settings.right.serverHop.rejoin.MouseButton1Click:Connect(function()
-- 				teleport(game.JobId);
-- 			end);
-- 		end

-- 		task.defer(function()
-- 			_settings.left.CanvasSize = UDim2.new(0, 0, 0, _settings.left.list.AbsoluteContentSize.Y + 2);
-- 			_settings.right.CanvasSize = UDim2.new(0, 0, 0, _settings.right.list.AbsoluteContentSize.Y + 2);
-- 		end);
-- 	end

-- 	changeLanguage(uiSettings.language);
-- 	rconsoleprint("Evon-Android Successfully Loaded!");
-- end;

-- --[[ Load ]]--

-- loadKeyUI(loadMainUI);
-- end
