local function current_dir()
    return vim.fn.getcwd():gsub(os.getenv("HOME"), "~")
end

return current_dir
