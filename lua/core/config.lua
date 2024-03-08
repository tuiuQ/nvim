return {
  servers = {
    "lua_ls",
    "tsserver",
    "intelephense"
  },
  mason_servers = {
    ensure_installed = {
      "lua-language-server",
      "typescript-language-server",
      "intelephense"
    }
  }
}
