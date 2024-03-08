vim.cmd([[
fun! s:MakePair()
	let line = getline('.')
	let len = strlen(line)
	if line[len - 1] == ";" || line[len - 1] == ","
		normal! lx$P
	else
		normal! lx$p
	endif
endfun
inoremap <c-u> <ESC>:call <SID>MakePair()<CR>
]])

--- Neovim plugin for automatically highlighting other uses of the word under the cursor using either LSP, Tree-sitter, or regex matching.
local illuminatePluginConfig = {
	"RRethy/vim-illuminate",
	config = function()
		require('illuminate').configure({
			providers = {
				-- 'lsp',
				'treesitter',
				'regex',
			},
		})
		vim.cmd("hi IlluminatedWordText guibg=#393E4D gui=none")
	end
}

--- Bullets.vim is a Vim plugin for automated bullet lists.
local bulletsPluginConfig = {
	"dkarter/bullets.vim",
	lazy = false,
	ft = { "markdown", "txt" },
}

--- A high-performance color highlighter for Neovim which has no external dependencies! Written in performant Luajit.
local colorizerPluginConfig = {
	"NvChad/nvim-colorizer.lua",
	opts = {
		filetypes = { "*" },
		user_default_options = {
			RGB = true,       -- #RGB hex codes
			RRGGBB = true,    -- #RRGGBB hex codes
			names = true,     -- "Name" codes like Blue or blue
			RRGGBBAA = false, -- #RRGGBBAA hex codes
			AARRGGBB = true,  -- 0xAARRGGBB hex codes
			rgb_fn = false,   -- CSS rgb() and rgba() functions
			hsl_fn = false,   -- CSS hsl() and hsla() functions
			css = false,      -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
			css_fn = false,   -- Enable all CSS *functions*: rgb_fn, hsl_fn
			-- Available modes for `mode`: foreground, background,  virtualtext
			mode = "virtualtext", -- Set the display mode.
			-- Available methods are false / true / "normal" / "lsp" / "both"
			-- True is same as normal
			tailwind = true,
			sass = { enable = false },
			virtualtext = "■",
		},
		-- all the sub-options of filetypes apply to buftypes
		buftypes = {},
	}
}

--- The goal of nvim-ufo is to make Neovim's fold look modern and keep high performance.
local ufoPluginConfig = {
	"kevinhwang91/nvim-ufo",
	dependencies = { "kevinhwang91/promise-async", },
	config = function()
		vim.o.foldcolumn = '1' -- '0' is not bad
		vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true

		-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
		vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
		vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
		require('ufo').setup({
			provider_selector = function(bufnr, filetype, buftype)
				return {'treesitter', 'indent'}
			end
		})
	end
}

--- A super powerful autopair plugin for Neovim that supports multiple characters.
local autopairsPluginConfig = 	{
	"windwp/nvim-autopairs",
	config = function()
		require("nvim-autopairs").setup({})
	end
}

return {
	illuminatePluginConfig,
	bulletsPluginConfig,
	colorizerPluginConfig,
	--- Super-simple vim plugin for cycling through antonyms/words related to word under cursor
	{ 'theniceboy/antovim', lazy = false, },
	--- With Wildfire you can quickly select the closest text object among a group of candidates.
	{ 'gcmt/wildfire.vim',  lazy = false, },
	ufoPluginConfig,
	autopairsPluginConfig,
}
