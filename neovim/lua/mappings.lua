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
