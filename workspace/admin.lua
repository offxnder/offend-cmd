-- Admin Script - Offend Cmd

local offend = {}

local players = game:GetService("Players")
local plr = players.LocalPlayer

local cmds = [[
    walkspeed (number) - Changes your Walk Speed.
    jumppower (number) - Changes your Jump Power.
    tpto (player) - Teleports you to the defined Player.
    infjump - Allows you to jump infinitely.
    uninfjump - Stops infjump.
    fling - Spins your character.
    unfling - Stops fling.
    reset - Kills your character.
]]

getgenv().infjump = false

function offend:fire(cmd)
    local args = {}
    for arg in cmd:gmatch("%w+") do
        table.insert(args, arg:lower())
    end

    if args[1] == "cmds" then
        return cmds
    end

    if args[1] == "walkspeed" then
        pcall(function()
            plr.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = tonumber(args[2])
        end)

        return "Changed walk speed."
    end

    if args[1] == "jumppower" then
        pcall(function()
            plr.Character:FindFirstChildOfClass("Humanoid").JumpPower = tonumber(args[2])
        end)

        return "Changed jump power."
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

            plr.Character:FindFirstChild("HumanoidRootPart").CFrame = target.Character:FindFirstChild("HumanoidRootPart").CFrame
        end)

        return "Teleported to player."
    end

    if args[1] == "infjump" then
        pcall(function()
            getgenv().infjump = true
        
            function Action(Object, Function) if Object ~= nil then Function(Object); end end
                
            game:GetService("UserInputService").InputBegan:connect(function(UserInput)
                if getgenv().infjump then
                    if UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.Space then
                        Action(plr.Character.Humanoid, function(self)
                            if self:GetState() == Enum.HumanoidStateType.Jumping or self:GetState() == Enum.HumanoidStateType.Freefall then
                                Action(self.Parent.HumanoidRootPart, function(self)
                                    self.Velocity = Vector3.new(0, 50, 0);
                                end)
                            end
                        end)
                    end
                end
            end)
        end)

        return "Infinite jump enabled."
    end

    if args[1] == "uninfjump" then
        pcall(function()
            getgenv().infjump = false
        end)

        return "Infinite jump stopped."
    end

    if args[1] == "fling" then
        pcall(function()
            local BT = Instance.new("BodyThrust", plr.Character:FindFirstChild("HumanoidRootPart"))
            BT.Force = Vector3.new(tonumber(args[2]),0,tonumber(args[2]))
            BT.Location = plr.Character:FindFirstChild("HumanoidRootPart").Position
        end)

        return "Fling enabled."
    end

    if args[1] == "unfling" then
        pcall(function()
            plr.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("BodyThrust"):Destroy()
        end)

        return "Fling stopped."
    end

    if args[1] == "reset" then
        pcall(function()
            plr.Character:FindFirstChildOfClass("Humanoid").Health = -9999
        end)

        return "Killed character."
    end
end

return offend
