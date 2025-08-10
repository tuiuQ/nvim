return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional for icons
  keys = {
    { "<leader>xx", function() require("trouble").toggle() end, desc = "Toggle Trouble" },
    { "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end, desc = "Workspace Diagnostics" },
    { "<leader>xd", function() require("trouble").toggle("document_diagnostics") end, desc = "Document Diagnostics" },
    { "<leader>xq", function() require("trouble").toggle("quickfix") end, desc = "Quickfix List" },
    { "<leader>xl", function() require("trouble").toggle("loclist") end, desc = "Location List" },
    { "gR", function() require("trouble").toggle("lsp_references") end, desc = "LSP References" },
  },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- e.g.
    -- icons = false,
  },
}
