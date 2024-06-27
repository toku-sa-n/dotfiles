return {
	"github/copilot.vim",

	-- Without this, the tab completion sometimes doesn't work
	dependencies = {
		"hrsh7th/nvim-cmp",
	},

	event = "InsertEnter",
}
