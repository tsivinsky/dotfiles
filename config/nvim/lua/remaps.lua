local function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

local function nmap(shortcut, command)
  map("n", shortcut, command)
end

local function vmap(shortcut, command)
  map("v", shortcut, command)
end

-- Quickly save/quit vim
nmap("<leader>w", ":w<CR>")
nmap("<leader>q", ":q<CR>")

-- Move line under the cursor up and down
nmap("<A-k>", ":m .-2<CR>==")
nmap("<A-j>", ":m .+1<CR>==")
vmap("K", ":m '<-2<CR>gv=gv")
vmap("J", ":m '>+1<CR>gv=gv")

-- Remove search highlighting
nmap("<leader>nh", ":nohl<CR>")

-- Escape from terminal
map("t", "<ESC>", "<C-\\><C-n>")

-- Open splits
nmap("<leader>sv", ":vs<CR>")
nmap("<leader>sh", ":sp<CR>")

-- Move focus between splits
nmap("<leader>h", "<C-w>h")
nmap("<leader>j", "<C-w>j")
nmap("<leader>k", "<C-w>k")
nmap("<leader>l", "<C-w>l")

-- Resize splits
nmap("<C-j>", ":resize -2<CR>")
nmap("<C-k>", ":resize +2<CR>")
nmap("<C-h>", ":vert resize -10<CR>")
nmap("<C-l>", ":vert resize +10<CR>")

-- File Tree
nmap("<leader>b", ":NvimTreeToggle<CR>")

-- Telescope
nmap("<leader>p", ":Telescope<CR>")
nmap("<leader>f", ":Telescope find_files<CR>")

-- LSP
nmap("K", ":lua vim.lsp.buf.hover()<CR>")
nmap("gd", ":lua vim.lsp.buf.definition()<CR>")
nmap("gr", ":lua vim.lsp.buf.references()<CR>")
nmap("<leader>.", ":lua vim.lsp.buf.code_action()<CR>")

-- Tabs
nmap("<leader>1", ":BufferGoto 1<CR>")
nmap("<leader>2", ":BufferGoto 2<CR>")
nmap("<leader>3", ":BufferGoto 3<CR>")
nmap("<leader>4", ":BufferGoto 4<CR>")
nmap("<leader>5", ":BufferGoto 5<CR>")
nmap("<leader>6", ":BufferGoto 6<CR>")
nmap("<leader>7", ":BufferGoto 7<CR>")
nmap("<leader>8", ":BufferGoto 8<CR>")
nmap("<leader>9", ":BufferGoto 9<CR>")
nmap("<leader>e", ":BufferClose<CR>")
