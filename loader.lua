-- Loader Script - Offend Cmd

local consoleRep = game:HttpGet("https://raw.githubusercontent.com/offxnder/offend-cmd/main/workspace/console.lua")
local adminRep = game:HttpGet("https://raw.githubusercontent.com/offxnder/offend-cmd/main/workspace/admin.lua")

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
            writefile("offend_cmd/admin.lua", adminRep)
            warn("[Offend Cmd] - Successfully updated!")
        end
    else
        warn("[Offend Cmd] - New version detected. Downloading..")
        writefile("offend_cmd/console.lua", consoleRep)
        warn("[Offend Cmd] - Successfully updated!")
    end
end

warn("[Offend Cmd] - Loading script..")

loadstring(readfile("offend_cmd/console.lua"))()
