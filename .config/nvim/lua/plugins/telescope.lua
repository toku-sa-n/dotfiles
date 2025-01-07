return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{ "<leader>f", "<cmd>Telescope find_files hidden=true no_ignore=false<CR>" },
		{ "<leader>b", "<cmd>Telescope buffers<CR>" },
		{ "<leader>gr", "<cmd>Telescope live_grep<CR>" },
	},
}
