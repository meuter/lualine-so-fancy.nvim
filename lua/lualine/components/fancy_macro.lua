local M = require('lualine.component'):extend()

function M:init(options)
    options.icon = options.icon or { "󰑋", color = { fg = "red" } }
    options.color = options.color or { fg = "NONE" }
    M.super.init(self, options)
end

function M:update_status()
    return vim.fn.reg_recording()
end

return M
