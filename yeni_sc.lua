-- Alperen Hub Universal Script
-- Script for enhancing player experience in Rayfield games

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local UIS = game:GetService("UserInputService")
local TeleportService = game:GetService("TeleportService")

-- Walk Speed
local function setWalkSpeed(speed)
    character.Humanoid.WalkSpeed = speed
end

-- Jump Power
local function setJumpPower(power)
    character.Humanoid.JumpPower = power
end

-- Noclip Functionality
local function noclip()
    while true do
        for _, v in pairs(character:GetChildren()) do
            if v:IsA("BasePart") then
                v.CanCollide = false
            end
        end
        wait(0.1)
    end
end

-- Teleportation Function to Locations
local function teleportTo(location)
    character.HumanoidRootPart.CFrame = location
end

-- Player Tracking Feature
local function trackPlayer(target)
    while true do
        if target and target.Character then
            local targetPos = target.Character.HumanoidRootPart.Position
            character.HumanoidRootPart.CFrame = CFrame.new(targetPos + Vector3.new(0, 5, 0))
        end
        wait(1)
    end
end

-- Example Usage:
setWalkSpeed(50) -- Set Walk Speed to 50
setJumpPower(100) -- Set Jump Power to 100
noclip() -- Enable Noclip

-- Example Teleportation to a specific CFrame (replace with your coordinates)
-- teleportTo(CFrame.new(0, 100, 0))

-- Example Track (Track the LocalPlayer)
-- trackPlayer(game.Players.LocalPlayer)
