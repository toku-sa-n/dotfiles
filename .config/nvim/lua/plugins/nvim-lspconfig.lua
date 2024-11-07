return {
	"neovim/nvim-lspconfig",
	config = function()
		local lspconfig = require("lspconfig")

		local on_attach = function(_, bufnr)
			vim.api.nvim_buf_set_keymap(
				bufnr,
				"n",
				"ga",
				"<cmd>lua vim.lsp.buf.code_action()<CR>",
				{ noremap = true, silent = true }
			)
			vim.api.nvim_buf_set_keymap(
				bufnr,
				"n",
				"gd",
				"<cmd>lua vim.lsp.buf.definition()<CR>",
				{ noremap = true, silent = true }
			)
			vim.api.nvim_buf_set_keymap(
				bufnr,
				"n",
				"<leader>n",
				"<cmd>lua vim.diagnostic.goto_next()<CR>",
				{ noremap = true, silent = true }
			)
			vim.api.nvim_buf_set_keymap(
				bufnr,
				"n",
				"gd",
				"<cmd>lua vim.diagnostic.goto_prev()<CR>",
				{ noremap = true, silent = true }
			)
			vim.api.nvim_buf_set_keymap(
				bufnr,
				"n",
				"K",
				"<cmd>lua vim.lsp.buf.hover()<CR>",
				{ noremap = true, silent = true }
			)
			vim.api.nvim_buf_set_keymap(
				bufnr,
				"n",
				"<F2>",
				"<cmd>lua vim.lsp.buf.rename()<CR>",
				{ noremap = true, silent = true }
			)
		end

		lspconfig.hls.setup({
			filetypes = { "haskell", "lhaskell", "cabal" },
			on_attach = on_attach,
		})
		lspconfig.lua_ls.setup({
			settings = {
				Lua = {
					completion = {
						callSnippet = "Replace",
					},
				},
			},
			on_attach = on_attach,
		})
		lspconfig.gopls.setup({
			on_attach = on_attach,
		})
		lspconfig.rust_analyzer.setup({
			on_attach = on_attach,
			settings = {
				["rust-analyzer"] = {
					checkOnSave = {
						command = "clippy",
					},
				},
			},
		})
		lspconfig.yamlls.setup({
			on_attach = on_attach,
		})
		lspconfig.ocamllsp.setup({
			on_attach = on_attach,
		})
		lspconfig.coq_lsp.setup({
			on_attach = on_attach,
		})

		lspconfig.ruby_lsp.setup({
			on_attach = on_attach,
		})
		lspconfig.rubocop.setup({
			on_attach = on_attach,
		})
	end,

	-- `LspAttach` does not work.
	event = { "BufRead", "BufNewFile" },
}
