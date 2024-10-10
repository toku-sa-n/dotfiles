return {
	"sbdchd/neoformat",
	config = function()
		vim.api.nvim_create_augroup("neoformat", {})
		vim.api.nvim_create_autocmd("BufWritePre", { group = "neoformat", pattern = "*", command = "Neoformat" })

		vim.g.neoformat_enabled_markdown = { "prettier" }
	end,
	event = "InsertEnter",
}
