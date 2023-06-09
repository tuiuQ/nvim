local M = {};

M.basic = {
  n = {
    ["J"] = { "5j", "move to down 5 line" },
    ["K"] = { "5k", "move to up 5 line" },
    ["H"] = { "7h", "move to left 7 char" },
    ["L"] = { "7l", "move to right 7 char" },
    ["S"] = { ":w<CR>", "Save File" },
    ["Q"] = { ":q<CR>", "Quit File" },
    ["<C-j>"] = { "<C-w>j", "move cursor to down panel" },
    ["<C-k>"] = { "<C-w>k", "move cursor to up panel" },
    ["<C-h>"] = { "<C-w>h", "move cursor to left panel" },
    ["<C-l>"] = { "<C-w>l", "move cursor to right panel" },
  },
  v = {
    ["J"] = { "5j", "move to down 5 line" },
    ["K"] = { "5k", "move to up 5 line" },
    ["H"] = { "7h", "move to left 7 char" },
    ["L"] = { "7l", "move to right 7 char" },
  }
};

M.plugins = {
  nvimtree = {
    n = {
      ["<SPACE>e"] = { ":NvimTreeToggle<CR>", "toggle nvimtree" }
    }
  },
  telescope = {
    n = {
      ["<SPACE>ff"] = { ":Telescope find_files<CR>", "telescope find files" },
      ["<SPACE>fw"] = { ":Telescope live_grep<CR>", "telescope live grep" },
    }
  },
  bufferline = {
    n = {
      ["<TAB>"] = { ":BufferLineCycleNext<CR>", "next tab" },
      ["<S-TAB>"] = { ":BufferLineCyclePrev<CR>", "prev tab" },
    }
  }
};

return M;
