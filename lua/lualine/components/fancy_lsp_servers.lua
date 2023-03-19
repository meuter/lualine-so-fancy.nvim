local M = require('lualine.component'):extend()

function M:init(options)
    M.super.init(self, options)
    self.options.icon = options.icon or "󰌘"
    -- self.options.seperator = " "
end

function M:update_status()
    local buf_clients = vim.lsp.buf_get_clients()
    local null_ls_installed, null_ls = pcall(require, "null-ls")
    local buf_client_names = {}
    for _, client in pairs(buf_clients) do
        if client.name == "null-ls" then
            if null_ls_installed then
                for _, kind in ipairs({ "formatting", "diagnostics" }) do
                    for tool, tool_config in pairs(null_ls.builtins[kind]) do
                        if vim.tbl_contains(tool_config.filetypes, vim.bo.filetype) then
                            table.insert(buf_client_names, tool)
                        end
                    end
                end
            end
        else
            table.insert(buf_client_names, client.name)
        end
    end
    return table.concat(buf_client_names, self.options.separator)
end

return M
