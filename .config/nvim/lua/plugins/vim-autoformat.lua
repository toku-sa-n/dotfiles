return {
	"vim-autoformat/vim-autoformat",
	config = function()
		vim.g.autoformat_autoindent = 0
		vim.api.nvim_create_autocmd({ "BufWritePre" }, { command = "Autoformat" })

		vim.g.formatdef_hs = '"(hindent | stylish-haskell)"'
		vim.g.formatters_haskell = { "hs" }
	end,
	event = "InsertEnter",
}
