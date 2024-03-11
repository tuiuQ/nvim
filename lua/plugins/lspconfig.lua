local M = {}

M.on_attach = function(client, bufnr)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
--- M.capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

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

local documentation_window_open = false
local documentation_window_open_index = 0
M.show_documentation = function()
  documentation_window_open_index = documentation_window_open_index + 1
  local current_index = documentation_window_open_index
  documentation_window_open = true
  vim.defer_fn(function()
    if current_index == documentation_window_open_index then
      documentation_window_open = false
    end
  end, 500)
  vim.lsp.buf.hover()
end

M.setKeymapWithBuf = function(keymaps, buf)
  local opts = {
    buffer = buf,
    noremap = true,
    nowait = true
  }

  for key, action in pairs(keymaps) do
    vim.keymap.set('n', key, action, opts)
  end
end

M.config = {
  'neovim/nvim-lspconfig',
  dependencies = {
    "folke/neodev.nvim",
  },
  config = function()
    require("lsp")
    require("core.utils").LspHandlerSetup()

    vim.api.nvim_create_autocmd('LspAttach', {
      desc = 'LSP actions',
      callback = function(event)
	      local keymap = {
		      ["<leader>h"] = function()
			      M.show_documentation()
		      end,
		      ["gd"] = function()
			      vim.lsp.buf.definition()
		      end,
		      ["gD"] = ":tab sp<CR><cmd>lua vim.lsp.buf.definition()<CR>",
		      ["gi"] = function()
			      vim.lsp.buf.implementation()
		      end,
		      ["go"] = function()
			      vim.lsp.buf.type_definition()
		      end,
		      ["gr"] = function()
			      vim.lsp.buf.references()
		      end,
		      ["<leader>rn"] = function()
			      vim.lsp.buf.rename()
		      end,
		      ["<leader>aw"] = function()
			      vim.lsp.buf.code_action()
		      end,
		      ["<leader>,"] = function()
			      vim.lsp.buf.code_action()
		      end,
		      ["<leader>-"] = function()
			      vim.diagnostic.goto_prev()
		      end,
		      ["<leader>="] = function()
			      vim.diagnostic.goto_next()
		      end
	      }

        M.setKeymapWithBuf(keymap, event.buf)
      end
    })
  end
}

return M
