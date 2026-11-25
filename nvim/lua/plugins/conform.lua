return {
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        keys = {
            {
                "<leader>gf",
                function()
                    require("conform").format({ lsp_format = "fallback" })
                end,
                desc = "[F]ormat file",
            },
        },
        opts = {
            formatters_by_ft = {
                typescript = { "prettier" },
                typescriptreact = { "prettier" },
                javascript = { "prettier" },
                javascriptreact = { "prettier" },
                json = { "prettier" },
                jsonc = { "prettier" },
                markdown = { "prettier" },
            },
            formatters = {
                -- Only run Prettier in projects that have a Prettier config file
                -- (.prettierrc.json, ...). Elsewhere, fall back to LSP formatting.
                -- Uses the project's node_modules/.bin/prettier when present.
                prettier = { require_cwd = true },
            },
            format_on_save = {
                timeout_ms = 1000,
                lsp_format = "fallback",
            },
        },
    },
}
