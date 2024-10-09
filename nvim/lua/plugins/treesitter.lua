return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            -- ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc" },
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
            aditional_vim_regex_highlighting = false,
        })
        vim.api.nvim_set_hl(0, "@variable", { link = "Identifier" })
        vim.api.nvim_set_hl(0, "@lsp.type.variable", { link = "Identifier" })
        vim.api.nvim_set_hl(0, "@lsp.type.parameter.cpp", { link = "Identifier" })
    end,
}
