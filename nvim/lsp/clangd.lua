return {
    cmd = { 'clangd', '--fallback-style=webkit' },
    filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
    root_markers = { '.clangd', '.git' },
    on_attach = function(client, bufnr)
        vim.api.nvim_buf_create_user_command(bufnr, "ClangdSwitchSourceHeader", function()
            vim.lsp.buf_request(
                bufnr,
                "textDocument/switchSourceHeader",
                { uri = vim.uri_from_bufnr(bufnr) },
                function(err, result)
                    if err then
                        vim.notify("clangd: " .. err.message, vim.log.levels.ERROR)
                        return
                    end
                    if not result or result == "" then
                        vim.notify("clangd: No corresponding header/source file found.", vim.log.levels.WARN)
                        return
                    end
                    vim.cmd("edit " .. vim.uri_to_fname(result))
                end
            )
        end, {})
        -- Vertical split
        vim.api.nvim_buf_create_user_command(bufnr, "ClangdSwitchSourceHeaderVSplit", function()
            vim.lsp.buf_request(
                bufnr,
                "textDocument/switchSourceHeader",
                { uri = vim.uri_from_bufnr(bufnr) },
                function(err, result)
                    if err then
                        vim.notify("clangd: " .. err.message, vim.log.levels.ERROR)
                        return
                    end
                    if not result or result == "" then
                        vim.notify("clangd: no corresponding file", vim.log.levels.WARN)
                        return
                    end
                    vim.cmd("vsplit " .. vim.uri_to_fname(result))
                end
            )
        end, {})
    end,
}
