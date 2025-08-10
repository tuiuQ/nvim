return {
  {
    "mason-org/mason.nvim",
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      ensure_installed = { "pyright", "ts_ls", "rust_analyzer", "lua_ls", "vimls" }, -- 确保安装这些语言服务器
    },
  },
  {
    "neovim/nvim-lspconfig",
    event = "User FilePost",
    config = function()
      require("config.lspconfig").setup()
    end,
  },
}
