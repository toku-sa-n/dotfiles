return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			theme = "ayu_dark",
		},
		extensions = {
			"fugitive",
			"lazy",
			"nvim-tree",
			"quickfix",
			"toggleterm",
		},
	},
	event = "VeryLazy",
}
