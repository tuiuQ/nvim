return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
      ensure_installed = {
        "c", "lua", "vim", "vimdoc", "query", "python", "go", "rust",
        "javascript", "typescript", "tsx", "html", "css", "json", "yaml",
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
      fold = { enable = true },
  	},
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
  },
}
