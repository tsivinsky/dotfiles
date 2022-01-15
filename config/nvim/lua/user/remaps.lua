local utils = require("user.utils")
local nmap = utils.nmap

-- Move focus between splits
nmap("<leader>h", "<C-w>h") -- Leader+h - focus left split
nmap("<leader>l", "<C-w>l") -- Leader+l - focus right split
nmap("<leader>j", "<C-w>j") -- Leader+j - focus split under focused one
nmap("<leader>k", "<C-w>k") -- Leader+k - focus split above focused one

-- Resize splits
nmap("<C-j>", ":resize -2<CR>") -- Control+j - decrease split height
nmap("<C-k>", ":resize +2<CR>") -- Control+k - increase split height
nmap("<C-h>", ":vert resize -5<CR>") -- Control+h - decrease split width
nmap("<C-l>", ":vert resize +5<CR>") -- Control+l - increase split width

-- Open splits
nmap("<leader>sv", ":vs<CR>") -- Leader+s+v - split current window vertically
nmap("<leader>sh", ":split<CR>") -- Leader+s+h - split current window horizontally

-- Tabs
nmap("H", ":tabprev<CR>") -- Shift+h - open previous tab
nmap("L", ":tabnext<CR>") -- Shift+l - open next tab
nmap("<C-t>", ":tabnew<CR>") -- Control+t - open new empty tab
nmap("<C-w>", ":tabclose<CR>") -- Control+w - close current tab
nmap("<A-h>", ":-tabmove<CR>") -- Switch current tab with previous one
nmap("<A-l>", ":+tabmove<CR>") -- Switch current tab with next one

-- Telescope
nmap("<leader>f", ":Telescope find_files<CR>") -- Leader+f - find files with Telescope
nmap("<leader>p", ":Telescope<CR>") -- Leader+p - open Telescope as command palette

-- LSP
nmap("gd", ":lua vim.lsp.buf.definition()<CR>") -- g+d - Go to definition
nmap("gr", ":lua vim.lsp.buf.references()<CR>") -- g+r - Show references
nmap("K", ":lua vim.lsp.buf.hover()<CR>") -- Shift+k - Show documentation in hover window
nmap("<F2>", ":lua vim.lsp.buf.rename()<CR>") -- F2 - Rename thing under the cursor
nmap("<leader>d", ':lua vim.diagnostic.open_float(nil, {focus = false, scope = "cursor"})<CR>') -- Leader+d - show diagnostics in float window

-- Git
nmap("<leader>gg", ":G<CR>") -- Leader+g+g - open vim-fugitive window
