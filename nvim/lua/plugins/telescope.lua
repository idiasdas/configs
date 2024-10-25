return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<C-p>", function()
				builtin.find_files({ hidden = true })
			end, { desc = "Telescope: Find files" })
			vim.keymap.set("n", "<leader>si", function()
				builtin.find_files({ hidden = true, no_ignore = true })
			end, { desc = "Telescope: Find files (include .gitignore)" })
			vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Telescope: [S]earch [G]rep" })
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
			vim.keymap.set("n", "<C-f>", builtin.grep_string, { desc = "Telescope: Grep word" })
			vim.keymap.set("n", "<leader>tp", function()
				builtin.planets({ show_pluto = true })
			end, { desc = "Telescope: Grep word" })
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
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
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
