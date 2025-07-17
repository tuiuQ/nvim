-- ~/.config/nvim/lua/plugins/avante.lua
return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false,
  build = "make",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
    "stevearc/dressing.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    provider = "openai",
    auto_suggestions_provider = "openai",
    providers = {
      openai = {
        endpoint = "https://api.moonshot.cn/v1",
        model = "kimi-k2-0711-preview",
        timeout = 30000,
        api_key_name = "AVANTE_OPENAI_API_KEY",
        -- 所有请求体字段 ↓ 必须放在 extra_request_body
        extra_request_body = {
          temperature = 0.6,
          max_tokens = 128000,
        },
      },
    },
    behaviour = {
      auto_suggestions = false,
      auto_set_keymaps = true,
      auto_apply_diff_after_generation = false,
    },
    windows = { position = "right", width = 40 },
  },
  keys = {
    { "<C-i>", "<cmd>AvanteEdit<cr>", desc = "Avante Edit" },
    { "<C-u>", "<cmd>AvanteToggle<cr>", desc = "Avante Toggle" },
  },
}
