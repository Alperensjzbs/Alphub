--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🎫 Admin Panel",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Rayfield Interface Suite",
   LoadingSubtitle = "by Sirius",
   Theme = "Default", -- Check https://[Log in to view URL]

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Admin Hub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "Visit https://loot-link.com/s?WJtTfb3X for your key, (SAVES FOREVER) ", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"orange", "greengrass", "helloworld!", "script101", "acceptmein", "(updates every 3 days)"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local MainTab = Window:CreateTab("🙏 OP Stuff", nil) -- Title, Image
local MainSection = MainTab:CreateSection("Main")

Rayfield:Notify({
   Title = "Execution Succesful!",
   Content = "Admin has been loaded into your screen, and will work.",
   Duration = 5,
   Image = nil,
})

local Button = Tab:CreateButton({
   Name = "Infinite Jump",
   Callback = function()
--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
local InfiniteJumpEnabled = true
game:GetService("UserInputService").JumpRequest:connect(function()
	if InfiniteJumpEnabled then
		game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
	end
end)
   end,
})

local Slider = MainTab:CreateSlider({
   Name = "Walkspeed",
   Range = {0, 300},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        game.Players.LocalPlayer.Characters.Humanoid.WalkSpeed = (Value)
   end,
})

local Dropdown = MainTab:CreateDropdown({
   Name = "Random Teleports",
   Options = {"Teleport1","Teleport2"},
   CurrentOption = {"None"},
   MultipleOptions = false,
   Flag = "RandomTps", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Options)
   print("GBI - Loading Up The GBI for Roblox Executors, player.")
   end,
}}

local TeleportTab = Window:CreateTab("💀 Trolls", nil) -- Title, Image
local Section = TeleportTab:CreateSection("Prints, (teleport prints) ")

local Button = TeleportTab:CreateButton({
   Name = "Print in console: im in your walls",
             print('im in your walls')
   -- The function that takes place when the button is pressed
   end,
})

local Button = TeleportTab:CreateButton({
   Name = "Print in console: leave the game or I bomb",
             print('leave the game or I bomb')
   -- The function that takes place when the button is pressed
   end,
})

local Button = TeleportTab:CreateButton({
   Name = "Print in console: Builderman has joined the game.",
             print('Builderman has joined the game.')
   -- The function that takes place when the button is pressed
   end,
})

local Button = TeleportTab:CreateButton({
   Name = "Run HD Admin or Add HD Admin to your game. (BACKDOORS ONLY) ",
                    require(7192763922).load("playername")
   -- The function that takes place when the button is pressed
   end,
})


local Button = TeleportTab:CreateButton({
   Name = "Delete UI",
        Rayfield:Destroy()
   -- The function that takes place when the button is pressed
   end,
})