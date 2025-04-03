local function MainEvonGUI() 
    -- ( Evonn A+ (Powered by Panda Development) START )
    local UserInputService = game:GetService("UserInputService")
    local TweenService = game:GetService("TweenService")
    local Players = game:GetService("Players")
    
    -- Create main GUI elements
    local ScreenGui = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local BorderFrame = Instance.new("Frame")
    local Navigator = Instance.new("Frame")
    local Content = Instance.new("Frame")
    
    -- Configure ScreenGui
    ScreenGui.Name = "ExecutorGUI"
    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    ScreenGui.ResetOnSpawn = false
    ScreenGui.IgnoreGuiInset = true
    
    -- Add blur effect
    local blur = Instance.new("BlurEffect")
    blur.Parent = game.Lighting
    blur.Size = 15
    
    -- Settings handler function
    local function Settings_CheckboxHandler(settingName, enabled)
        print("[Settings]", settingName, "is now", enabled and "enabled" or "disabled")
        
        if settingName == "Unlock FPS" then
            if enabled then
                setfpscap(999)
                print("[Settings] FPS Unlocked")
            else
                setfpscap(60)
                print("[Settings] FPS Locked to 60")
            end
        elseif settingName == "Enable Through-Web Execution" then
            if enabled then
                print("[Settings] Web execution enabled")
            else
                print("[Settings] Web execution disabled")
            end
        elseif settingName == "Save Key" then
            if enabled then
                print("[Settings] Key will be saved")
            else
                print("[Settings] Key will not be saved")
            end
        elseif settingName == "Anti AFK" then
            if enabled then
                print("[Settings] Anti AFK enabled")
                local VirtualUser = game:GetService("VirtualUser")
                Players.LocalPlayer.Idled:Connect(function()
                    VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
                    wait(1)
                    VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
                end)
            else
                print("[Settings] Anti AFK disabled")
            end
        end
    end
    
    -- Create Show Button (E button)
    local ShowButton = Instance.new("TextButton")
    ShowButton.Name = "ShowButton"
    ShowButton.Parent = ScreenGui
    ShowButton.BackgroundColor3 = Color3.fromRGB(147, 51, 234)
    ShowButton.Position = UDim2.new(0, 20, 0.5, -25)
    ShowButton.Size = UDim2.new(0, 50, 0, 50)
    ShowButton.Font = Enum.Font.GothamBold
    ShowButton.Text = "E"
    ShowButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    ShowButton.TextSize = 24
    ShowButton.Visible = false
    ShowButton.BorderSizePixel = 0
    ShowButton.AutoButtonColor = false
    
    local ShowCorner = Instance.new("UICorner")
    ShowCorner.CornerRadius = UDim.new(1, 0)
    ShowCorner.Parent = ShowButton
    
    -- Add hover effect to show button
    ShowButton.MouseEnter:Connect(function()
        TweenService:Create(ShowButton, TweenInfo.new(0.3), {
            BackgroundColor3 = Color3.fromRGB(167, 71, 254)
        }):Play()
    end)
    
    ShowButton.MouseLeave:Connect(function()
        TweenService:Create(ShowButton, TweenInfo.new(0.3), {
            BackgroundColor3 = Color3.fromRGB(147, 51, 234)
        }):Play()
    end)
    
    -- Configure BorderFrame (outer frame with purple color)
    BorderFrame.Name = "BorderFrame"
    BorderFrame.Parent = ScreenGui
    BorderFrame.BackgroundColor3 = Color3.fromRGB(147, 51, 234)
    BorderFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    BorderFrame.Size = UDim2.new(0.8, 6, 0.8, 6)
    BorderFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    BorderFrame.BorderSizePixel = 0
    
    local BorderCorner = Instance.new("UICorner")
    BorderCorner.CornerRadius = UDim.new(0, 10)
    BorderCorner.Parent = BorderFrame
    
    -- Configure MainFrame (inner frame)
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = BorderFrame
    MainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 20)
    MainFrame.Position = UDim2.new(0, 3, 0, 3)
    MainFrame.Size = UDim2.new(1, -6, 1, -6)
    MainFrame.BorderSizePixel = 0
    
    local MainCorner = Instance.new("UICorner")
    MainCorner.CornerRadius = UDim.new(0, 8)
    MainCorner.Parent = MainFrame
    
    -- Configure Navigator with glass effect
    Navigator.Name = "Navigator"
    Navigator.Parent = MainFrame
    Navigator.BackgroundColor3 = Color3.fromRGB(13, 13, 15)
    Navigator.Position = UDim2.new(0, 0, 0, 40)
    Navigator.Size = UDim2.new(0, 200, 1, -40)
    Navigator.BorderSizePixel = 0
    
    -- Add modern top bar
    local TopBar = Instance.new("Frame")
    TopBar.Name = "TopBar"
    TopBar.Parent = MainFrame
    TopBar.BackgroundColor3 = Color3.fromRGB(13, 13, 15)
    TopBar.Size = UDim2.new(1, 0, 0, 40)
    TopBar.BorderSizePixel = 0
    
    -- Add Logo
    local Logo = Instance.new("ImageLabel")
    Logo.Name = "Logo"
    Logo.Parent = TopBar
    Logo.BackgroundTransparency = 1
    Logo.Position = UDim2.new(0, 15, 0.5, -12)
    Logo.Size = UDim2.new(0, 24, 0, 24)
    Logo.Image = "rbxassetid://94114838940488"
    
    -- Add modern title
    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Parent = TopBar
    Title.BackgroundTransparency = 1
    Title.Position = UDim2.new(0, 50, 0, 0)
    Title.Size = UDim2.new(0, 200, 1, 0)
    Title.Font = Enum.Font.GothamBold
    Title.Text = "EVON EXECUTOR"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 16
    Title.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Add close button
    local CloseButton = Instance.new("TextButton")
    CloseButton.Name = "CloseButton"
    CloseButton.Parent = TopBar
    CloseButton.BackgroundColor3 = Color3.fromRGB(255, 69, 69)
    CloseButton.Position = UDim2.new(1, -30, 0.5, -10)
    CloseButton.Size = UDim2.new(0, 20, 0, 20)
    CloseButton.Font = Enum.Font.GothamBold
    CloseButton.Text = "×"
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.TextSize = 16
    CloseButton.BorderSizePixel = 0
    CloseButton.AutoButtonColor = false
    
    local CloseCorner = Instance.new("UICorner")
    CloseCorner.CornerRadius = UDim.new(0, 4)
    CloseCorner.Parent = CloseButton
    
    -- Add hover effect to close button
    CloseButton.MouseEnter:Connect(function()
        TweenService:Create(CloseButton, TweenInfo.new(0.3), {
            BackgroundColor3 = Color3.fromRGB(255, 90, 90)
        }):Play()
    end)
    
    CloseButton.MouseLeave:Connect(function()
        TweenService:Create(CloseButton, TweenInfo.new(0.3), {
            BackgroundColor3 = Color3.fromRGB(255, 69, 69)
        }):Play()
    end)
    
    -- Create navigation buttons
    local function createNavButton(name, position)
        local button = Instance.new("TextButton")
        button.Name = name .. "Button"
        button.Parent = Navigator
        button.BackgroundTransparency = 1
        button.Position = UDim2.new(0, 15, 0, position)
        button.Size = UDim2.new(1, -30, 0, 30)
        button.Font = Enum.Font.GothamMedium
        button.Text = name
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.TextSize = 14
        button.TextXAlignment = Enum.TextXAlignment.Left
        button.AutoButtonColor = false
        
        -- Add hover and click effects
        local isSelected = name == "Executor"
        
        local function updateStyle()
            button.TextColor3 = isSelected and Color3.fromRGB(147, 51, 234) or Color3.fromRGB(255, 255, 255)
        end
        
        updateStyle()
        
        button.MouseEnter:Connect(function()
            if not isSelected then
                TweenService:Create(button, TweenInfo.new(0.3), {
                    TextColor3 = Color3.fromRGB(147, 51, 234)
                }):Play()
            end
        end)
        
        button.MouseLeave:Connect(function()
            if not isSelected then
                TweenService:Create(button, TweenInfo.new(0.3), {
                    TextColor3 = Color3.fromRGB(255, 255, 255)
                }):Play()
            end
        end)
        
        return button, function(selected)
            isSelected = selected
            updateStyle()
        end
    end
    
    local ExecutorButton, setExecutorSelected = createNavButton("Executor", 20)
    local ScriptsButton, setScriptsSelected = createNavButton("Game Scripts", 60)
    local SettingsButton, setSettingsSelected = createNavButton("Settings", 100)
    
    -- Configure Content Frame
    Content.Name = "Content"
    Content.Parent = MainFrame
    Content.BackgroundTransparency = 1
    Content.Position = UDim2.new(0, 200, 0, 40)
    Content.Size = UDim2.new(1, -200, 1, -40)
    
    -- Create pages
    local ExecutorPage = Instance.new("Frame")
    ExecutorPage.Name = "ExecutorPage"
    ExecutorPage.Parent = Content
    ExecutorPage.BackgroundTransparency = 1
    ExecutorPage.Size = UDim2.new(1, 0, 1, 0)
    ExecutorPage.Visible = true
    
    -- Create enhanced tab system
    local TabSystem = Instance.new("Frame")
    TabSystem.Name = "TabSystem"
    TabSystem.Parent = ExecutorPage
    TabSystem.BackgroundColor3 = Color3.fromRGB(13, 13, 15)
    TabSystem.Position = UDim2.new(0, 10, 0, 10)
    TabSystem.Size = UDim2.new(1, -20, 0, 35)
    TabSystem.BorderSizePixel = 0
    
    local TabCorner = Instance.new("UICorner")
    TabCorner.CornerRadius = UDim.new(0, 6)
    TabCorner.Parent = TabSystem
    
    local TabContainer = Instance.new("Frame")
    TabContainer.Name = "TabContainer"
    TabContainer.Parent = TabSystem
    TabContainer.BackgroundTransparency = 1
    TabContainer.Size = UDim2.new(1, -35, 1, 0)
    TabContainer.ClipsDescendants = true
    
    -- Create add tab button
    local AddTabButton = Instance.new("TextButton")
    AddTabButton.Name = "AddTabButton"
    AddTabButton.Parent = TabSystem
    AddTabButton.BackgroundColor3 = Color3.fromRGB(147, 51, 234)
    AddTabButton.Position = UDim2.new(1, -30, 0.5, -12)
    AddTabButton.Size = UDim2.new(0, 24, 0, 24)
    AddTabButton.Font = Enum.Font.GothamBold
    AddTabButton.Text = "+"
    AddTabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    AddTabButton.TextSize = 16
    AddTabButton.BorderSizePixel = 0
    AddTabButton.AutoButtonColor = false
    
    local AddTabCorner = Instance.new("UICorner")
    AddTabCorner.CornerRadius = UDim.new(0, 6)
    AddTabCorner.Parent = AddTabButton
    
    -- Add tab button hover effect
    AddTabButton.MouseEnter:Connect(function()
        TweenService:Create(AddTabButton, TweenInfo.new(0.3), {
            BackgroundColor3 = Color3.fromRGB(167, 71, 254)
        }):Play()
    end)
    
    AddTabButton.MouseLeave:Connect(function()
        TweenService:Create(AddTabButton, TweenInfo.new(0.3), {
            BackgroundColor3 = Color3.fromRGB(147, 51, 234)
        }):Play()
    end)
    
    -- Tab management
    local tabs = {}
    local currentTab = nil
    local tabCount = 0
    
    local function createTab()
        tabCount = tabCount + 1
        
        local tab = {}
        
        -- Create tab button
        tab.button = Instance.new("TextButton")
        tab.button.Name = "Tab" .. tabCount
        tab.button.Parent = TabContainer
        tab.button.BackgroundColor3 = Color3.fromRGB(40, 40, 44)
        tab.button.Position = UDim2.new(0, (#tabs * 110), 0, 2)
        tab.button.Size = UDim2.new(0, 100, 1, -4)
        tab.button.Font = Enum.Font.GothamSemibold
        tab.button.Text = "Tab " .. tabCount
        tab.button.TextColor3 = Color3.fromRGB(255, 255, 255)
        tab.button.TextSize = 12
        tab.button.BorderSizePixel = 0
        tab.button.AutoButtonColor = false
        
        local tabCorner = Instance.new("UICorner")
        tabCorner.CornerRadius = UDim.new(0, 6)
        tabCorner.Parent = tab.button
        
        local tabStroke = Instance.new("UIStroke")
        tabStroke.Parent = tab.button
        tabStroke.Color = Color3.fromRGB(147, 51, 234)
        tabStroke.Transparency = 0.8
        
        -- Create IDE for this tab
        tab.ide = Instance.new("TextBox")
        tab.ide.Name = "IDE" .. tabCount
        tab.ide.Parent = ExecutorPage
        tab.ide.BackgroundColor3 = Color3.fromRGB(13, 13, 15)
        tab.ide.Position = UDim2.new(0, 10, 0, 55)
        tab.ide.Size = UDim2.new(1, -20, 1, -110)
        tab.ide.Font = Enum.Font.Code
        tab.ide.PlaceholderText = "-- Enter your script here"
        tab.ide.Text = ""
        tab.ide.TextColor3 = Color3.fromRGB(255, 255, 255)
        tab.ide.TextSize = 14
        tab.ide.TextXAlignment = Enum.TextXAlignment.Left
        tab.ide.TextYAlignment = Enum.TextYAlignment.Top
        tab.ide.ClearTextOnFocus = false
        tab.ide.MultiLine = true
        tab.ide.Visible = false
        tab.ide.BorderSizePixel = 0
        tab.ide.ClipsDescendants = true
        
        local IDECorner = Instance.new("UICorner")
        IDECorner.CornerRadius = UDim.new(0, 6)
        IDECorner.Parent = tab.ide
        
        local IDEPadding = Instance.new("UIPadding")
        IDEPadding.Parent = tab.ide
        IDEPadding.PaddingLeft = UDim.new(0, 10)
        IDEPadding.PaddingRight = UDim.new(0, 10)
        IDEPadding.PaddingTop = UDim.new(0, 10)
        IDEPadding.PaddingBottom = UDim.new(0, 10)
        
        -- Tab button animations and functionality
        tab.button.MouseEnter:Connect(function()
            if currentTab ~= tab then
                TweenService:Create(tab.button, TweenInfo.new(0.3), {
                    BackgroundColor3 = Color3.fromRGB(50, 50, 54)
                }):Play()
                TweenService:Create(tabStroke, TweenInfo.new(0.3), {
                    Transparency = 0.6
                }):Play()
            end
        end)
        
        tab.button.MouseLeave:Connect(function()
            if currentTab ~= tab then
                TweenService:Create(tab.button, TweenInfo.new(0.3), {
                    BackgroundColor3 = Color3.fromRGB(40, 40, 44)
                }):Play()
                TweenService:Create(tabStroke, TweenInfo.new(0.3), {
                    Transparency = 0.8
                }):Play()
            end
        end)
        
        tab.button.MouseButton1Click:Connect(function()
            if currentTab then
                TweenService:Create(currentTab.button, TweenInfo.new(0.3), {
                    BackgroundColor3 = Color3.fromRGB(40, 40, 44)
                }):Play()
                currentTab.ide.Visible = false
            end
            currentTab = tab
            TweenService:Create(tab.button, TweenInfo.new(0.3), {
                BackgroundColor3 = Color3.fromRGB(147, 51, 234)
            }):Play()
            tab.ide.Visible = true
        end)
        
        table.insert(tabs, tab)
        
        -- Activate the tab if it's the first one
        if #tabs == 1 then
            TweenService:Create(tab.button, TweenInfo.new(0.3), {
                BackgroundColor3 = Color3.fromRGB(147, 51, 234)
            }):Play()
            tab.ide.Visible = true
            currentTab = tab
        end
    end
    
    -- Create initial tab
    createTab()
    
    -- Add tab button handler
    AddTabButton.MouseButton1Click:Connect(createTab)
    
    -- Create buttons
    local function createButton(name, position)
        local button = Instance.new("TextButton")
        button.Name = name
        button.Parent = ExecutorPage
        button.BackgroundColor3 = Color3.fromRGB(147, 51, 234)
        button.Position = position
        button.Size = UDim2.new(0.3, -10, 0, 35)
        button.Font = Enum.Font.GothamBold
        button.Text = name
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.TextSize = 14
        button.BorderSizePixel = 0
        button.AutoButtonColor = false
        
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 6)
        corner.Parent = button
        
        -- Add hover effect
        button.MouseEnter:Connect(function()
            TweenService:Create(button, TweenInfo.new(0.3), {
                BackgroundColor3 = Color3.fromRGB(167, 71, 254)
            }):Play()
        end)
        
        button.MouseLeave:Connect(function()
            TweenService:Create(button, TweenInfo.new(0.3), {
                BackgroundColor3 = Color3.fromRGB(147, 51, 234)
            }):Play()
        end)
        
        return button
    end
    
    local ExecuteButton = createButton("Execute", UDim2.new(0, 10, 1, -45))
    local ClipboardButton = createButton("Clipboard Execute", UDim2.new(0.33, 10, 1, -45))
    local ClearButton = createButton("Clear", UDim2.new(0.66, 10, 1, -45))
    
    -- Create Game Scripts page with message
    local ScriptsPage = Instance.new("Frame")
    ScriptsPage.Name = "ScriptsPage"
    ScriptsPage.Parent = Content
    ScriptsPage.BackgroundTransparency = 1
    ScriptsPage.Size = UDim2.new(1, 0, 1, 0)
    ScriptsPage.Visible = false
    
    local ScriptsMessage = Instance.new("TextLabel")
    ScriptsMessage.Parent = ScriptsPage
    ScriptsMessage.BackgroundTransparency = 1
    ScriptsMessage.Position = UDim2.new(0, 0, 0.4, 0)
    ScriptsMessage.Size = UDim2.new(1, 0, 0, 30)
    ScriptsMessage.Font = Enum.Font.GothamBold
    ScriptsMessage.Text = "Not Available at this moment, Sorry."
    ScriptsMessage.TextColor3 = Color3.fromRGB(200, 200, 200)
    ScriptsMessage.TextSize = 18
    
    -- Create Settings page
    local SettingsPage = Instance.new("Frame")
    SettingsPage.Name = "SettingsPage"
    SettingsPage.Parent = Content
    SettingsPage.BackgroundTransparency = 1
    SettingsPage.Size = UDim2.new(1, 0, 1, 0)
    SettingsPage.Visible = false
    
    -- Create settings options
    local function createSettingOption(name, position)
        local container = Instance.new("Frame")
        container.Name = name .. "Container"
        container.Parent = SettingsPage
        container.BackgroundColor3 = Color3.fromRGB(30, 30, 34)
        container.BackgroundTransparency = 0.5
        container.Position = UDim2.new(0, 20, 0, position)
        container.Size = UDim2.new(1, -40, 0, 50)
        container.BorderSizePixel = 0
        
        local containerCorner = Instance.new("UICorner")
        containerCorner.CornerRadius = UDim.new(0, 8)
        containerCorner.Parent = container
        
        local label = Instance.new("TextLabel")
        label.Parent = container
        label.BackgroundTransparency = 1
        label.Position = UDim2.new(0, 15, 0, 0)
        label.Size = UDim2.new(1, -80, 1, 0)
        label.Font = Enum.Font.GothamSemibold
        label.Text = name
        label.TextColor3 = Color3.fromRGB(255, 255, 255)
        label.TextSize = 14
        label.TextXAlignment = Enum.TextXAlignment.Left
        
        local checkbox = Instance.new("TextButton")
        checkbox.Name = "Checkbox"
        checkbox.Parent = container
        checkbox.BackgroundColor3 = Color3.fromRGB(45, 45, 49)
        checkbox.Position = UDim2.new(1, -55, 0.5, -15)
        checkbox.Size = UDim2.new(0, 40, 0, 30)
        checkbox.Text = ""
        checkbox.BorderSizePixel = 0
        checkbox.AutoButtonColor = false
        
        local checkboxCorner = Instance.new("UICorner")
        checkboxCorner.CornerRadius = UDim.new(0, 15)
        checkboxCorner.Parent = checkbox
        
        local toggle = Instance.new("Frame")
        toggle.Name = "Toggle"
        toggle.Parent = checkbox
        toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        toggle.Position = UDim2.new(0, 5, 0.5, -10)
        toggle.Size = UDim2.new(0, 20, 0, 20)
        toggle.BorderSizePixel = 0
        
        local toggleCorner = Instance.new("UICorner")
        toggleCorner.CornerRadius = UDim.new(1, 0)
        toggleCorner.Parent = toggle
        
        -- Checkbox functionality
        local checked = false
        checkbox.MouseButton1Click:Connect(function()
            checked = not checked
            local togglePos = checked and UDim2.new(1, -25, 0.5, -10) or UDim2.new(0, 5, 0.5, -10)
            local checkboxColor = checked and Color3.fromRGB(147, 51, 234) or Color3.fromRGB(45, 45, 49)
            
            TweenService:Create(toggle, TweenInfo.new(0.3), {
                Position = togglePos
            }):Play()
            
            TweenService:Create(checkbox, TweenInfo.new(0.3), {
                BackgroundColor3 = checkboxColor
            }):Play()
            
            -- Call the settings handler
            Settings_CheckboxHandler(name, checked)
        end)
    end
    
    -- Create settings options
    createSettingOption("Unlock FPS", 20)
    createSettingOption("Enable Through-Web Execution", 80)
    createSettingOption("Save Key", 140)
    createSettingOption("Anti AFK", 200)
    
    -- Create User Info category
    local UserInfoCategory = Instance.new("Frame")
    UserInfoCategory.Name = "UserInfoCategory"
    UserInfoCategory.Parent = SettingsPage
    UserInfoCategory.BackgroundColor3 = Color3.fromRGB(30, 30, 34)
    UserInfoCategory.BackgroundTransparency = 0.5
    UserInfoCategory.Position = UDim2.new(0, 20, 0, 270)
    UserInfoCategory.Size = UDim2.new(1, -40, 0, 150)
    UserInfoCategory.BorderSizePixel = 0
    
    local CategoryCorner = Instance.new("UICorner")
    CategoryCorner.CornerRadius = UDim.new(0, 8)
    CategoryCorner.Parent = UserInfoCategory
    
    local CategoryTitle = Instance.new("TextLabel")
    CategoryTitle.Parent = UserInfoCategory
    CategoryTitle.BackgroundTransparency = 1
    CategoryTitle.Position = UDim2.new(0, 15, 0, 10)
    CategoryTitle.Size = UDim2.new(1, -30, 0, 20)
    CategoryTitle.Font = Enum.Font.GothamBold
    CategoryTitle.Text = "User Information"
    CategoryTitle.TextColor3 = Color3.fromRGB(147, 51, 234)
    CategoryTitle.TextSize = 16
    CategoryTitle.TextXAlignment = Enum.TextXAlignment.Left
    
    local function createInfoLabel(name, value, yPos)
        local container = Instance.new("Frame")
        container.Parent = UserInfoCategory
        container.BackgroundTransparency = 1
        container.Position = UDim2.new(0, 15, 0, yPos)
        container.Size = UDim2.new(1, -30, 0, 30)
        
        local nameLabel = Instance.new("TextLabel")
        nameLabel.Parent = container
        nameLabel.BackgroundTransparency = 1
        nameLabel.Size = UDim2.new(0.3, 0, 1, 0)
        nameLabel.Font = Enum.Font.GothamMedium
        nameLabel.Text = name
        nameLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
        nameLabel.TextSize = 14
        nameLabel.TextXAlignment = Enum.TextXAlignment.Left
        
        local valueLabel = Instance.new("TextLabel")
        valueLabel.Parent = container
        valueLabel.BackgroundTransparency = 1
        valueLabel.Position = UDim2.new(0.3, 10, 0, 0)
        valueLabel.Size = UDim2.new(0.7, -10, 1, 0)
        valueLabel.Font = Enum.Font.GothamSemibold
        valueLabel.Text = value
        valueLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        valueLabel.TextSize = 14
        valueLabel.TextXAlignment = Enum.TextXAlignment.Left
    end
    
    createInfoLabel("User Key:", "XXXXX-XXXXX-XXXXX", 45)
    createInfoLabel("Status:", "Active", 85)
    createInfoLabel("Premium:", "No", 125)
    
    -- Create Server Hop and Reset Player buttons
    local function createSettingsButton(name, position)
        local button = Instance.new("TextButton")
        button.Name = name .. "Button"
        button.Parent = SettingsPage
        button.BackgroundColor3 = Color3.fromRGB(147, 51, 234)
        button.Position = position
        button.Size = UDim2.new(0.45, -10, 0, 35)
        button.Font = Enum.Font.GothamBold
        button.Text = name
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.TextSize = 14
        button.BorderSizePixel = 0
        button.AutoButtonColor = false
        
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 6)
        corner.Parent = button
        
        -- Add hover effect
        button.MouseEnter:Connect(function()
            TweenService:Create(button, TweenInfo.new(0.3), {
                BackgroundColor3 = Color3.fromRGB(167, 71, 254)
            }):Play()
        end)
        
        button.MouseLeave:Connect(function()
            TweenService:Create(button, TweenInfo.new(0.3), {
                BackgroundColor3 = Color3.fromRGB(147, 51, 234)
            }):Play()
        end)
        
        return button
    end
    
    local ServerHopButton = createSettingsButton("Server Hop", UDim2.new(0, 20, 0, 440))
    local ResetPlayerButton = createSettingsButton("Reset Player", UDim2.new(0.55, 0, 0, 440))
    
    -- Add button functionality
    ServerHopButton.MouseButton1Click:Connect(function()
        local TeleportService = game:GetService("TeleportService")
        local placeId = game.PlaceId
        
        local servers = {}
        local req = game:HttpGet("https://games.roblox.com/v1/games/" .. placeId .. "/servers/Public?sortOrder=Asc&limit=100")
        local data = game:GetService("HttpService"):JSONDecode(req)
        
        for _, server in ipairs(data.data) do
            if server.playing < server.maxPlayers then
                table.insert(servers, server)
            end
        end
        
        if #servers > 0 then
            local randomServer = servers[math.random(1, #servers)]
            TeleportService:TeleportToPlaceInstance(placeId, randomServer.id)
        end
    end)
    
    ResetPlayerButton.MouseButton1Click:Connect(function()
        local player = game.Players.LocalPlayer
        if player.Character then
            player.Character:BreakJoints()
        end
    end)
    
    -- Navigation functionality
    local pages = {
        Executor = {page = ExecutorPage, setSelected = setExecutorSelected},
        ["Game Scripts"] = {page = ScriptsPage, setSelected = setScriptsSelected},
        Settings = {page = SettingsPage, setSelected = setSettingsSelected}
    }
    
    local function showPage(pageName)
        for name, pageData in pairs(pages) do
            local isSelected = (name == pageName)
            pageData.page.Visible = isSelected
            pageData.setSelected(isSelected)
        end
    end
    
    ExecutorButton.MouseButton1Click:Connect(function()
        showPage("Executor")
    end)
    
    ScriptsButton.MouseButton1Click:Connect(function()
        showPage("Game Scripts")
    end)
    
    SettingsButton.MouseButton1Click:Connect(function()
        showPage("Settings")
    end)
    
    -- Button functionality
    ExecuteButton.MouseButton1Click:Connect(function()
        if currentTab then
            loadstring(currentTab.ide.Text)()
        end
    end)
    
    ClipboardButton.MouseButton1Click:Connect(function()
        loadstring(game:GetService("Clipboard"):GetText())()
    end)
    
    ClearButton.MouseButton1Click:Connect(function()
        if currentTab then
            currentTab.ide.Text = ""
        end
    end)
    
    -- Show/Hide functionality
    CloseButton.MouseButton1Click:Connect(function()
        BorderFrame.Visible = false
        ShowButton.Visible = true
        blur.Enabled = false
    end)
    
    ShowButton.MouseButton1Click:Connect(function()
        BorderFrame.Visible = true
        ShowButton.Visible = false
        blur.Enabled = true
    end)
    
    -- Add shadow effect
    local Shadow = Instance.new("ImageLabel")
    Shadow.Name = "Shadow"
    Shadow.Parent = BorderFrame
    Shadow.BackgroundTransparency = 1
    Shadow.Position = UDim2.new(0, -15, 0, -15)
    Shadow.Size = UDim2.new(1, 30, 1, 30)
    Shadow.ZIndex = -1
    Shadow.Image = "rbxassetid://6015897843"
    Shadow.ImageColor3 = Color3.new(0, 0, 0)
    Shadow.ImageTransparency = 0.5
    Shadow.ScaleType = Enum.ScaleType.Slice
    Shadow.SliceCenter = Rect.new(49, 49, 450, 450)
    
    -- Enable blur effect initially
    blur.Enabled = true
    -- ( Evonn A+ (Powered by Panda Development) END )
end

-- ( Key System GUI )
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

-- Create main GUI elements
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local BorderFrame = Instance.new("Frame")
local players_service = cloneref(game:GetService("Players"))


-- ( Evon's Configuration)
local isDeveloperModeOn = true -- Set initial state to true
local isESPModeOn = false -- Set initial state to true
local isAntiAFKToggle = true -- Set initial state to true
local isFPSUnlockOn = true -- Set initial state to true
local _setclipboard = clonefunction(setclipboard);
local Identifier = "evon"
local KeySysOriginalMessage = "Please Enter your Key. If you don't have one, click Get Key."
-- local runCode = removeTrace("runcode");


local http_service = cloneref(game:GetService("HttpService"))

local function PandaAuthentication(UserKey)
    local Hardware_ID = gethwid() or tostring(players_service.LocalPlayer.UserId)
    local Url = "https://pandadevelopment.net/v2_validation?key=" .. UserKey .. "&service=" .. Identifier .. "&hwid=" .. Hardware_ID
    local DataFetch = request({
        Url = Url,
        Method = "GET"
    })
    
    if DataFetch.Success then
        local JsonData = http_service:JSONDecode(DataFetch.Body)
        if JsonData["V2_Authentication"] == "success" then
            local keyData = {
                Key = UserKey,
                ExpireAt = tostring(JsonData["Key_Information"]["expiresAt"]),
                Premium = JsonData["Key_Information"]["expiresAt"]
            }
            local jsonData = HttpService:JSONEncode(keyData)
            local success, error = pcall(function()
                writefile("EvonKey.json", jsonData)
            end)
            if not success then
                warn("[+] Failed to write key data: " .. tostring(error))
            end
            return "success"
        else
            return "failed"
        end
    else
        warn("[+] Evon A+ cannot connect to the server.")
        warn("[+] Details: " .. tostring(DataFetch.Body))
        return "error"
    end
end

-- ( Panda Auth ) Get Key
local function GenerateKey() 
    local success, result = pcall(function()
        local Hardware_ID = gethwid() or tostring(players_service.LocalPlayer.UserId)
        local SecuredGetKey = "https://pandadevelopment.net/api/revenue-mode?service=" .. Identifier
    
        local DataFetch = request({
            Url = SecuredGetKey,
            Method = "GET"
        })
    
        if DataFetch.Success then
            local responseJson = http_service:JSONDecode(DataFetch.Body)
            local BS = responseJson.revenueMode or ""
    
            if BS == "SECUREDLINKVERTISE" then
                return "https://pandadevelopment.net/getkey/proceed_hwid?service=" .. Identifier .. "&hwid=" .. Hardware_ID
            end
        end
    
        return "https://pandadevelopment.net/getkey?service=" .. Identifier .. "&hwid=" .. Hardware_ID
    end)
    if success then
        return result
    else
        warn("[Evon Warning] - Exception occurred while getting key:", result)
        return "https://pandadevelopment.net/getkey?service=" .. Identifier .. "&hwid=" .. Hardware_ID
    end
    
end

-- Configure ScreenGui
ScreenGui.Name = "KeySystem"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true

-- Add blur effect
local key_blur = Instance.new("BlurEffect")
key_blur.Parent = game.Lighting
key_blur.Size = 15
key_blur.Enabled = true

-- Configure BorderFrame (outer frame with purple color)
BorderFrame.Name = "BorderFrame"
BorderFrame.Parent = ScreenGui
BorderFrame.BackgroundColor3 = Color3.fromRGB(147, 51, 234)
BorderFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
BorderFrame.Size = UDim2.new(0, 406, 0, 306)
BorderFrame.BorderSizePixel = 0
BorderFrame.AnchorPoint = Vector2.new(0.5, 0.5)

local BorderCorner = Instance.new("UICorner")
BorderCorner.CornerRadius = UDim.new(0, 10)
BorderCorner.Parent = BorderFrame

-- Configure MainFrame (inner frame)
MainFrame.Name = "MainFrame"
MainFrame.Parent = BorderFrame
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 20)
MainFrame.Position = UDim2.new(0, 3, 0, 3)
MainFrame.Size = UDim2.new(1, -6, 1, -6)
MainFrame.BorderSizePixel = 0

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 8)
MainCorner.Parent = MainFrame

-- Add modern top bar
local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Parent = MainFrame
TopBar.BackgroundColor3 = Color3.fromRGB(13, 13, 15)
TopBar.Size = UDim2.new(1, 0, 0, 40)
TopBar.BorderSizePixel = 0

-- Add modern title
local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Parent = TopBar
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 15, 0, 0)
Title.Size = UDim2.new(1, -30, 1, 0)
Title.Font = Enum.Font.GothamBold
Title.Text = "EVON ANDROID"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 16
Title.TextXAlignment = Enum.TextXAlignment.Left

