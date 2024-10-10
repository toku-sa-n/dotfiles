return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",

		"nvim-neotest/neotest-plenary",
	},

	-- The below code does not work because `require` is triggered before `neotest-plenary` is loaded.
	--
	-- ```lua
	-- opts = {
	-- 	adapters = {
	-- 		require("neotest-plenary"),
	-- 	},
	-- },
	-- ```
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-plenary"),
			},
		})
	end,
	keys = {
		{
			"<leader><leader>",
			function()
				require("neotest").summary.toggle()
			end,
			desc = "Watch/Unwatch all tests in the current project",
		},
	},
}
