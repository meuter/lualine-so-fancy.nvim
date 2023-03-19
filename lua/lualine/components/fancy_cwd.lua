local M = require("lualine.component"):extend()

function M:init(options)
    M.super.init(self, options)
    self.options.icon = options.icon or ""
    if self.options.substitute_home == nil then
        self.options.substitute_home = true
    end
end

function M:update_status()
    local result = vim.fn.getcwd()
    if self.options.substitute_home then
        result = result:gsub(os.getenv("HOME"), "~")
    end
    return result
end

return M
