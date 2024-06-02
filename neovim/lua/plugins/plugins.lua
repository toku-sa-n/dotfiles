return {
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				snippet = {
					expand = function(args)
						vim.snippet.expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
					["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
					["<Tab>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "buffer" },
				}),
			})

			local key_dir = {
				["<Tab>"] = 1,
				["<S-Tab>"] = -1,
			}

			for key, dir in pairs(key_dir) do
				vim.keymap.set({ "i", "s" }, key, function()
					if vim.snippet.active({ direction = dir }) then
						return "<cmd>lua vim.snippet.jump(" .. dir .. ")<cr>"
					else
						return "<Tab>"
					end
				end, { expr = true })
			end
		end,
	},
	"folke/neodev.nvim",
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = "all",
				highlight = {
					enable = true,
					disable = { "haskell" },
				},
				additional_vim_regex_highlighting = { "haskell" },
			})
		end,
	},
	"dag/vim2hs",
	{
		"mikeboiko/vim-markdown-folding",
		config = function()
			vim.g.vim_markdown_folding_disabled = 1
		end,
	},
	"is0n/jaq-nvim",
	"thinca/vim-quickrun",
	{
		"RRethy/nvim-treesitter-endwise",
		config = function()
			require("nvim-treesitter.configs").setup({ endwise = { enable = true } })
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},
	"numToStr/Comment.nvim",
	"vim-jp/vimdoc-ja",
	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup()
		end,
	},
	"whonore/Coqtail",
}
