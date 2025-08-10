-- Set global variables
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.termguicolors = true

-- Set global options
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"
vim.opt.autowrite = false
vim.opt.autowriteall = false
vim.opt.backup = false
vim.opt.fileencoding = "utf-8"
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.timeoutlen = 300
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- Function to set options for file buffers
function _G.set_buffer_options()
    vim.opt_local.number = true
    vim.opt_local.relativenumber = true
    vim.opt_local.foldmethod = 'expr'
    vim.opt_local.foldexpr = 'nvim_treesitter#foldexpr()'
    vim.opt_local.foldlevel = 99
end

