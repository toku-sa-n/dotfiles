return {
	{
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
	},
	"dag/vim2hs",
	{
		"mikeboiko/vim-markdown-folding",
		config = function()
			vim.g.vim_markdown_folding_disabled = 1
		end,
	},
	"is0n/jaq-nvim",
	"thinca/vim-quickrun",
	{
		"RRethy/nvim-treesitter-endwise",
		config = function()
			require("nvim-treesitter.configs").setup({ endwise = { enable = true } })
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},
	"numToStr/Comment.nvim",
	"vim-jp/vimdoc-ja",
	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup()
		end,
	},
	"whonore/Coqtail",
}
