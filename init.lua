vim.opt.number = true
vim.opt.relativenumber = true

local keymap = vim.keymap.set

keymap("n", ";", ":")
keymap("n", "S", "<cmd>w<CR>")
keymap("n", "Q", "<cmd>q<CR>")
keymap({ "n", "v" }, "J", "5j")
keymap({ "n", "v" }, "K", "5k")
keymap({ "n", "v" }, "H", "5h")
keymap({ "n", "v" }, "L", "5l")

