local keymap = vim.keymap.set

keymap("n", ";", ":")
keymap("n", "S", "<cmd>w<CR>")
keymap("n", "Q", "<cmd>q<CR>")
keymap({ "n", "v" }, "J", "5j")
keymap({ "n", "v" }, "K", "5k")
keymap({ "n", "v" }, "H", "5h")
keymap({ "n", "v" }, "L", "5l")

keymap("n", "<", "<<")
keymap("n", ">", ">>")
keymap("v", "<", "<gv", { noremap = true, silent = true, desc = "Decrease indent in visula mode" })
keymap("v", ">", ">gv", { noremap = true, silent = true, desc = "Decrease indent in visula mode" })

--- Better window navigation
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-l>", "<C-w>l")

--- Toggle Explorer
keymap("n", "<A-1>", "<cmd>Neotree toggle<CR>")

--- Clear highlights
keymap("n", "<ESC><ESC>", "<cmd>nohlsearch<CR>")

--- Plugins
--- BufferLine
keymap("n", "<TAB>", "<cmd>BufferLineCycleNext<CR>")
keymap("n", "<S-TAB>", "<cmd>BufferLineCyclePrev<CR>")
keymap("n", "<LEADER>x", "<cmd>bdelete<CR>")

--- Terminal
keymap({ "n", "t" }, "<A-`>", "<cmd>ToggleTerm<CR>")
keymap("t", "<ESC><ESC>", "<C-\\><C-n>")


