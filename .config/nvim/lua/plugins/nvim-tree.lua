return {
	"nvim-tree/nvim-tree.lua",
	init = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
	end,
	config = function()
		require("nvim-tree").setup({
			update_focused_file = {
				enable = true,
				update_cwd = true,
			},
			view = {
				relativenumber = true,
			},
		})
	end,
	keys = {
		{ "<F9>", "<cmd>NvimTreeToggle<CR>" },
	},
}
