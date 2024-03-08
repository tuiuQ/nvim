return {
  servers = {
    "lua_ls",
    "tsserver"
  },
  mason_servers = {
    ensure_installed = {
      "lua-language-server",
      "typescript-language-server"
    }
  }
}
