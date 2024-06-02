return {
	"tpope/vim-fugitive",
	config = function()
		local mappings = {
			{ "n", "<leader>a", ":Gwrite<CR>" },
			{ "n", "<leader>c", ":Git commit<CR>" },
			{ "n", "<up>", ":Git push<CR>" },
			{ "n", "<down>", ":Git pull<CR>" },
			{ "c", "gck<space>", "Git checkout<space>" },
			{ "c", "gckb<space>", "Git checkout -b<space>" },
			{ "c", "gm<space>", "Git merge<space>" },
			{ "c", "gb<space>", "Git branch<space>" },
			{ "c", "gbd<space>", "Git branch -d<space>" },
		}

		for _, maps in ipairs(mappings) do
			vim.api.nvim_set_keymap(maps[1], maps[2], maps[3], { noremap = true, silent = true })
		end
	end,
}
