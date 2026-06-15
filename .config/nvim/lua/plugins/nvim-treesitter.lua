return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = "all",
			highlight = {
				enable = true,
				disable = { "haskell" },
			},
			additional_vim_regex_highlighting = { "haskell" },
		})
	end,

	-- nvim-treesitter does not support lazy-loading.
	lazy = false,
}
