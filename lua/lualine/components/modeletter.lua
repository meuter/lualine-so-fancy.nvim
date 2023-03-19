local function mode_letter()
    return string.sub(require("lualine.utils.mode").get_mode(), 1, 1)
end

return mode_letter