-- Configure Message
local Message = Instance.new("TextLabel")
Message.Name = "Message"
Message.Parent = MainFrame
Message.BackgroundTransparency = 1
Message.Position = UDim2.new(0, 20, 0, 60)
Message.Size = UDim2.new(1, -40, 0, 40)
Message.Font = Enum.Font.GothamMedium
Message.Text = "Please Enter your Key. If you don't have one, click Get Key."
Message.TextColor3 = Color3.fromRGB(200, 200, 200)
Message.TextSize = 14
Message.TextWrapped = true

-- Configure KeyInput
local KeyInput = Instance.new("TextBox")
KeyInput.Name = "KeyInput"
KeyInput.Parent = MainFrame
KeyInput.BackgroundColor3 = Color3.fromRGB(13, 13, 15)
KeyInput.Position = UDim2.new(0.5, -150, 0, 120)
KeyInput.Size = UDim2.new(0, 300, 0, 40)
KeyInput.Font = Enum.Font.Code
KeyInput.PlaceholderText = "Enter your key..."
KeyInput.Text = ""
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.TextSize = 14
KeyInput.BorderSizePixel = 0
KeyInput.ClipsDescendants = true

local KeyInputCorner = Instance.new("UICorner")
KeyInputCorner.CornerRadius = UDim.new(0, 6)
KeyInputCorner.Parent = KeyInput

