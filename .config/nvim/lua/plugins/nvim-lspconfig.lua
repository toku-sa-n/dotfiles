return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"folke/neodev.nvim",
	},
	config = function()
		local lspconfig = require("lspconfig")

		local on_attach = function(_, bufnr)
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
				"K",
				"<cmd>lua vim.lsp.buf.hover()<CR>",
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
					diagnostics = {
						-- Using `folke/neodev.nvim` should be much better than adding `vim` to globals because the latter considers `vim` is a global variable in all Lua files, but
						-- we avoid using the former for now because of a bug.
						-- See https://github.com/folke/neodev.nvim/issues/98.
						globals = {
							"vim",
						},
					},
				},
			},
		})
	end,

	-- `LspAttach` does not work.
	event = { "BufRead", "BufNewFile" },
}
