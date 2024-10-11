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
				local neotest = require("neotest")
				local cwd = vim.uv.cwd()
				if cwd == nil then
					return
				end

				if neotest.watch.is_watching(cwd) then
					neotest.watch.stop(cwd)
					neotest.summary.close()
				else
					neotest.watch.watch(cwd)
					neotest.summary.open()
				end
			end,
			desc = "Watch/Unwatch all tests in the current project",
		},
	},
}
