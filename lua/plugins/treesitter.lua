return {
	"nvim-treesitter/nvim-treesitter",
	branch = 'master',
	lazy = false,
	build = ":TSUpdate",
	dependencies = {
		"HiPhish/rainbow-delimiters.nvim"
	},
	config = function()
		require("config.treesitter")
	end
}