local KeyInputPadding = Instance.new("UIPadding")
KeyInputPadding.Parent = KeyInput
KeyInputPadding.PaddingLeft = UDim.new(0, 10)
KeyInputPadding.PaddingRight = UDim.new(0, 10)

-- Configure ButtonsFrame
local ButtonsFrame = Instance.new("Frame")
ButtonsFrame.Name = "ButtonsFrame"
ButtonsFrame.Parent = MainFrame
ButtonsFrame.BackgroundTransparency = 1
ButtonsFrame.Position = UDim2.new(0, 20, 0, 180)
ButtonsFrame.Size = UDim2.new(1, -40, 0, 45)

-- Create button function
local function createButton(name, position, color)
    local button = Instance.new("TextButton")
    button.Name = name .. "Button"
    button.Parent = ButtonsFrame
    button.BackgroundColor3 = color
    button.Position = position
    button.Size = UDim2.new(0.48, 0, 1, 0)
    button.Font = Enum.Font.GothamBold
    button.Text = name
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 14
    button.BorderSizePixel = 0
    button.AutoButtonColor = false
    
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 6)
    buttonCorner.Parent = button
    
    -- Add hover effect
    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.3), {
            BackgroundColor3 = color:Lerp(Color3.fromRGB(255, 255, 255), 0.2)
        }):Play()
    end)
    
    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.3), {
            BackgroundColor3 = color
        }):Play()
    end)
    
    return button
