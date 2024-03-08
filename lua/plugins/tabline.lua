local M = {}

M.config = {
	highlights = {
		background = {
			italic = true
		},
		buffer_selected = {
			bold = true
		}
	},
	options = {
		mode = "buffers",
		buffer_close_icon = '',
		modified_icon = '●',
		close_icon = '',
		left_trunc_marker = '',
		right_trunc_marker = '',
		color_icons = true,
		separator_style = "thick",
		offsets = {
			{
				filetypes = "undotree",
				text = "Undotree",
				highlight = "PanelHeading",
				padding = 1
			},
			{
				filetype = "NvimTree",
				text = "Explorer",
				highlight = "PanelHeading",
				padding = 1
			},
			{
				filetype = "DiffviewFiles",
				text = "Diff View",
				highlight = "PanelHeading",
				padding = 1,
			},
			{
				filetype = "flutterToolsOutline",
				text = "Flutter Outline",
				highlight = "PanelHeading",
			},
			{
				filetype = "lazy",
				text = "Lazy",
				highlight = "PanelHeading",
				padding = 1,
			}
		},
		show_buffer_close_icons = false,
		show_close_icon = false,
		enforce_regular_tabs = true,
		show_duplicate_prefix = false,
		tab_size = 20,
		padding = 0,
		hover = {
			enabled = false,
			delay = 200,
			reveal = { "close" }
		},
		indicator = {
			icon = '▎', -- this should be omitted if indicator style is not 'icon'
			-- style = 'icon' | 'underline' | 'none',
			style = "icon",
		},
	}
}

M.setup = function()
	local bufferline = require("bufferline")

	bufferline.setup(M.config)
end

return {
	'akinsho/bufferline.nvim',
	version = "*",
	dependencies = 'nvim-tree/nvim-web-devicons',
	config = function()
		M.setup();
	end
}

