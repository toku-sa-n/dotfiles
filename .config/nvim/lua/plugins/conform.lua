return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		formatters_by_ft = {
			markdown = { "prettier" },
			lua = { "stylua" },
			coq = { "coqfmt" },
		},
		formatters = {
			coqfmt = {
				command = "coqfmt",
				stdin = true,
				inherit = false,
			},
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "never",
		},
	},
}
