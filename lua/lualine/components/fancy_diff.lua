local M = require("lualine.components.diff"):extend()

function M:init(options)
    options.symbols = vim.tbl_extend("keep", options.symbols or {}, {
        added = " ",
        modified = " ",
        removed = " "
    })
    M.super.init(self, options)
end

return M
