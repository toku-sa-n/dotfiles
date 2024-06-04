return {
	"ndmitchell/ghcid",
	config = function(plugin)
		vim.opt.rtp:append(plugin.dir .. "/plugins/nvim")
	end,
	ft = "haskell",
}
