local utils = require("user.utils")
local nmap = utils.nmap
local vmap = utils.vmap
local tmap = utils.tmap

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

-- Move lines easily
nmap("<A-k>", ":m .-2<CR>==") -- Alt+k - switch current line and line above it
nmap("<A-j>", ":m .+1<CR>==") -- Alt+j - same as above mapping but the other way
vmap("K", ":m '<-2<CR>gv=gv") -- Shift+k - in visual mode move selected lines up
vmap("J", ":m '>+1<CR>gv=gv") -- Shift+j - same as above mapping but the other way

-- Leave selection when moving code left and right
vmap("<", "<gv")
vmap(">", ">gv")

-- Terminal
tmap("<ESC>", "<C-\\><C-n>") -- Escape - in terminal mode, quit to normal mode
nmap("Th", ":lua require('user.cmds').open_terminal()<CR>") -- Shift+t - open terminal in horizontal split
nmap("Tv", ":lua require('user.cmds').open_terminal(true)<CR>") -- Shift+t+v - open terminal in vertical split

-- Tabs
nmap("H", ":tabprev<CR>") -- Shift+h - open previous tab
nmap("L", ":tabnext<CR>") -- Shift+l - open next tab
nmap("tn", ":tabnew<CR>") -- Control+t - open new empty tab
nmap("tc", ":lua require('user.tabs').close_tab()<CR>") -- Control+w - close current tab
nmap("tr", ":lua require('user.tabs').restore_tab()<CR>") -- Control+Shift+t - reopen closed tab
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
nmap("<leader>.", ":lua vim.lsp.buf.code_action()<CR>") -- Leader+. - show code actions to run
vmap("<leader>.", ":lua vim.lsp.buf.range_code_action()<CR>") -- same as above but for visual mode
nmap("<leader>dd", ':lua vim.diagnostic.open_float(nil, {focus = false, scope = "cursor"})<CR>') -- Leader+d - show diagnostics in float window
nmap("<leader>dy", ":lua require('user.cmds').copy_diagnostic_message()<CR>") -- Leader+d+c - copy diagnostic message

-- Git
nmap("<leader>gg", ":G<CR>") -- Leader+g+g - open vim-fugitive window

-- Zen mode
nmap("<leader>z", ":ZenMode<CR>") -- Leader+z - toggle zen mode
