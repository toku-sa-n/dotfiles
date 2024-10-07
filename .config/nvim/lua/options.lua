vim.opt.list = true
vim.opt.listchars = {
	tab = ">-",
	trail = "_",
}
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.cindent = true
vim.opt.expandtab = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showmatch = true
vim.opt.matchtime = 5

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.gdefault = true

vim.opt.cursorline = true

vim.opt.matchpairs:append("「:」")

vim.opt.fileencodings:append({ "utf-8", "sjis" })

vim.opt.completeopt = { "menu", "preview", "menuone", "noselect" }
