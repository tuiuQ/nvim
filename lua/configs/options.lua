local M = {}

M.basic = {
  opt = {
    number = true,
    relativenumber = true,
    tabstop = 2,
    softtabstop = 2,
    shiftwidth = 2,
    expandtab = true,
    autoindent = true,
    clipboard = "unnamedplus",
  },
  bo = {
    tabstop = 2,
    softtabstop = 2,
    shiftwidth = 2,
    expandtab = true,
    autoindent = true,
  },
  g = {
    termguicolors = true,
  }
}

return M;
