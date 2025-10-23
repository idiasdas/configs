local telescope = require("telescope.builtin")
local on_attach = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    local map = function(keys, func, desc, mode)
        mode = mode or "n"
        vim.keymap.set(mode, keys, func, { buffer = args.buf, desc = "LSP: " .. desc })
    end
    map("gd", function()
        telescope.lsp_definitions({ show_line = false })
    end, "[G]oto [D]efinition")
    map("gr", function()
        telescope.lsp_references({ show_line = false })
    end, "[G]oto [R]eferences")
    map("<leader>gt", telescope.lsp_type_definitions, "[G]o to [T]ype Definition")
    map("<leader>ds", telescope.lsp_document_symbols, "[D]ocument [S]ymbols")
    map("<leader>ws", telescope.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
    map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
    map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })
    map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
    map("<leader>gf", vim.lsp.buf.format, "[F]ormat file")

    if client:supports_method("textDocument/completion") then
        vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end

    if
        not client:supports_method("textDocument/willSaveWaitUntil")
        and client:supports_method("textDocument/formatting")
    then
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("my.lsp", { clear = false }),
            buffer = args.buf,
            callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
            end,
        })
    end
    if
        client.supports_method("textDocument/willSaveWaitUntil") and client.supports_method("textDocument/formatting")
    then
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("my.lsp", { clear = false }),
            buffer = args.buf,
            callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
            end,
        })
    end
end

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("my.lsp", {}),
    callback = function(args)
        on_attach(args)
    end,
})

vim.lsp.config("*", {
    capabilities = {
        textDocument = {
            semanticTokens = {
                multilineTokenSupport = true,
            },
        },
    },
    root_markers = { ".git" },
})

vim.lsp.enable({ "luals", "clangd", "bashls", "cmake", "pylsp" })
