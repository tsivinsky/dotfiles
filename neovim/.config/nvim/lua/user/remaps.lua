local ts = require("telescope.builtin")
local u = require("user.utils")
local git = require("user.git")

-- General keymaps
vim.keymap.set("n", "<C-c>", ":nohl<CR>")
vim.keymap.set("n", "<C-q>", "<C-W>q")

-- Horizontal moving in insert mode
vim.keymap.set("i", "<C-h>", "<Left>")
vim.keymap.set("i", "<C-l>", "<Right>")

-- Disable PageUp and PageDown keys
vim.keymap.set({ "n", "i", "v" }, "<PageDown>", "<nop>")
vim.keymap.set({ "n", "i", "v" }, "<PageUp>", "<nop>")

-- Move focus between splits
vim.keymap.set("n", "<leader>h", "<C-w>h")
vim.keymap.set("n", "<leader>l", "<C-w>l")
vim.keymap.set("n", "<leader>j", "<C-w>j")
vim.keymap.set("n", "<leader>k", "<C-w>k")

-- Resize splits
vim.keymap.set("n", "<C-j>", ":resize -2<CR>")
vim.keymap.set("n", "<C-k>", ":resize +2<CR>")
vim.keymap.set("n", "<C-h>", ":vert resize -5<CR>")
vim.keymap.set("n", "<C-l>", ":vert resize +5<CR>")

-- Move lines easily
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- Leave selection when moving code left and right
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Terminal
vim.keymap.set("t", "<ESC>", "<C-\\><C-n>")
vim.keymap.set("n", "Th", ":split | :term<CR>")
vim.keymap.set("n", "Tv", ":vs | :term<CR>")

-- Tabs
vim.keymap.set("n", "H", ":tabprev<CR>")
vim.keymap.set("n", "L", ":tabnext<CR>")
vim.keymap.set("n", "tn", ":tabnew<CR>")
vim.keymap.set("n", "tN", ":-tabnew<CR>")
vim.keymap.set("n", "tc", function()
  require("user.tabs").close_tab()
end)
vim.keymap.set("n", "tr", function()
  require("user.tabs").restore_tab()
end)
vim.keymap.set("n", "tf", function()
  require("user.tabs").find_tab()
end)
vim.keymap.set("n", "<A-h>", ":-tabmove<CR>")
vim.keymap.set("n", "<A-l>", ":+tabmove<CR>")

-- Nvim Tree
vim.keymap.set("n", "<leader><leader>", function()
  require("nvim-tree").toggle(true, false)
end)

-- Telescope
vim.keymap.set("n", "<leader>f", function()
  ts.find_files({ hidden = true })
end)
vim.keymap.set("n", "<leader>p", function()
  ts.builtin()
end)
vim.keymap.set("n", "<leader>b", function()
  ts.buffers()
end)

-- LSP
vim.keymap.set("n", "gd", function()
  ts.lsp_definitions()
end)
vim.keymap.set("n", "gr", function()
  ts.lsp_references()
end)
vim.keymap.set("n", "K", function()
  vim.lsp.buf.hover()
end)
vim.keymap.set("n", "<F2>", function()
  vim.lsp.buf.rename()
end)
vim.keymap.set("n", "<leader>.", function()
  vim.lsp.buf.code_action()
end)
vim.keymap.set("v", "<leader>.", function()
  vim.lsp.buf.range_code_action()
end)

-- Diagnostics
vim.keymap.set("n", "<leader>dd", function()
  vim.diagnostic.open_float(nil, { focus = false, scope = "line" })
end)
vim.keymap.set("n", "<leader>dy", function()
  u.copy_diagnostic_message()
end)
vim.keymap.set("n", "<leader>dn", function()
  vim.diagnostic.goto_next({ float = false })
end)
vim.keymap.set("n", "<leader>dp", function()
  vim.diagnostic.goto_prev({ float = false })
end)
vim.keymap.set("n", "<leader>do", ":lopen<CR>")

-- Git
vim.keymap.set("n", "<leader>gg", ":G<CR>")
vim.keymap.set("n", "<leader>go", function()
  git.open_commit_on_github()
end)

-- Refactoring
vim.keymap.set("n", "<leader>ri", function()
  u.lsp_organize_imports()
end)
vim.keymap.set("n", "<leader>rf", function()
  vim.lsp.buf.formatting_sync()
end)
