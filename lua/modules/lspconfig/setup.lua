local servers = {
  lua_ls = require "modules.lspconfig.lua"
}

local lspconfig = require("lspconfig")

for name, opts in pairs(servers) do
  lspconfig[name].setup(opts)
end