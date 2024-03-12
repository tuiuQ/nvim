local M = {}

M.generic_opts_any = {
	noremap = true,
	silent = true
}

M.generic_opts = {
	insert_mode = M.generic_opts_any,
	normal_mode = M.generic_opts_any,
	visual_mode = M.generic_opts_any,
	visual_block_mode = M.generic_opts_any,
	command_mode = M.generic_opts_any,
	operator_pending_mode = M.generic_opts_any,
	term_mode = { silent = true },
}

M.mode_adapters = {
	insert_mode = "i",
	normal_mode = "n",
	term_mode = "t",
	visual_mode = "v",
	visual_block_mode = "x",
	command_mode = "c",
	operator_pending_mode = "o"
}

M.basic = {
	normal_mode = {
		["S"] = ":w<CR>",
		["Q"] = ":q<CR>",
		["J"] = "5j",
		["K"] = "5k",
		["H"] = "5h",
		["L"] = "5l",
		["<C-j>"] = "<C-w>j",
		["<C-k>"] = "<C-w>k",
		["<C-h>"] = "<C-w>h",
		["<C-l>"] = "<C-w>l",
		["<ESC><ESC>"] = ":noh<CR>",
    [";"] = ":",
    ["R"] = ":Joshuto<CR>",
    ["<leader>gg"] = ":LazyGit<CR>",
    ["<leader>|"] = ":source $MYVIMRC<CR>"
	},
	visual_mode = {
		["J"] = "5j",
		["K"] = "5k",
		["H"] = "5h",
		["L"] = "5l",
		["<TAB>"] = ">gv",
		["<S-TAB>"] = "<gv"
	}
}

M.nvimtree = {
	normal_mode = {
		["<leader>e"] = ":NvimTreeToggle<CR>"
	}
}

M.tabline = {
	normal_mode = {
		["<TAB>"] = ":BufferLineCycleNext<CR>",
		["<S-TAB>"] = ":BufferLineCyclePrev<CR>"
	}
}

M.telescope = {
  normal_mode = {
    ["<leader>ff"] = ":Telescope find_files<CR>"
  }
}

M.joshuto = {
  normal_mode = {
    ["<leader>ra"] = ":Joshuto<CR>"
  }
}

M.foldcycle = {
  normal_mode = {
    ["zo"] = function() return require("fold-cycle").open() end,
    ["zc"] = function() return require("fold-cycle").close() end,
    ["zC"] = function() return require("fold-cycle").close_all() end,
    ["zM"] = function() return require("fold-cycle").open_all() end
  }
}

return M
