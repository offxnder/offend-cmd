-- Admin Script - Offend Cmd

local offend = {}

local players = game:GetService("Players")
local plr = players.LocalPlayer

function offend:fire(cmd)
    local args = {}
    for arg in cmd:gmatch("%w+") do
        table.insert(args, arg:lower())
    end

    if args[1] == "walkspeed" then
        pcall(function()
            plr.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = tonumber(args[2])
        end)
    end

    if args[1] == "jumppower" then
        pcall(function()
            plr.Character:FindFirstChildOfClass("Humanoid").JumpPower = tonumber(args[2])
        end)
    end

    if args[1] == "tpto" then
        pcall(function()
            local target
            for i, player in pairs(players:GetPlayers()) do
                local name = string.lower(player.Name)
                if name == args[2] then
                    target = player
                end
            end
            plr.Character:FindFirstChild("HumanoidRootPart").CFrame = target.Character:FindFirstChild("HumanoidRootPart")
        end)
    end
end

return offend
