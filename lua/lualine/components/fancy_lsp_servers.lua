local M = require('lualine.component'):extend()

function M:init(options)
    options.icon = options.icon or "󰌘"
    options.separator = options.separator or ","
    M.super.init(self, options)
end

function M:update_status()
    local buf_clients = vim.lsp.buf_get_clients()
    local null_ls_installed, null_ls = pcall(require, "null-ls")
    local buf_client_names = {}
    for _, client in pairs(buf_clients) do
        if client.name == "null-ls" then
            if null_ls_installed then
                for _, source in ipairs(null_ls.get_source({ filetype = vim.bo.filetype })) do
                    table.insert(buf_client_names, source.name)
                end
            end
        else
            table.insert(buf_client_names, client.name)
        end
    end
    return table.concat(buf_client_names, self.options.separator)
end

return M
