local M = require("lualine.component"):extend()

function M:init(options)
	options.icon = options.icon or { "󰦨", color = { fg = "#D7A65F" }, align = "left" }
	M.super.init(self, options)
end

function M:update_status()
	local line = vim.fn.line(".")
	local last_line = vim.api.nvim_buf_line_count(0)
	local col = vim.fn.virtcol(".")
	if line == 1 then
		return "Top"
	elseif line == last_line then
		return "Bottom"
	else
		return string.format("%d:%d", line, col)
	end
end

return M
