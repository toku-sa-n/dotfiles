local nmaps = {
	{ "s", '"_s' },
	{ "Y", "y$" },
	{ "+", "<C-a>" },
	{ "-", "<C-x>" },
	{ "go", "o<Esc>" },
	{ "gO", "O<Esc>" },
	{ "n", "nzz" },
	{ "N", "Nzz" },
	{ "*", "*zz" },
	{ "#", "#zz" },
	{ "<leader>w", ":update<CR>" },
}

for _, map in ipairs(nmaps) do
	vim.api.nvim_set_keymap("n", map[1], map[2], { noremap = true, silent = true })
end

local vimrc_path = (function()
	local path = os.getenv("MYVIMRC")

	return path and vim.fn.escape(vim.fn.resolve(path), "\\ ")
end)()

if vimrc_path then
	vim.api.nvim_set_keymap("n", "<leader>.", ":edit " .. vimrc_path .. "<CR>", { noremap = true, silent = true })
end

vim.api.nvim_set_keymap("c", "%%", "getcmdtype() == ':' ? expand('%:h').'/' : '%%'", { expr = true })
