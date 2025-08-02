-- Ink Game Ultimate Hub - Rayfield UI
-- Created by Efecan | Works with KRNL

-- Load Rayfield UI
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

-- Create UI Window
local Window = Rayfield:CreateWindow({
    Name = "Ink Game Hub",
    LoadingTitle = "Ink Game Loader",
    LoadingSubtitle = "by Efecan",
    ConfigurationSaving = {
       Enabled = false
    },
    Discord = {Enabled = false},
    KeySystem = false
})

-- Tabs
local MainTab = Window:CreateTab("Main", 4483362458)
local PlayerTab = Window:CreateTab("Player", 4483362458)

-- ESP Button
MainTab:CreateButton({
    Name = "Box ESP",
    Callback = function()
        for _, v in pairs(game.Players:GetPlayers()) do
            if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                local Billboard = Instance.new("BillboardGui", v.Character.HumanoidRootPart)
                Billboard.Size = UDim2.new(0, 100, 0, 40)
                Billboard.AlwaysOnTop = true
                Billboard.Name = "ESP"
                local Label = Instance.new("TextLabel", Billboard)
                Label.Size = UDim2.new(1, 0, 1, 0)
                Label.Text = v.Name
                Label.TextColor3 = Color3.fromRGB(0, 255, 0)
                Label.BackgroundTransparency = 1
            end
        end
    end
})

-- Auto-Win for Red Light
MainTab:CreateButton({
    Name = "Auto Win (Red Light Green Light)",
    Callback = function()
        local char = game.Players.LocalPlayer.Character
        local finish = workspace:FindFirstChild("Finish") or workspace:FindFirstChild("FinishPart")
        if finish then
            char:MoveTo(finish.Position + Vector3.new(0, 3, 0))
        end
    end
})

-- God Mode
MainTab:CreateButton({
    Name = "God Mode",
    Callback = function()
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.Name = "OldHumanoid"
            local newHum = char.Humanoid:Clone()
            newHum.Name = "Humanoid"
            newHum.Parent = char
            wait(0.1)
            char:FindFirstChild("OldHumanoid"):Destroy()
        end
    end
})

-- Fly
MainTab:CreateButton({
    Name = "Fly",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/YzUj5YMA"))()
    end
})

-- Glass Vision (for Squid Game tiles)
MainTab:CreateButton({
    Name = "Glass Vision",
    Callback = function()
        for _, part in pairs(workspace:GetDescendants()) do
            if part:IsA("Part") and part.Transparency < 0.3 then
                part.BrickColor = BrickColor.new("Lime green")
            elseif part:IsA("Part") then
                part.BrickColor = BrickColor.new("Bright red")
            end
        end
    end
})

-- WalkSpeed Slider
PlayerTab:CreateSlider({
    Name = "WalkSpeed",
    Range = {16, 100},
    Increment = 2,
    CurrentValue = 16,
    Callback = function(val)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = val
    end
})

-- JumpPower Slider
PlayerTab:CreateSlider({
    Name = "JumpPower",
    Range = {50, 200},
    Increment = 5,
    CurrentValue = 50,
    Callback = function(val)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = val
    end
})
