local utils = require "core.utils";
local runtime_path = vim.split(package.path, ";");
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

return {
  settings = {
    runtime = {
      version = "LuaJIT",
      path = runtime_path,
    },
    diagnostics = {
      globals = { 'vim' }
    },
    workspace = {
      library = vim.api.nvim_get_runtime_file("", true),
    },
    telemetry = {
      enable = false
    }
  },
  on_attach = function(_, bufnr)
    local function set_buf_keymap(...)
      vim.api.nvim_set_keymap(bufnr, ...)
    end
    utils.maplsp(set_buf_keymap)
  end
}
