require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map({ "n", "v" }, "S", "<cmd>w<CR>")
map({ "n", "v" }, "Q", "<cmd>q<CR>")
map({ "n", "v" }, "J", "5j")
map({ "n", "v" }, "K", "5k")
map({ "n", "v" }, "H", "5h")
map({ "n", "v" }, "L", "5l")

--- Plugins
map({ "n", "v" }, "<A-1>", "<cmd>NvimTreeToggle<CR>")
map({ "n", "t" }, "<A-`>", function ()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, {
  desc ="terminal toggleable horizontal term"
})
map({ "n", "v" }, "<A-h>", "<cmd>lua vim.lsp.buf.hover()<CR>", {
  desc = "Displays hover information"
})
