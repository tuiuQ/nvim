local lsp = {}

lsp["neovim/nvim-lspconfig"] = {};

lsp["williamboman/mason.nvim"] = {
  config = function ()
    require("modules.config.mason")
  end
}
lsp["williamboman/mason-lspconfig.nvim"] = {}

return lsp;