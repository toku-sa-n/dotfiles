return {
	"lambdalisue/vim-suda",
	config = function()
		vim.api.nvim_set_keymap("n", "<leader>W", ":SudaWrite<CR>", { noremap = true, silent = true })
	end,
	event = "BufRead",
}
