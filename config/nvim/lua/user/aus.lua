vim.cmd([[
au TextYankPost * silent! lua vim.highlight.on_yank({timeout = 200})
]])
