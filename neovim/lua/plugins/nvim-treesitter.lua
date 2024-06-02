return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		ensure_installed = "all",
		highlight = {
			enable = true,
			disable = { "haskell" },
		},
		additional_vim_regex_highlighting = { "haskell" },
	},
	config = true,
}
