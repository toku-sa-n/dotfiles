return {
	"tpope/vim-fugitive",
	keys = {
		{ "<leader>a", "<cmd>Gwrite<CR>" },
		{ "<leader>c", "<cmd>Git commit<CR>" },
		{ "<leader>g", "<cmd>Git<CR>" },
		{ "<up>", "<cmd>Git push<CR>" },
		{ "<down>", "<cmd>Git pull<CR>" },
		{ "gck<space>", "Git checkout<space>", mode = "c" },
		{ "gckb<space>", "Git checkout -b<space>", mode = "c" },
		{ "gm<space>", "Git merge<space>", mode = "c" },
		{ "gb<space>", "Git branch<space>", mode = "c" },
		{ "gbd<space>", "Git branch -d<space>", mode = "c" },
	},
	event = { "BufRead", "BufNewFile" },
}
