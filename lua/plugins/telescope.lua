return {
	"nvim-telescope/telescope.nvim",
	keys = {
		{ "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Telescope find files" },
		{ "<leader>fw", function() require("telescope.builtin").live_grep() end, desc = "Telescope live grep" },
		{ "<leader>fb", function() require("telescope.builtin").buffers() end, desc = "Telescope buffers" },
		{ "<leader>fh", function() require("telescope.builtin").help_tags() end, desc = "Telescope help tags" },
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = function()
		return require "config.telescope"
	end,
}
