return {
	"neovim/nvim-lspconfig",
	config = function()
		local on_attach = function(_, bufnr)
			local opts = { noremap = true, silent = true, buffer = bufnr }
			vim.keymap.set("n", "ga", vim.lsp.buf.code_action, opts)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "<leader>n", vim.diagnostic.goto_next, opts)
			vim.keymap.set("n", "<leader>p", vim.diagnostic.goto_prev, opts)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
		end

		vim.lsp.config("hls", {
			filetypes = { "haskell", "lhaskell", "cabal" },
			on_attach = on_attach,
		})
		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					completion = {
						callSnippet = "Replace",
					},
				},
			},
			on_attach = on_attach,
		})
		vim.lsp.config("gopls", {
			on_attach = on_attach,
		})
		vim.lsp.config("rust_analyzer", {
			on_attach = on_attach,
			settings = {
				["rust-analyzer"] = {
					checkOnSave = {
						command = "clippy",
					},
				},
			},
		})
		vim.lsp.config("yamlls", {
			on_attach = on_attach,
		})
		vim.lsp.config("ocamllsp", {
			on_attach = on_attach,
		})
		vim.lsp.config("coq_lsp", {
			on_attach = on_attach,
		})

		vim.lsp.config("ruby_lsp", {
			on_attach = on_attach,
		})
		vim.lsp.config("rubocop", {
			on_attach = on_attach,
		})

		vim.lsp.enable({
			"hls",
			"lua_ls",
			"gopls",
			"rust_analyzer",
			"yamlls",
			"ocamllsp",
			"coq_lsp",
			"ruby_lsp",
			"rubocop",
		})
	end,

	lazy = false,
}
