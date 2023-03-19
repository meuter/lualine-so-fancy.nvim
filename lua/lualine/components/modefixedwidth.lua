local function center(text, width)
    local spaces = width - vim.fn.strdisplaywidth(text)
    local left = math.floor(spaces / 2)
    local right = spaces - left
    return string.rep(" ", left) .. text .. string.rep(" ", right)
end

local function mode_fixed_width()
    return center(require("lualine.utils.mode").get_mode(), 8)
end

return mode_fixed_width
