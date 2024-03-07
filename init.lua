require("core")
local keymap = vim.keymap.set

vim.o.number = true
vim.o.relativenumber = true
vim.o.termguicolors = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2


keymap("n", "S", ":w<CR>")
keymap("n", "Q", ":q<CR>")

keymap("n", "J", "5j")
keymap("n", "K", "5k")
keymap("n", "H", "5h")
keymap("n", "L", "5l")

keymap("v", "J", "5j")
keymap("v", "K", "5k")
keymap("v", "H", "5h")
keymap("v", "L", "5l")

--- Plugins
keymap("n", "<leader>e", ":NvimTreeToggle<CR>")
