local M = require("lualine.component"):extend()

function M:init(options)
	options.width = options.width or 7
	M.super.init(self, options)
end

local function center(text, width, icon)
	local spaces = width - vim.fn.strdisplaywidth(text)
	local left = math.floor(spaces / 2)
	local right = spaces - left - 2
	return string.rep(" ", left) .. icon .. text .. string.rep(" ", right)
end

function M:update_status()
	local mode = require("lualine.utils.mode").get_mode()
	if self.options.width < string.len(mode) then
		return string.sub(mode, 1, self.options.width)
	else
		return center(require("lualine.utils.mode").get_mode(), self.options.width, " ")
	end
end

return M
