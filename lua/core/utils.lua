local setKeymap = vim.keymap.set
local opt = vim.opt
local keymapsConfig = require("core.keymappings")
local optionsConfig = require("core.options")
local M = {}

M.loadKeymapsConfig = function(moduleName, loaded)
	M.mode_adapters = keymapsConfig.mode_adapters
	M.generic_opts = keymapsConfig.generic_opts

	loaded(keymapsConfig[moduleName])
end

M.keymap = {
	load = function (moduleName)
		M.loadKeymapsConfig(moduleName, M.parseMap)
	end
}

M.load_default_options = function()
	for key, value in pairs(optionsConfig.default_options) do
		opt[key] = value
	end
end

M.parseMap = function(keymap)
	for mode, map in pairs(keymap) do
		for key, action in pairs(map) do
			setKeymap(
				M.mode_adapters[mode],
				key,
				action,
				M.generic_opts[mode]
			)
		end
	end
end

M.LspHandlerSetup = function()
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, {
      texthl = sign.name,
      text = sign.text,
      numhl = ""
    })
  end

  local config = {
    virtual_text = false,
    signs = {
      active = signs
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = ""
    }

  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
end

return M
