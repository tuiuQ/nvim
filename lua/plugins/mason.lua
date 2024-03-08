return {
  {
    "williamboman/mason.nvim",
    opts = require("core.config").mason_servers,
    config = function ()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        },
        ensure_installed = require("core.config").mason_servers.ensure_installed,
      })
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      PATH = "prepend",
      ensure_installed = require("core.config").servers,
      automatic_installation = true
    }
  }
}
