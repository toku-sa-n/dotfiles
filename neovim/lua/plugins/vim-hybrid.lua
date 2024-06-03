return {
	"chriskempson/base16-vim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.g.base16colorspace = 256
		vim.opt.termguicolors = true
		vim.cmd.colorscheme("base16-default-dark")
		-- vim.g.hybrid_custom_term_colors = 1
		-- vim.g.hybrid_reduced_contrast = 1
	end,
}
