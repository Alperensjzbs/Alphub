-- [[ ALPEREN ULTIMATE PVP SUITE v4 ]] --
-- Mimari: Universal Silent Aim + Hermanos Performance Engine
-- Özellikler: Prediction, HookMetamethod, Fast Attack, Anti-Stun, Full ESP

-- 1. PERFORMANS OPTİMİZASYONU (FPS BOOST)
local function Optimize()
    settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("BasePart") then
            v.Material = Enum.Material.SmoothPlastic
            v.Reflectance = 0
        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
            v.Enabled = false
        end
    end
end
pcall(Optimize)

-- 2. AYARLAR VE DEĞİŞKENLER
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local Settings = {
    Enabled = true,
    TeamCheck = true,
    VisibleCheck = true,
    TargetPart = "HumanoidRootPart",
    
    -- Silent Aim & Prediction (Evrensel Modül)
    HitChance = 100,
    PredictionAmount = 0.165, -- Hareketli hedefleri vurma hassasiyeti
    FOVRadius = 150,
    
    -- Combat & Movement
    FastAttackSpeed = 0.12,
    WalkSpeed = 38,
    JumpPower = 75,
    AntiStun = true
}

local Target = nil

-- 3. GÖRSEL ARAÇLAR (FOV VE TRACER)
local FovCircle = Drawing.new("Circle")
FovCircle.Thickness = 1
FovCircle.NumSides = 100
FovCircle.Radius = Settings.FOVRadius
FovCircle.Visible = true
FovCircle.Color = Color3.fromRGB(255, 255, 255)

local Tracer = Drawing.new("Line")
Tracer.Thickness = 2
Tracer.Color = Color3.fromRGB(255, 0, 0) -- Kırmızı Takip Çizgisi

-- 4. GELİŞMİŞ HEDEF SEÇİCİ (VISIBLE & TEAM CHECK)
local function GetClosestTarget()
    local nearest = nil
    local shortestDist = Settings.FOVRadius

    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild(Settings.TargetPart) then
            -- Müttefik ve Can Kontrolü
            if Settings.TeamCheck and p.Team == LocalPlayer.Team then continue end
            if p.Character.Humanoid.Health <= 0 then continue end
            
            -- Görünürlük Kontrolü (Visible Check)
            if Settings.VisibleCheck then
                local parts = Camera:GetPartsObscuringTarget({p.Character[Settings.TargetPart].Position}, {LocalPlayer.Character, p.Character})
                if #parts > 0 then continue end
            end

            local pos, onScreen = Camera:WorldToViewportPoint(p.Character[Settings.TargetPart].Position)
            if onScreen then
                local mousePos = UserInputService:GetMouseLocation()
                local dist = (Vector2.new(pos.X, pos.Y) - mousePos).Magnitude
                
                if dist < shortestDist then
                    shortestDist = dist
                    nearest = p
                end
            end
        end
    end
    return nearest
end

-- 5. SILENT AIM & PREDICTION (METAMETHOD HOOKING)
-- Mermilerin gidiş yönünü oyunun motoru seviyesinde değiştirir.
local OldNamecall
OldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
    local Method = getnamecallmethod()
    local Args = {...}
    
    if Settings.Enabled and not checkcaller() and (Method == "Raycast" or Method:find("PartOnRay")) then
        if Target and Target.Character then
            local HitPart = Target.Character[Settings.TargetPart]
            -- Prediction: Hedefin hızıyla mermi gidişini hesaplar
            local PredictedPos = HitPart.Position + (HitPart.Velocity * Settings.PredictionAmount)
            
            if Method == "Raycast" then
                Args[3] = (PredictedPos - Args[2]).Unit * 1000
            elseif Method:find("PartOnRay") then
                Args[2] = Ray.new(Args[2].Origin, (PredictedPos - Args[2].Origin).Unit * 1000)
            end
            return OldNamecall(self, unpack(Args))
        end
    end
    return OldNamecall(self, ...)
end)

-- 6. ANA DÖNGÜ (SPEED, ANTI-STUN, VISUALS)
RunService.RenderStepped:Connect(function()
    FovCircle.Position = UserInputService:GetMouseLocation()
    Target = GetClosestTarget()
    
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        local Hum = LocalPlayer.Character.Humanoid
        Hum.WalkSpeed = Settings.WalkSpeed
        Hum.JumpPower = Settings.JumpPower
        
        -- Anti-Stun Modülü
        if Settings.AntiStun then
            local s = LocalPlayer.Character:FindFirstChild("Stun") or LocalPlayer.Character:FindFirstChild("Busy")
            if s then s:Destroy() end
        end
    end

    -- Kırmızı Tracer Çizgisi
    if Target and Target.Character then
        local pos, onScreen = Camera:WorldToViewportPoint(Target.Character[Settings.TargetPart].Position)
        if onScreen then
            Tracer.Visible = true
            Tracer.From = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
            Tracer.To = Vector2.new(pos.X, pos.Y)
        else Tracer.Visible = false end
    else Tracer.Visible = false end
end)

-- 7. FAST ATTACK (COMBAT ENGINE)
task.spawn(function()
    while true do
        if Target and Target.Character then
            local d = (Target.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
            if d < 22 then
                -- Blox Fruits vuruş paketini optimize şekilde gönderir
                game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("Attack")
            end
        end
        task.wait(Settings.FastAttackSpeed)
    end
end)

-- 8. FULL PLAYER ESP (BENTO STYLE)
local function AddESP(p)
    p.CharacterAdded:Connect(function(char)
        task.wait(0.5)
        local bGui = Instance.new("BillboardGui", char:WaitForChild("Head"))
        bGui.Size = UDim2.new(0, 100, 0, 30)
        bGui.AlwaysOnTop = true
        
        local label = Instance.new("TextLabel", bGui)
        label.Size = UDim2.new(1, 0, 1, 0)
        label.BackgroundTransparency = 1
        label.Text = p.Name .. " | " .. math.floor(char.Humanoid.Health)
        label.TextColor3 = Color3.new(1, 1, 1)
        label.Font = Enum.Font.Code
        label.TextSize = 14
    end)
end
for _, p in pairs(Players:GetPlayers()) do if p ~= LocalPlayer then AddESP(p) end end
Players.PlayerAdded:Connect(AddESP)

print("Alperen Ultimate Suite v4 Loaded. Professional PvP Utility Active.")
