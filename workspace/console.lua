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
        consoleprint(firecmd.."\n", "green")
    end)

    cmd()
end

cmd()
