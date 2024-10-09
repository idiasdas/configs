vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

vim.g.mapleader = " "

vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set scrolloff=8")

vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true })
vim.api.nvim_set_keymap("t", "<ESC>", [[<C-\><C-n>]], { noremap = true })

vim.cmd("let $NVIM_TUI_ENABLE_TRUE_COLOR=1")
vim.cmd("set termguicolors")

-- window navigation

vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", { desc = "Window: Go Down" })
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", { desc = "Window: Go Right" })
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", { desc = "Window: Go Up" })
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", { desc = "Window: Go Left" })

-- indentation

vim.keymap.set("n", "<TAB>", ">>")
vim.keymap.set("n", "<S-TAB>", "<<")
vim.keymap.set("v", "<TAB>", "<S->>gv")
vim.keymap.set("v", "<S-TAB>", "<S-<>gv")

-- vim diagnostics

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Diagnostics: Go previous" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Diagnostics: Go next" })
-- vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
-- vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)
vim.keymap.set("n", "<leader>td", function()
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = "Diagnostics: [T]oggle [D]iagnostics" })

-- highlight yanked text

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- move in insert mode

vim.keymap.set("i", "<C-h>", "<C-Left>")
vim.keymap.set("i", "<C-l>", "<C-Right>")
vim.keymap.set("i", "<C-j>", "<Down>")
vim.keymap.set("i", "<C-k>", "<Up>")

-- Add enclosing thingies in insert mode

vim.keymap.set("i", "<A-9>", "()<Left>")
vim.keymap.set("i", "<A-0>", "()")

vim.keymap.set("i", "<A-[>", "[]<Left>")
vim.keymap.set("i", "<A-]>", "[]")

vim.keymap.set("i", "<A-{>", "{}<Left>")
vim.keymap.set("i", "<A-}>", "{}")

