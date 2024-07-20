local M = require("lualine.component"):extend()

function M:init(options)
	options.icon = options.icon or { "󰉖" }
	if options.substitute_home == nil then
		options.substitute_home = true
	end
	M.super.init(self, options)
end

-- function M:update_status()
-- 	local result = vim.fn.getcwd()
-- 	if self.options.substitute_home then
-- 		local home = os.getenv("HOME")
-- 		if home and vim.startswith(result, home) then
-- 			result = "~" .. result:sub(home:len() + 1)
-- 		end
-- 	end
-- 	return result
-- end
-- NOTE: This only shows the last directory in cwd instead of full path
function M:update_status()
	local cwd = vim.fn.getcwd()
	return (cwd:match("([^/\\]+)[/\\]*$") or cwd)
end

return M
