return {
	"w0ng/vim-hybrid",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("hybrid")
		vim.g.hybrid_custom_term_colors = 1
		vim.g.hybrid_reduced_contrast = 1
	end,
}
