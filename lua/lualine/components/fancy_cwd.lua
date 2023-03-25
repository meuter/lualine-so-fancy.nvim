local M = require("lualine.component"):extend()

function M:init(options)
    options.icon = options.icon or { "", color = { fg = "SkyBlue3" } }
    if options.substitute_home == nil then
        options.substitute_home = true
    end
    M.super.init(self, options)
end

function M:update_status()
    local result = vim.fn.getcwd()
    if self.options.substitute_home then
        result = result:gsub(os.getenv("HOME"), "~")
    end
    return result
end

return M
