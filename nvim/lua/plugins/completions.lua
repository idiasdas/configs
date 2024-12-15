return {
    {
        "hrsh7th/nvim-cmp",
        lazy = false,
        priority = 100,
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-buffer",
            { "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            vim.opt.completeopt = { "menu", "menuone", "noselect" }
            vim.opt.shortmess:append("c")
            local cmp = require("cmp")

            cmp.setup({
                sources = {
                    { name = "nvim_lsp", group_index = 1 },
                    { name = "path",     group_index = 2 },
                    { name = "buffer",   group_index = 2 },
                },
                mapping = {
                    ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                    ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                    ["<C-y>"] = cmp.mapping(cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Inset,
                        select = true,
                    }, { "i", "c" })),
                },
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
            })

            local ls = require("luasnip")
            ls.config.set_config({
                history = false,
                updateevents = "TextChanged, TextChangedI",
            })

            vim.keymap.set({ "i", "s" }, "<C-k>", function()
                if ls.expand_or_jumpable() then
                    ls.expand_or_jump()
                end
            end, { silent = true })

            vim.keymap.set({ "i", "s" }, "<C-j>", function()
                if ls.jumpable(-1) then
                    ls.jump(-1)
                end
            end, { silent = true })
        end,
    },
}
