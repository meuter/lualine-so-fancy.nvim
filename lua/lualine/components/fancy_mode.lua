local M = require('lualine.component'):extend()

function M:init(options)
    M.super.init(self, options)
    self.options.width = options.width or 8
end

local function center(text, width)
    local spaces = width - vim.fn.strdisplaywidth(text)
    local left = math.floor(spaces / 2)
    local right = spaces - left
    return string.rep(" ", left) .. text .. string.rep(" ", right)
end

function M:update_status()
    local mode = require("lualine.utils.mode").get_mode()
    if self.options.width < string.len(mode) then
        return string.sub(mode, 1, self.options.width)
    else
        return center(require("lualine.utils.mode").get_mode(), self.options.width)
    end
end

return M
