return {
	"nvim-tree/nvim-tree.lua",
	init = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
	end,
	config = function()
		local function hide_generated_git_files(path)
			local git_path = path:gsub("\\", "/"):match("/%.git(/.*)$")
			if not git_path then
				return false
			end

			if git_path == "" or git_path == "/config" or git_path == "/config.worktree" or git_path == "/description" then
				return false
			end

			if
				git_path == "/info"
				or git_path == "/info/exclude"
				or git_path == "/info/attributes"
				or git_path == "/info/sparse-checkout"
			then
				return false
			end

			if git_path == "/hooks" then
				return false
			end

			local hook = git_path:match("^/hooks/([^/]+)$")
			if hook and not hook:match("%.sample$") then
				return false
			end

			return true
		end

		require("nvim-tree").setup({
			filters = {
				custom = hide_generated_git_files,
			},
			update_focused_file = {
				enable = true,
				update_cwd = true,
			},
			view = {
				relativenumber = true,
			},
		})
	end,
	keys = {
		{ "<F9>", "<cmd>NvimTreeToggle<CR>" },
	},
}
