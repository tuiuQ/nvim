local lspconfig = require("lspconfig")
local on_attach = require("plugins.lspconfig").on_attach
local capabilities = require("plugins.lspconfig").capabilities
local merge_tb = vim.tbl_deep_extend


local servers = require("core.config").servers

local default_config = {
  on_attach = on_attach,
  capabilities = capabilities
}

for _, lsp in ipairs(servers) do
  local loaded, config = pcall(require, "lsp." .. lsp)
  if loaded then
    lspconfig[lsp].setup(merge_tb("force", default_config, config))
  else
    lspconfig[lsp].setup(default_config)
  end
end
