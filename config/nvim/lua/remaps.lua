local function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

local function nmap(shortcut, command)
  map("n", shortcut, command)
end

local function vmap(shortcut, command)
  map("v", shortcut, command)
end

local function imap(shortcut, command)
  map("i", shortcut, command)
end

-- Quickly save/quit vim
nmap("<leader>w", ":w<CR>")
nmap("<leader>q", ":q<CR>")
nmap("<leader>e", ":bdelete<CR>")

-- Move line under the cursor up and down
nmap("<C-k>", ":m .-2<CR>==")
nmap("<C-j>", ":m .+1<CR>==")
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

-- File tree
nmap("<leader>b", ":NvimTreeToggle<CR>")

-- Telescope
nmap("<leader>p", ":Telescope<CR>")
nmap("<leader>f", ":Telescope find_files<CR>")

-- LSP
nmap("K", "<cmd>lua vim.lsp.buf.hover()<CR>")
nmap("gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
nmap("<leader>.", "<cmd>lua vim.lsp.buf.code_action()<CR>")
nmap("<F2>", "<cmd>lua vim.lsp.buf.rename()<CR>")

-- Tabs
nmap("<leader>1", ":BufferLineGoToBuffer 1<CR>")
nmap("<leader>2", ":BufferLineGoToBuffer 2<CR>")
nmap("<leader>3", ":BufferLineGoToBuffer 3<CR>")
nmap("<leader>4", ":BufferLineGoToBuffer 4<CR>")
nmap("<leader>5", ":BufferLineGoToBuffer 5<CR>")
nmap("<leader>6", ":BufferLineGoToBuffer 6<CR>")
nmap("<leader>7", ":BufferLineGoToBuffer 7<CR>")
nmap("<leader>8", ":BufferLineGoToBuffer 8<CR>")
nmap("<leader>9", ":BufferLineGoToBuffer 9<CR>")

-- Terminal
nmap("<leader>t", ":ToggleTerminal<CR>")

-- Git
nmap("<leader>gg", ":G<CR>")
