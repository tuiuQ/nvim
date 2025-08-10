return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPost", "BufNewFile" },
	build = ":TSUpdate",
	cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
	dependencies = {
		"HiPhish/rainbow-delimiters.nvim"
	},
	opts = function ()
		return require "config.treesitter"
	end,
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end
}
