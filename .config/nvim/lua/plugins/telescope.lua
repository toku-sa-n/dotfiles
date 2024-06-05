return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		vim.api.nvim_set_keymap(
			"n",
			"<Leader>f",
			":Telescope find_files hidden=true no_ignore=false<CR>",
			{ noremap = true, silent = true }
		)
		vim.api.nvim_set_keymap("n", "<Leader>b", ":Telescope buffers<CR>", { noremap = true, silent = true })
	end,
	event = "VeryLazy",
}
