return {
	"tpope/vim-fugitive",
	config = function()
		vim.keymap.set("n", "<leader>vd", ":Gvdiffsplit<CR>", { desc = "Git: [V]ertical [D]iff" })
	end,
}
