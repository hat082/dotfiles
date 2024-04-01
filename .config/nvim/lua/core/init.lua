-- .config/nvim/lua/core/init.lua
-- Load all core files
local function load_core_files()
    local files = vim.fn.readdir(vim.fn.stdpath('config') .. '/lua/core/')

    for _, file in ipairs(files) do
        if file:match("%.lua$") and file ~= "init.lua" then
            local module_name = file:match("(.+)%..+")
            require("core." .. module_name)
        end
    end
end

load_core_files()

