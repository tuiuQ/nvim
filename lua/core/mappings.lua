local keymap = vim.keymap.set

keymap("n", ";", ":")
keymap("n", "S", "<cmd>w<CR>")
keymap("n", "Q", "<cmd>q<CR>")
keymap({ "n", "v" }, "J", "5j")
keymap({ "n", "v" }, "K", "5k")
keymap({ "n", "v" }, "H", "5h")
keymap({ "n", "v" }, "L", "5l")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-l>", "<C-w>l")

keymap("n", "<A-1>", "<cmd>Neotree toggle<CR>")
