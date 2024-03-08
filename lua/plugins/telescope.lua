local utils = require("core.utils")

return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.5',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-tree/nvim-web-devicons'
	},
  config = function()
    utils.keymap.load("telescope")
  end
}