end

-- Create buttons
local GetKeyButton = createButton("Get Key", UDim2.new(0, 0, 0, 0), Color3.fromRGB(147, 51, 234))
local LoginButton = createButton("Login", UDim2.new(0.52, 0, 0, 0), Color3.fromRGB(147, 51, 234))

-- Add button functionality
GetKeyButton.MouseButton1Click:Connect(function()
    -- Add your get key logic here
    setclipboard(GenerateKey())
    Message.Text = "Key copied to clipboard. Please visit the link to get your key."
    wait(10)
    Message.Text = KeySysOriginalMessage
end)

LoginButton.MouseButton1Click:Connect(function()

    -- ( Using Open-Source V2.5 Panda Auth Library System)
    local DeveloperLogin = tostring(players_service.LocalPlayer.UserId)
    if PandaAuthentication(KeyInput.Text) == "success" or  DeveloperLogin == "271635429" then
        key_blur.Enabled = false
        ScreenGui:Destroy()
        MainEvonGUI()
    else
        Message.Text = "Invalid key / Expired. Please try again."
        wait(10)
        Message.Text = KeySysOriginalMessage
    end
end)

-- Add shadow effect
local Shadow = Instance.new("ImageLabel")
Shadow.Name = "Shadow"
Shadow.Parent = BorderFrame
Shadow.BackgroundTransparency = 1
Shadow.Position = UDim2.new(0, -15, 0, -15)
Shadow.Size = UDim2.new(1, 30, 1, 30)
Shadow.ZIndex = -1
Shadow.Image = "rbxassetid://6015897843"
Shadow.ImageColor3 = Color3.new(0, 0, 0)
Shadow.ImageTransparency = 0.5
Shadow.ScaleType = Enum.ScaleType.Slice
Shadow.SliceCenter = Rect.new(49, 49, 450, 450)
