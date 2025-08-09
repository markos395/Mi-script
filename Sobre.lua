local Player = game.Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")

local toggle = false

local function toggleWalkThroughWalls()
    toggle = not toggle
    for _, part in pairs(Character:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = not toggle
        end
    end
    Humanoid:ApplyDescription({Collide = not toggle})
end

local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 200, 0, 50)
button.Position = UDim2.new(0.5, -100, 0.5, -25)
button.Text = "Toggle Walk Through Walls"
button.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

button.MouseButton1Click:Connect(toggleWalkThroughWalls)
