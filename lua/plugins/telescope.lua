return {
	'nvim-telescope/telescope.nvim',
	cmd = "Telescope",
	dependencies = {
		'nvim-lua/plenary.nvim',
		"nvim-treesitter/nvim-treesitter",
	},
	opts = function()
		return require "config.telescope"
	end
}
