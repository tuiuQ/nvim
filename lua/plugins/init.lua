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

  {
    "mg979/vim-visual-multi",
    event = "VeryLazy",
    init = function()
      -- 防止与系统 <C-n> 冲突，可按需调整
      vim.g.VM_default_mappings = 1
      vim.g.VM_mouse_mappings = 0
    end,
  },

  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = true,   -- 默认键位 ys/cs/ds
  },

  {
    "mikavilpas/yazi.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>fy", "<cmd>Yazi<cr>", desc = "Yazi 文件管理器" },
    },
    opts = {
      open_for_directories = true,  -- netrw 替代
      floating_window_scaling_factor = 0.9,
    },
  },

  -- {
  --   "smoka7/multicursors.nvim",
  --   event = "VeryLazy",
  --   dependencies = {
  --     'nvimtools/hydra.nvim',
  --   },
  --   opts = {},
  --   cmd = { 'MCstart', 'MCvisual', 'MCclear', 'MCpattern', 'MCvisualPattern', 'MCunderCursor' },
  --   keys = {
  --     {
  --       mode = { 'v', 'n' },
  --       '<C-n>',
  --       '<cmd>MCstart<cr>',
  --       desc = 'Create a selection for selected text or word under the cursor',
  --     },
  --   },
  -- },
  --
  -- {
  --   "mg979/vim-visual-multi",
  --   event = "VeryLazy",
  -- },

  -- {
  --   "brenton-leighton/multiple-cursors.nvim",
  --   event = "VeryLazy",
  --   config = true,   -- 默认键位已绑定
  -- },
  {
    'vscode-neovim/vscode-multi-cursor.nvim',
    event = 'VeryLazy',
    cond = not not vim.g.vscode,
    opts = {},
  }

}
