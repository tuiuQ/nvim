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
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function ()
      utils.load_keymaps(utils.load_config("mappings/plugins/telescope"))
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require("lualine").setup()
    end
  },
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require("bufferline").setup()
      utils.load_keymaps(utils.load_config("mappings/plugins/bufferline"))
    end
  },
  {
    "gcmt/wildfire.vim",
    lazy = false,
  },
  {
    "tpope/vim-surround",
    lazy = false,
  },
  {
    "jwarby/antovim",
    lazy = false,
  },
  {
    "mg979/vim-visual-multi",
    lazy = false,
  },
  {
    "kdheepak/lazygit.nvim",
    lazy = false
  }
})
