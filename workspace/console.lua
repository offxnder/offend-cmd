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

    admin_script:fire(requested_cmd)

    cmd()
end

cmd()
