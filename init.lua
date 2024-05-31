vim.o.scriptencoding = "utf-8"
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
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("lspconfig").lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = {
							-- Using `folke/neodev.nvim` should be much better than adding `vim` to globals because the latter considers `vim` is a global variable in all Lua files, but
							-- we avoid using the former for now because of a bug.
							-- See https://github.com/folke/neodev.nvim/issues/98.
							globals = {
								"vim",
							},
						},
					},
				},
			})
		end,
	},
})
