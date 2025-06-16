return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "clangd", "cmake", "pylsp", "bashls" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			local telescope = require("telescope.builtin")

			local on_attach = function(_, bufnr)
				local map = function(keys, func, desc, mode)
					mode = mode or "n"
					vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
				end
				map("gd", function()
					telescope.lsp_definitions({ show_line = false })
				end, "[G]oto [D]efinition")
				map("gr", function()
					telescope.lsp_references({ show_line = false })
				end, "[G]oto [R]eferences")
				map("<leader>gt", telescope.lsp_type_definitions, "[G]o to [T]ype Definition")
				map("<leader>ds", telescope.lsp_document_symbols, "[D]ocument [S]ymbols")
				map("<leader>ws", telescope.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
				map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
				map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })
				map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
				map("<leader>gf", vim.lsp.buf.format, "[F]ormat file")
			end

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			lspconfig.clangd.setup({
				cmd = {
					"clangd",
					"--fallback-style=webkit",
				},
				capabilities = capabilities,
				on_attach = on_attach,
			})
			lspconfig.cmake.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			lspconfig.pylsp.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			lspconfig.bashls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
		end,
	},
}
