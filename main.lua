-- Ink Game Hub by EfecanRoblox

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Ink Game Hub",
   LoadingTitle = "Ink Game",
   LoadingSubtitle = "Efecan tarafından yapıldı",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "InkGameHub"
   },
   Discord = { Enabled = false },
   KeySystem = false
})

-- Tabs
local MainTab = Window:CreateTab("Main", 4483362458)
local PlayerTab = Window:CreateTab("Player", 4483362458)

-- ESP Toggle
local espEnabled = false
local function toggleESP(state)
   espEnabled = state
   for _, player in pairs(game:GetService("Players"):GetPlayers()) do
      if player ~= game.Players.LocalPlayer and player.Character then
         local hrp = player.Character:FindFirstChild("HumanoidRootPart")
         if hrp then
            if state then
               local box = Instance.new("BoxHandleAdornment")
               box.Size = Vector3.new(4, 6, 2)
               box.Color3 = Color3.fromRGB(0, 255, 0)
               box.Transparency = 0.5
               box.Adornee = hrp
               box.AlwaysOnTop = true
               box.Name = "ESPBox"
               box.Parent = hrp
            else
               if hrp:FindFirstChild("ESPBox") then
                  hrp:FindFirstChild("ESPBox"):Destroy()
               end
            end
         end
      end
   end
end

MainTab:CreateToggle({
   Name = "ESP (Box)",
   CurrentValue = false,
   Callback = function(Value)
      toggleESP(Value)
   end
})

-- Auto-Win (Teleport)
MainTab:CreateButton({
   Name = "Auto Win (Bitişe ışınlan)",
   Callback = function()
      local hrp = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
      if hrp then
         hrp.CFrame = CFrame.new(Vector3.new(0, 5, 500)) -- Bitiş noktasını kendi oyununa göre düzenle
      end
   end
})

-- God Mode
MainTab:CreateButton({
   Name = "Ölümsüzlük (God Mode)",
   Callback = function()
      local char = game.Players.LocalPlayer.Character
      if char and char:FindFirstChild("Humanoid") then
         char.Humanoid.Name = "1"
         local new = char.Humanoid:Clone()
         new.Parent = char
         new.Name = "Humanoid"
         wait(1)
         char:FindFirstChild("1"):Destroy()
      end
   end
})

-- WalkSpeed
PlayerTab:CreateSlider({
   Name = "Yürüme Hızı",
   Range = {16, 150},
   Increment = 1,
   CurrentValue = 16,
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end
})

-- JumpPower
PlayerTab:CreateSlider({
   Name = "Zıplama Gücü",
   Range = {50, 200},
   Increment = 5,
   CurrentValue = 50,
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
   end
})

-- Fly
PlayerTab:CreateToggle({
   Name = "Uç (Fly)",
   CurrentValue = false,
   Callback = function(Value)
      local char = game.Players.LocalPlayer.Character
      local hrp = char and char:FindFirstChild("HumanoidRootPart")
      if Value then
         local bp = Instance.new("BodyPosition", hrp)
         bp.Name = "FlyForce"
         bp.MaxForce = Vector3.new(999999,999999,999999)
         bp.Position = hrp.Position + Vector3.new(0, 10, 0)
      else
         if hrp:FindFirstChild("FlyForce") then
            hrp:FindFirstChild("FlyForce"):Destroy()
         end
      end
   end
})

-- NoClip
local noclipConn
PlayerTab:CreateToggle({
   Name = "NoClip",
   CurrentValue = false,
   Callback = function(Value)
      if Value then
         noclipConn = game:GetService("RunService").Stepped:Connect(function()
            for _, part in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
               if part:IsA("BasePart") then
                  part.CanCollide = false
               end
            end
         end)
      else
         if noclipConn then
            noclipConn:Disconnect()
         end
      end
   end
})
