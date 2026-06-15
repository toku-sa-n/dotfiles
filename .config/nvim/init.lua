vim.scriptencoding = "utf-8"

local cache_dir = vim.fn.stdpath("cache")
if vim.fn.isdirectory(cache_dir) == 0 then
	pcall(vim.fn.mkdir, cache_dir, "p")
end
if vim.fn.filewritable(cache_dir) == 2 then
	vim.loader.enable()
end

vim.g.mapleader = " "
vim.g.clipboard = "osc52"

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

require("lazy").setup("plugins", {
	change_detection = {
		notify = false,
	},
	defaults = {
		lazy = true,
	},
	local_spec = false,
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})

require("mappings")
require("options")
