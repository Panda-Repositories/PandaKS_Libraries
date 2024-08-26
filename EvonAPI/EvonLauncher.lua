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

-- ************************************************
-- [ Intentional Testing Development ]
-- ************************************************
local env = getgenv();
local function removeTrace(str)
	local x = env[str];
	-- env[str] = nil;
	return x;
end

local runCode = removeTrace("runcode");

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

	-- print("Hello world!")
	
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
		warn("Testing")
		textBox.Text = getclipboard() -- getclipboard()
	end)
	
	verifyKey.MouseButton1Click:Connect(function() 
		-- Panda Authentication Here
		script.Parent.Visible = false
		controls.Visible = true
	end)
	
	getKey.MouseButton1Click:Connect(function()
		-- setclipboard(pandaAuth:GetLink(service))
		print("Successfully Obtained Key")
        setclipboard(Generate_Key())
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
		print("Successfully Obtained Key")
        setclipboard(Generate_Key())
	end
	
	-- Connect the function to the button's MouseButton1Click event
	button.MouseButton1Click:Connect(GetKeyEvon)
	
end
coroutine.wrap(RVCNVIN_fake_script)()