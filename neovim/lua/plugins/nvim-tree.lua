return {
	"nvim-tree/nvim-tree.lua",
	commit = "4c8ddee4539052f8e94c907c4e02a3ffd2511ea4",
	init = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
	end,
	config = function()
		vim.api.nvim_set_keymap("n", "<F9>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
		require("nvim-tree").setup({})
	end,
}
