vim.o.scriptencoding = "utf-8"

vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"nvim-tree/nvim-tree.lua",
		init = function()
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1
		end,
		config = function()
			vim.api.nvim_set_keymap("n", "<F9>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
			require("nvim-tree").setup({})
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					theme = "tokyonight",
				},
			})
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("tokyonight")
		end,
		opts = {},
	},
	"nvim-tree/nvim-web-devicons",
	"github/copilot.vim",
	{
		"vim-autoformat/vim-autoformat",
		config = function()
			vim.g.autoformat_autoindent = 0
			vim.api.nvim_create_autocmd({ "BufWritePre" }, { command = "Autoformat" })
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"folke/neodev.nvim",
		},
		config = function()
			require("lspconfig").lua_ls.setup({
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
						diagnostics = {
							-- Using `folke/neodev.nvim` should be much better than adding `vim` to globals because the latter considers `vim` is a global variable in all Lua files, but
							-- we avoid using the former for now because of a bug.
							-- See https://github.com/folke/neodev.nvim/issues/98.
							globals = {
								"vim",
							},
						},
					},
				},
			})
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
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
		end,
	},
	"nvim-lua/plenary.nvim",
	{
		"voldikss/vim-floaterm",
		config = function()
			vim.api.nvim_set_keymap("n", "<Leader>g", ":FloatermNew lazygit<CR>", { noremap = true, silent = true })
		end,
	},
	{
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
	},
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	{
		"hrsh7th/nvim-cmp",
		config = function()
			require("cmp").setup({
				expand = function(args)
					vim.snippet.expand(args.body)
				end,
			})
		end,
	},
	"folke/neodev.nvim",
})
