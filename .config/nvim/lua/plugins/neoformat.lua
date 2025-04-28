return {
	"sbdchd/neoformat",
	config = function()
		vim.api.nvim_create_augroup("neoformat", {})
		vim.api.nvim_create_autocmd("BufWritePre", { group = "neoformat", pattern = "*", command = "Neoformat" })

		vim.g.neoformat_coq_coqfmt = {
			exe = "coqfmt",
			stdin = true,
		}

		vim.g.neoformat_enabled_markdown = { "prettier" }
		vim.g.neoformat_enabled_coq = { "coqfmt" }
	end,
	event = "InsertEnter",
}
