local treesitter = require "nvim-treesitter"

treesitter.setup({
  ensure_installed = {
    "lua"
  },
  highlight = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>",
      node_incremental = "<CR>",
      node_decremental = "<BS>",
      scope_incremental = "<TAB>"
    }
  },
  indent = {
    enable = true
  }
})

vim.wo.foldmethod = "expr";
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"

vim.wo.foldlevel = 99;
