vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.autoindent = true

vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = true
vim.o.swapfile = true
vim.o.encoding = "utf-8"
vim.o.hidden = true
vim.o.writebackup = false
vim.o.cmdheight = 2
vim.o.updatetime = 300
vim.o.shortmess = "filnxtToOFc"
vim.o.mouse = "a"
vim.o.cursorline = true
vim.o.clipboard = "unnamedplus"
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.termguicolors = true
vim.o.signcolumn = "yes"

vim.g.mapleader = " "

vim.cmd([[
  let ayucolor = "mirage"
  colorscheme ayu
]])

-- Remove highlighting in signcolumn
vim.cmd("highlight clear SignColumn")
