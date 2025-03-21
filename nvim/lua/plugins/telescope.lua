return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        config = function()
            -- setup
            require("telescope").setup({
                defaults = {
                    layout_strategy = "vertical",
                    initial_value = "normal",
                    path_display = { "absolute" },
                },
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                    fzf = {},
                },
            })

            -- extensions
            require("telescope").load_extension("fzf")
            require("telescope").load_extension("ui-select")

            -- keymaps
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<C-p>", function()
                builtin.find_files({ hidden = true })
            end, { desc = "Telescope: Find files" })
            vim.keymap.set("n", "<leader>si", function()
                builtin.find_files({ hidden = true, no_ignore = true })
            end, { desc = "Telescope: Find files (include .gitignore)" })
            vim.keymap.set("n", "<leader>sg", function()
                builtin.live_grep({ use_regex = true })
            end, { desc = "Telescope: [S]earch [G]rep" })
            vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Telescope: [S]earch [H]elp" })
            vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "Telescope: [S]earch [K]eymaps" })
            vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "Telescope: [S]earch [D]iagnostics" })
            vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "Telescope: [S]earch [R]esume" })
            vim.keymap.set(
                "n",
                "<leader>s.",
                builtin.oldfiles,
                { desc = "Telescope: [S]earch Recent Files ('.' for repeat)" }
            )
            vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Telescope: Find existing buffers" })
            vim.keymap.set("n", "<leader>sn", function()
                builtin.find_files({ cwd = vim.fn.stdpath("config") })
            end, { desc = "Telescope: [S]earch [N]eovim files" })
            vim.keymap.set("n", "<leader>sN", function()
                builtin.find_files({ cwd = "$HOME/Documents/notes" })
            end, { desc = "Telescope: [S]earch [N]otes" })
            vim.keymap.set("n", "<C-f>", builtin.grep_string, { desc = "Telescope: Grep word" })
            vim.keymap.set("n", "<leader>sb", function()
                builtin.find_files({ cwd = "$HOME/bin" })
            end, { desc = "Telescope: [S]earch [B]in files" })
        end,
    },
}
