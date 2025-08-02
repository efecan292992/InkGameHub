-- Ink Game Ultimate Hub - Rayfield UI
-- Developed for KRNL / Executor Compatibility

-- Rayfield UI Loader
loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
    Name = "Ink Game Ultimate Hub",
    LoadingTitle = "Ink Game Hub",
    LoadingSubtitle = "by Efecan",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil,
       FileName = "InkGameHub"
    },
    Discord = {
       Enabled = false
    },
    KeySystem = false
})

-- Main Tab
local MainTab = Window:CreateTab("Main", 4483362458)

-- ESP
MainTab:CreateButton({
   Name = "Enable Box ESP",
   Callback = function()
       for _, v in pairs(game:GetService("Players"):GetPlayers()) do
           if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
               local Billboard = Instance.new("BillboardGui", v.Character.HumanoidRootPart)
               Billboard.Size = UDim2.new(0, 100, 0, 40)
               Billboard.AlwaysOnTop = true
               local NameTag = Instance.new("TextLabel", Billboard)
               NameTag.Size = UDim2.new(1, 0, 1, 0)
               NameTag.Text = v.Name
               NameTag.TextColor3 = Color3.new(0, 1, 0)
               NameTag.BackgroundTransparency = 1
           end
       end
   end
})

-- Auto Win for Red Light Green Light
MainTab:CreateButton({
   Name = "Auto-Win Red Light Green Light",
   Callback = function()
       local char = game.Players.LocalPlayer.Character
       local finish = workspace:FindFirstChild("FinishPart") or workspace:FindFirstChild("Finish")
       if char and finish then
           char:MoveTo(finish.Position + Vector3.new(0, 5, 0))
       end
   end
})

-- God Mode
MainTab:CreateButton({
   Name = "Enable God Mode",
   Callback = function()
       local char = game.Players.LocalPlayer.Character
       if char:FindFirstChild("Humanoid") then
           char.Humanoid.Name = "1"
           local newHum = char.Humanoid:Clone()
           newHum.Parent = char
           newHum.Name = "Humanoid"
           wait(0.1)
           char:FindFirstChild("1"):Destroy()
           game.Players.LocalPlayer.Character = char
       end
   end
})

-- Fly
MainTab:CreateButton({
   Name = "Enable Fly",
   Callback = function()
       loadstring(game:HttpGet("https://pastebin.com/raw/YzUj5YMA"))() -- Simple fly script
   end
})

-- Glass Vision (Color Safe)
MainTab:CreateButton({
   Name = "Enable Glass Vision",
   Callback = function()
       for _, v in pairs(workspace:GetDescendants()) do
           if v:IsA("Part") and v.Transparency < 0.3 then
               v.BrickColor = BrickColor.new("Lime green")
           elseif v:IsA("Part") then
               v.BrickColor = BrickColor.new("Bright red")
           end
       end
   end
})

-- Player Tab
local PlayerTab = Window:CreateTab("Player", 4483362458)

PlayerTab:CreateSlider({
   Name = "WalkSpeed",
   Range = {16, 100},
   Increment = 2,
   CurrentValue = 16,
   Callback = function(Value)
       game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end
})

PlayerTab:CreateSlider({
   Name = "JumpPower",
   Range = {50, 200},
   Increment = 10,
   CurrentValue = 50,
   Callback = function(Value)
       game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
   end
})

PlayerTab:CreateToggle({
   Name = "No Clip",
   CurrentValue = false,
   Callback = function(state)
       if state then
           loadstring(game:HttpGet("https://pastebin.com/raw/RXnWv5Qm"))() -- Simple noclip
       end
   end
})
