return {
	"nvim-treesitter/nvim-treesitter",
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
	event = { "BufRead", "BufNewFile" },

	-- Neovim complains about missing a Lua parser if this plugin is loaded
	-- lazily.
	lazy = false,
}
