-- center after jumps

vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true })
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- project navigation

vim.keymap.set("n", "<M-f>", "<cmd>silent !tmux neww tmux-find-session<CR>", { desc = "Select directory and open tmux session" })

-- window navigation

vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", { desc = "Window: Go Down" })
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", { desc = "Window: Go Right" })
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", { desc = "Window: Go Up" })
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", { desc = "Window: Go Left" })

-- window control

vim.keymap.set("n", "<leader>wh", "<C-w>H", { desc = "Window: Split Vertical" })

-- quickfix

vim.keymap.set("n", "<M-j>", ":cnext<CR>zz", { desc = "Quickfix: Next" })
vim.keymap.set("n", "<M-k>", ":cprev<CR>zz", { desc = "Quickfix: Previous" })

-- vim diagnostics

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Diagnostics: Go previous" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Diagnostics: Go next" })
vim.keymap.set('n', '<leader>td', function()
    local new_config = not vim.diagnostic.config().virtual_lines
    vim.diagnostic.config({ virtual_lines = new_config })
    vim.cmd('normal! zz')
end, { desc = 'Toggle diagnostic virtual_lines' })
vim.keymap.set("n", "<leader>tD", function()
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

-- clear highlight 

vim.keymap.set("n", "<leader>ch", ":noh<CR>", { desc = "Clear Highlight" })

-- Move selected text

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Stay on current position when merging lines

vim.keymap.set("n", "J", "mzJ`z")

-- Paste without overriding buffer

vim.keymap.set("n", "<leader>p", '"_dP')

-- Yank to + register

vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

vim.keymap.set("n", "<leader>p", '"+p')
vim.keymap.set("v", "<leader>p", '"+p')
vim.keymap.set("n", "<leader>P", '"+P')

-- Clangd Switch Source Header

vim.keymap.set("n", "<leader>th", ":ClangdSwitchSourceHeader<CR>", { desc = "Clangd: [T]oggle [H]eader Source" })
