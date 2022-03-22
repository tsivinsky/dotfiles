local utils = require("user.utils")
local nmap = utils.nmap
local vmap = utils.vmap
local tmap = utils.tmap
local imap = utils.imap

-- General keymaps
nmap("<C-c>", ":nohl<CR>")
nmap("<C-q>", "<C-W>q")

-- Disable PageUp and PageDown keys
nmap("<PageDown>", "<nop>")
imap("<PageDown>", "<nop>")
vmap("<PageDown>", "<nop>")
nmap("<PageUp>", "<nop>")
imap("<PageUp>", "<nop>")
vmap("<PageUp>", "<nop>")

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

-- Move lines easily
vmap("K", ":m '<-2<CR>gv=gv")
vmap("J", ":m '>+1<CR>gv=gv")

-- Leave selection when moving code left and right
vmap("<", "<gv")
vmap(">", ">gv")

-- Terminal
tmap("<ESC>", "<C-\\><C-n>")
nmap("Th", ":split | :term<CR>")
nmap("Tv", ":vs | :term<CR>")

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
nmap("<leader><leader>", ":lua require('nvim-tree').toggle(true, false)<CR>")

-- Telescope
nmap("<leader>ff", ":lua require('telescope.builtin').find_files({ hidden = true })<CR>")
nmap("<leader>fo", ":Telescope lsp_document_symbols<CR>")
nmap("<leader>p", ":Telescope<CR>")

-- LSP
nmap("gd", ":lua vim.lsp.buf.definition()<CR>")
nmap("gr", ":lua vim.lsp.buf.references()<CR>")
nmap("K", ":lua vim.lsp.buf.hover()<CR>")
nmap("<F2>", ":lua vim.lsp.buf.rename()<CR>")
nmap("<leader>.", ":lua vim.lsp.buf.code_action()<CR>")
vmap("<leader>.", ":lua vim.lsp.buf.range_code_action()<CR>")

-- Diagnostics
nmap("<leader>dd", ':lua vim.diagnostic.open_float(nil, {focus = false, scope = "line"})<CR>')
nmap("<leader>dy", ":lua require('user.utils').copy_diagnostic_message()<CR>")
nmap("<leader>dn", ":lua vim.diagnostic.goto_next({ float = false })<CR>")
nmap("<leader>dp", ":lua vim.diagnostic.goto_prev({ float = false })<CR>")
nmap("<leader>do", ":lopen<CR>")

-- Git
nmap("<leader>gg", ":G<CR>")

-- Refactoring
nmap("<leader>ri", ":lua require('user.utils').lsp_organize_imports()<CR>")
