return {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            integrations = {
                cmp = true,
                treesitter = true,
                neotree = true,
            },

            custom_highlights = function(colors)
                return {
                    Identifier = { fg = "#eef2f2" },
                    Operator = { fg = colors.red },
                    Parameter = { fg = colors.lavender },
                }
            end,
        })
        vim.cmd.colorscheme("catppuccin-mocha")
        vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#51B3EC", bold = true })
        vim.api.nvim_set_hl(0, "LineNr", { fg = "white", bold = true })
        vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#FB508F", bold = true })
    end,
}
