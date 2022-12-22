-- Admin Script - Offend Cmd

local offend = {}

local players = game:GetService("Players")
local plr = players.LocalPlayer

function offend:fire(cmd)
    local args = {}
    for arg in cmd:gmatch("%w+") do
        table.insert(args, arg:lower())
    end

    if args[0] == "walkspeed" then
        pcall(function()
            plr.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = tonumber(args[1])
        end)
    end

    if args[0] == "jumppower" then
        pcall(function()
            plr.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = tonumber(args[1])
        end)
    end

    if args[0] == "tpto" then
        pcall(function()
            local target
            for i, player in pairs(players:GetPlayers()) do
                if player.Name:lower() == args[1] then
                    target = player
                end
            end
            plr.Character:FindFirstChild("HumanoidRootPart").CFrame = target.Character:FindFirstChild("HumanoidRootPart")
        end)
    end
end

return offend
