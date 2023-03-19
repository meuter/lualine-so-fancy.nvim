local M = require("lualine.components.filetype"):extend()

function M:init(options)
    options.ts_icon = options.ts_icon or ""
    M.super.init(self, options)
end

function M:update_status()
    local result = M.super.update_status(self)
    if vim.treesitter.highlighter.active[vim.api.nvim_get_current_buf()] == nil then
        return result
    end
    return result .. " " .. self.options.ts_icon
end

return M
