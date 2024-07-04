return {
	"toku-sa-n/neovim-hybrid",
	lazy = false,
	priority = 1000,
	config = function()
		vim.g.hybrid_custom_term_colors = 1
		vim.g.hybrid_reduced_contrast = 1
		vim.cmd.colorscheme("hybrid")
	end,
}
