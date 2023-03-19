local M = require('lualine.component'):extend()

function M:init(options)
    M.super.init(self, options)
    self.options.icon = options.icon or "󰑋"
end

function M:update_status()
    return vim.fn.reg_recording()
end

return M
