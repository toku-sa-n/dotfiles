vim.scriptencoding = "utf-8"

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
					theme = "ayu_dark",
				},
			})
		end,
	},
	{
		"w0ng/vim-hybrid",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("hybrid")
			vim.g.hybrid_custom_term_colors = 1
			vim.g.hybrid_reduced_contrast = 1
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

			vim.g.formatdef_hs = '"(hindent | stylish-haskell)"'
			vim.g.formatters_haskell = { "hs" }
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"folke/neodev.nvim",
		},
		config = function()
			local lspconfig = require("lspconfig")

			local on_attach = function(_, bufnr)
				vim.api.nvim_buf_set_keymap(
					bufnr,
					"n",
					"K",
					"<cmd>lua vim.lsp.buf.hover()<CR>",
					{ noremap = true, silent = true }
				)
			end

			lspconfig.hls.setup({
				filetypes = { "haskell", "lhaskell", "cabal" },
				on_attach = on_attach,
			})
			lspconfig.lua_ls.setup({
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
})
