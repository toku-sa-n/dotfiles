return {
	"thinca/vim-splash",
	config = function()
		vim.g["splash#path"] = vim.fn.stdpath("config") .. "/assets/neovim-logo.txt"
	end,
	lazy = false,
	priority = 1000,
}
