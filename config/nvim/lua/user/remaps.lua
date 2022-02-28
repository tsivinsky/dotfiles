local utils = require("user.utils")
local nmap = utils.nmap
local vmap = utils.vmap
local tmap = utils.tmap

nmap("<C-c>", ":nohl<CR>")

-- Move focus between splits
nmap("<leader>h", "<C-w>h")
nmap("<leader>l", "<C-w>l")
nmap("<leader>j", "<C-w>j")
nmap("<leader>k", "<C-w>k")

-- Resize splits
nmap("<C-j>", ":resize -2<CR>")
nmap("<C-k>", ":resize +2<CR>")
nmap("<C-h>", ":vert resize -5<CR>")
nmap("<C-l>", ":vert resize +5<CR>")

-- Open splits
nmap("<leader>sv", ":vs<CR>")
nmap("<leader>sh", ":split<CR>")

-- Move lines easily
nmap("<A-k>", ":m .-2<CR>==")
nmap("<A-j>", ":m .+1<CR>==")
vmap("K", ":m '<-2<CR>gv=gv")
vmap("J", ":m '>+1<CR>gv=gv")

-- Leave selection when moving code left and right
vmap("<", "<gv")
vmap(">", ">gv")

vim.cmd("imap <C-_> <ESC>gccA")

-- Terminal
tmap("<ESC>", "<C-\\><C-n>")
nmap("Th", ":lua require('user.utils').open_terminal()<CR>")
nmap("Tv", ":lua require('user.utils').open_terminal(true)<CR>")

-- Tabs
nmap("H", ":tabprev<CR>")
nmap("L", ":tabnext<CR>")
nmap("tn", ":tabnew<CR>")
nmap("tN", ":-tabnew<CR>")
nmap("tc", ":lua require('user.tabs').close_tab()<CR>")
nmap("tr", ":lua require('user.tabs').restore_tab()<CR>")
nmap("<A-h>", ":-tabmove<CR>")
nmap("<A-l>", ":+tabmove<CR>")

-- Nvim Tree
nmap("<leader>b", ":lua require('nvim-tree').toggle()<CR>")

-- Telescope
nmap("<leader>f", ":Telescope find_files<CR>")
nmap("<leader>p", ":Telescope<CR>")

-- LSP
nmap("gd", ":lua vim.lsp.buf.definition()<CR>")
nmap("gr", ":lua vim.lsp.buf.references()<CR>")
nmap("K", ":lua vim.lsp.buf.hover()<CR>")
nmap("<F2>", ":lua vim.lsp.buf.rename()<CR>")
nmap("<leader>.", ":lua vim.lsp.buf.code_action()<CR>")
vmap("<leader>.", ":lua vim.lsp.buf.range_code_action()<CR>")

-- Diagnostics
nmap("<leader>dd", ':lua vim.diagnostic.open_float(nil, {focus = false, scope = "cursor"})<CR>')
nmap("<leader>dy", ":lua require('user.utils').copy_diagnostic_message()<CR>")
nmap("<leader>dn", ":lua vim.diagnostic.goto_next({ float = false })<CR>")
nmap("<leader>dp", ":lua vim.diagnostic.goto_prev({ float = false })<CR>")
nmap("<leader>do", ":lopen<CR>")

-- Git
nmap("<leader>gg", ":G<CR>")
