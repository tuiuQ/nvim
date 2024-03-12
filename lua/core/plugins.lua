local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
	require("plugins.nvim-tree"),
	require("plugins.colorscheme"),
	require("plugins.treesitter"),
	require("plugins.editor"),
	require("plugins.statusline"),
	require("plugins.tabline"),
	require("plugins.telescope"),
  require("plugins.lspconfig").config,
  require("plugins.mason"),
  require("plugins.nvim-cmp"),
  require("plugins.indent"),
  require('plugins.wilder'),
  require('plugins.winbar'),
  require('plugins.notify'),
  require('plugins.joshuto')
}, {
  ui = {
      border = "double",
      style = "minimal",
      icons = {
        cmd = "",
        config = "",
        event = "󰡱",
        ft = " ",
        init = " ",
        import = " ",
        keys = " ",
        lazy = "󰒲 ",
        loaded = "●",
        not_loaded = "○",
        plugin = " ",
        runtime = " ",
        require = "󰢱 ",
        source = " ",
        start = "",
        task = "✔ ",
        list = {
          "●",
          "➜",
          "★",
          "‒",
        },
      },
    }
})
