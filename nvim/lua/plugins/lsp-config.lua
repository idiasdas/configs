return {
    {
        -- Only used for its ready-made server configs (lsp/eslint.lua, lsp/clangd.lua, ...).
        -- Servers are enabled explicitly in lua/lsp-configs.lua.
        "neovim/nvim-lspconfig",
    },
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "bashls", "eslint" },
                -- Don't start every installed server: typescript-language-server would
                -- run next to tsc. lua/lsp-configs.lua lists the servers to start.
                automatic_enable = false,
            })
        end,
    },
}
