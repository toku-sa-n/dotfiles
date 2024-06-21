return {
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
				["<Tab>"] = cmp.mapping.confirm(),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "path" },
				{ name = "cmdline" },
				{ name = "buffer" },
			}),
			preselect = cmp.PreselectMode.None,
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
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
	},
	event = "InsertEnter",
}
