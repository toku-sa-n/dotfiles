return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{ "<leader>f", "<cmd>Telescope find_files hidden=true no_ignore=false<CR>" },
		{ "<leader>b", "<cmd>Telescope buffers<CR>" },

		-- See https://github.com/nvim-telescope/telescope.nvim/issues/564#issuecomment-1173167550
		{ "<leader>gr", "<cmd>Telescope grep_string search=<CR>" },
	},
}
