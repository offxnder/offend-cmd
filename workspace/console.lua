-- Console Script - Offend Cmd
consolecreate()
consolesettitle("Offend Cmd - Console")

local admin_script = loadstring(readfile("offend_cmd/admin.lua"))()

consoleprint([[

     ██████╗ ███████╗███████╗███████╗███╗   ██╗██████╗      ██████╗███╗   ███╗██████╗ 
    ██╔═══██╗██╔════╝██╔════╝██╔════╝████╗  ██║██╔══██╗    ██╔════╝████╗ ████║██╔══██╗
    ██║   ██║█████╗  █████╗  █████╗  ██╔██╗ ██║██║  ██║    ██║     ██╔████╔██║██║  ██║
    ██║   ██║██╔══╝  ██╔══╝  ██╔══╝  ██║╚██╗██║██║  ██║    ██║     ██║╚██╔╝██║██║  ██║
    ╚██████╔╝██║     ██║     ███████╗██║ ╚████║██████╔╝    ╚██████╗██║ ╚═╝ ██║██████╔╝
     ╚═════╝ ╚═╝     ╚═╝     ╚══════╝╚═╝  ╚═══╝╚═════╝      ╚═════╝╚═╝     ╚═╝╚═════╝ 

]], "red")

consoleprint(" - For a list of commands, Type 'cmds'\n\n", "green")

function cmd()
    consoleprint(" > ", "white")
    local requested_cmd = consoleinput()

    local firecmd = admin_script:fire(requested_cmd)

    pcall(function()
        if tostring(firecmd) then
            print(firecmd.."\n")
        else
            for i, sdf in pairs(firecmd) do
                print(sdf.."\n")
            end
        end
    end)

    cmd()
end

cmd()
