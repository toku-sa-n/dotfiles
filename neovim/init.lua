vim.scriptencoding = "utf-8"

vim.g.mapleader = " "

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
})

vim.opt.list = true
vim.opt.listchars = {
	tab = ">-",
	trail = "_",
}
vim.opt.cindent = true
vim.opt.expandtab = true

vim.api.nvim_set_keymap("n", "s", '"_s', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "Y", "y$", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "+", "<C-a>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "-", "<C-x>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "go", "o<Esc>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gO", "O<Esc>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "n", "nzz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "N", "Nzz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "*", "*zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "#", "#zz", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>w", ":update<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap(
	"n",
	"<leader>.",
	":tabnew " .. os.getenv("MYVIMRC"):gsub("\\", "\\\\"):gsub(" ", "\\ ") .. "<CR>",
	{ noremap = true, silent = true }
)
