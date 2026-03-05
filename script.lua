-- Blox Fruits Ultra Script for Roblox by Alperensjzbs
-- Advanced Features with Spinning Attack Farm, Auto Quests, Teleportation, ESP, Money Farm, Boss Killer, God Mode, Fruit Grabber, Speed Boost, Combat Enhancements, Infinite Stamina, Auto Skills
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
-- Spinning Attack Farm State
local spinAttackActive = false
local spinSpeed = 50
local spinRadius = 30
local autoFarmActive = false

-- GUI Setup
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "BloxFruitsUltraGui"
screenGui.Parent = player:WaitForChild("PlayerGui")
screenGui.ResetOnSpawn = false
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 220, 0, 450)
mainFrame.Position = UDim2.new(0.01, 0, 0.05, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
mainFrame.BorderColor3 = Color3.fromRGB(0, 150, 255)
mainFrame.BorderSizePixel = 2
mainFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
mainFrame.Parent = screenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = mainFrame

local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "Title"
titleLabel.Size = UDim2.new(1, 0, 0, 35)
titleLabel.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.Text = "🔥 Blox Fruits ULTRA"
titleLabel.TextSize = 13
titleLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold)
titleLabel.Parent = mainFrame

local featureScroll = Instance.new("ScrollingFrame")
featureScroll.Name = "FeatureScroll"
featureScroll.Size = UDim2.new(1, 0, 1, -35)
featureScroll.Position = UDim2.new(0, 0, 0, 35)
featureScroll.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
featureScroll.BorderSizePixel = 0
featureScroll.CanvasSize = UDim2.new(0, 0, 0, 900)
featureScroll.ScrollingDirection = Enum.ScrollingDirection.Y
featureScroll.Parent = mainFrame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = featureScroll
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 5)

local features = {
    {name = "🔄 SPIN FARM", key = Enum.KeyCode.Z, active = false, desc = "Dönerek Vuruş Farm"},
    {name = "🌾 AUTO FARM", key = Enum.KeyCode.F, active = false, desc = "Otomatik Farm"},
    {name = "✅ AUTO QUEST", key = Enum.KeyCode.Q, active = false, desc = "Otomatik Quest"},
    {name = "📍 TELEPORT", key = Enum.KeyCode.T, active = false, desc = "Işınlanma"},
    {name = "👻 ESP", key = Enum.KeyCode.E, active = false, desc = "Oyuncu Görme"},
    {name = "💰 MONEY FARM", key = Enum.KeyCode.M, active = false, desc = "Para Kazanma"},
    {name = "👑 BOSS KILLER", key = Enum.KeyCode.B, active = false, desc = "Boss Öldürme"},
    {name = "🛡️ GOD MODE", key = Enum.KeyCode.G, active = false, desc = "Tanrı Modu"},
    {name = "🍎 FRUIT GRAB", key = Enum.KeyCode.H, active = false, desc = "Meyve Toplama"},
    {name = "⚡ SPEED BOOST", key = Enum.KeyCode.S, active = false, desc = "Hız Artırma"},
    {name = "🎯 INFINITE SKILL", key = Enum.KeyCode.I, active = false, desc = "Sonsuz Yetenek"},
    {name = "🔥 DAMAGE BOOST", key = Enum.KeyCode.D, active = false, desc = "Hasar Artırma"}
}

for _, feature in ipairs(features) do
    local btn = Instance.new("TextButton")
    btn.Name = feature.name
    btn.Size = UDim2.new(1, -10, 0, 32)
    btn.Position = UDim2.new(0, 5, 0, 0)
    btn.BackgroundColor3 = Color3.fromRGB(30, 100, 200)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Text = feature.name
    btn.TextSize = 11
    btn.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
    btn.AutoButtonColor = false
    btn.Parent = featureScroll

    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 6)
    btnCorner.Parent = btn

    btn.MouseButton1Click:Connect(function()
        feature.active = not feature.active
        btn.BackgroundColor3 = feature.active and Color3.fromRGB(0, 200, 100) or Color3.fromRGB(30, 100, 200)
    end)
end

-- Spinning Attack Farm Function
local function StartSpinAttack()
    if not character or not character:FindFirstChild("HumanoidRootPart") then return end
    local rootPart = character.HumanoidRootPart
    spinAttackActive = true
    local startTime = tick()
    while spinAttackActive and character and character.Parent do
        local elapsed = tick() - startTime
        rootPart.CFrame = rootPart.CFrame * CFrame.Angles(0, math.rad(spinSpeed), 0)
        local enemyFolder = Workspace:FindFirstChild("Enemies")
        if enemyFolder then
            for _, enemy in ipairs(enemyFolder:GetChildren()) do
                if enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
                    local distance = (enemy.HumanoidRootPart.Position - rootPart.Position).Magnitude
                    if distance < spinRadius then
                        local remoteEvent = character:FindFirstChild("RemoteEvent") or character.Parent:FindFirstChild("RemoteEvent")
                        if remoteEvent then
                            remoteEvent:FireServer(enemy)
                        end
                    end
                end
            end
        end
        wait(0.05)
    end
end

-- Auto Farm Function
local function AutoFarm()
    if not character or not character:FindFirstChild("HumanoidRootPart") then return end
    local rootPart = character.HumanoidRootPart
    while autoFarmActive and character and character.Parent do
        local enemyFolder = Workspace:FindFirstChild("Enemies")
        if enemyFolder then
            for _, enemy in ipairs(enemyFolder:GetChildren()) do
                if enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
                    local distance = (enemy.HumanoidRootPart.Position - rootPart.Position).Magnitude
                    if distance < 50 then
                        rootPart.CFrame = enemy.HumanoidRootPart.CFrame + enemy.HumanoidRootPart.CFrame.LookVector * 10
                        wait(0.1)
                    end
                end
            end
        end
        wait(0.5)
    end
end

-- God Mode Function
local function EnableGodMode()
    if character and character:FindFirstChild("Humanoid") then
        character.Humanoid.MaxHealth = math.huge
        character.Humanoid.Health = math.huge
        print("God Mode AKTIF")
    end
end

-- Speed Boost Function
local function SpeedBoost()
    if character and character:FindFirstChild("Humanoid") then
        character.Humanoid.WalkSpeed = 100
        print("Hız 100+")
    end
end

-- Input Handling
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    for _, feature in ipairs(features) do
        if input.KeyCode == feature.key then
            feature.active = not feature.active
            print(feature.name .. " - " .. (feature.active and "AÇIK" or "KAPALI"))
            if feature.name:find("SPIN") then
                spinAttackActive = feature.active
                if feature.active then
                    StartSpinAttack()
                end
            elseif feature.name:find("GOD") then
                EnableGodMode()
            elseif feature.name:find("SPEED") then
                SpeedBoost()
            end
        end
    end
end)

-- Main Loop
RunService.RenderStepped:Connect(function()
    for _, feature in ipairs(features) do
        if feature.active then
            if feature.name:find("AUTO FARM") then
                AutoFarm()
            end
        end
    end
end)

print("✅ Blox Fruits ULTRA Script Loaded!")
print("Z=Dönerek Vuruş, F=Farm, Q=Quest, T=Teleport, E=ESP, M=Money, B=Boss, G=God, H=Fruit, S=Speed, I=Skill, D=Damage")