-- lua/config/lspconfig.lua
local M = {}
local map = vim.keymap.set

M.on_attach = function(_, bufnr)
  local function opts(desc)
    return {
      buffer = bufnr,
      desc = "LSP " .. desc,
    }
  end

  map("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
  map("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
  map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts("Add workspace folder"))
  map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts("Remove workspace folder"))
  map("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts("List workspace folders"))
  map("n", "<leader>D", vim.lsp.buf.type_definition, opts("Go to type definition"))
  map("n", "<F2>", vim.lsp.buf.rename, opts("Rename"))
end

M.on_init = function(client, _)
  if client.supports_method("textDocument/semanticTokens") then
    client.server_capabilities.semanticTokensProvider = nil
  end
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

M.setup = function()
  local mason = require("mason")
  local lspconfig = require("lspconfig")
  local mason_lspconfig = require("mason-lspconfig")
	local mason_config = require("config.lspconfig")

  mason.setup(mason_config)

  mason_lspconfig.setup({
    ensure_installed = {
      "pyright",
      "ts_ls",
      "rust_analyzer",
      "lua_ls",
      "vimls",
    },
    handlers = {
      function(server_name)
        lspconfig[server_name].setup({
          on_attach = M.on_attach,
          on_init = M.on_init,
          capabilities = M.capabilities,
        })
      end,
    },
  })

  local lua_lsp_settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      workspace = {
        library = {
          vim.fn.expand("$VIMRUNTIME/lua"),
          vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types",
          vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
          "${3rd}/luv/library",
        },
      },
    },
  }

  lspconfig.lua_ls.setup({
    settings = lua_lsp_settings,
    capabilities = M.capabilities,
    on_init = M.on_init,
    on_attach = M.on_attach,
  })
end

return M
