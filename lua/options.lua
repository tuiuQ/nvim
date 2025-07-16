require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.lua.treesitter.foldexpr()"
vim.opt.foldenable = false
