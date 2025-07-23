require("nvchad.configs.lspconfig").defaults()


local servers = { "html", "cssls", "ts_ls", "bashls", "clangd", "biome", "yamlls", "vue_ls", "tailwindcss", "jsonls", "gh_actions_ls" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
