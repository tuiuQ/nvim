require("core.plugins")
local utils = require("core.utils")

utils.keymap.load("basic")
vim.keymap.set("n", "R", ":Joshuto<CR>")
utils.load_default_options()
