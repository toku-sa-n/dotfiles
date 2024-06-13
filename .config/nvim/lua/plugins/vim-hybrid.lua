return {
	"rafi/neo-hybrid.vim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.g.hybrid_custom_term_colors = 1
		vim.g.hybrid_reduced_contrast = 1
		vim.cmd.colorscheme("neohybrid")
	end,
}
