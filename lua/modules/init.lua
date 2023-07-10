local utils = require("core.utils")
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

require("lazy").setup({
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    config = function ()
      require("nvim-tree").setup();
      utils.load_keymaps(utils.load_config "mappings/plugins/nvimtree")
    end
  },
  {
    'projekt0n/github-nvim-theme',
    lazy = false,
    priority = 1000,
    config = function()
      require('github-theme').setup({})
      vim.cmd('colorscheme github_dark')
    end,
  }
})
