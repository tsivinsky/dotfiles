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

-- Highlight on yank
vim.api.nvim_exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
  augroup end
]], false)

-- Automatically formatting buffer on save
vim.api.nvim_command("autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()")

vim.cmd('command! ToggleBackground lua require("utils").toggleBackground()')
