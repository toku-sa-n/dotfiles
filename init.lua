local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"github/copilot.vim",
	{
		"vim-autoformat/vim-autoformat",
		init = function()
			vim.g.autoformat_autoindent = 0
			vim.api.nvim_create_autocmd({ "BufWritePre" }, { command = "Autoformat" })
		end,
	},
	{ "neovim/nvim-lspconfig" },
	{
		"neovim/nvim-lspconfig",
		init = function()
			require("lspconfig").lua_ls.setup({})
		end,
	},
	{},
})
