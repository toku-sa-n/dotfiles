return {
	"folke/lazydev.nvim",
	ft = "lua",
	opts = {
		library = {
			"plenary.nvim",

			-- To address "Undefined field `fs_stat`.
			"/opt/lua-language-server/meta/3rd/luv",
		},
	},
}
