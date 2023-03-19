local M = require("lualine.components.diagnostics"):extend()

function M:init(options)
    options.symbols = vim.tbl_extend("keep", options.symbols or {}, {
        error = " ",
        warn = " ",
        hint = " ",
        info = " "
    })
    M.super.init(self, options)
end

return M
