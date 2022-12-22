-- Loader Script - Offend Cmd

local consoleRep = game:HttpGet("githublink")
local adminRep = game:HttpGet("githublink")

if not isfolder("offend_cmd") then
    makefolder("offend_cmd")
    writefile("offend_cmd/console.lua", consoleRep)
    writefile("offend_cmd/admin.lua", adminRep)
else
    warn("[Offend Cmd] - Checking for updates..")
    local curVersionConsole = readfile("offend_cmd/console.lua")
    local curVersionAdmin = readfile("offend_cmd/admin.lua")
    if curVersionConsole == consoleRep then
        if curVersionAdmin == adminRep then
            warn("[Offend Cmd] - Console up to date!")
        else
            warn("[Offend Cmd] - New version detected. Downloading..")
            appendfile("offend_cmd/admin.lua", adminRep)
            warn("[Offend Cmd] - Successfully updated!")
        end
    else
        warn("[Offend Cmd] - New version detected. Downloading..")
        appendfile("offend_cmd/console.lua", consoleRep)
        warn("[Offend Cmd] - Successfully updated!")
    end
end

warn("[Offend Cmd] - Loading script..")

loadstring(readfile("offend_cmd/console.lua"))
