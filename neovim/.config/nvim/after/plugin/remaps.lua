local ts = require("telescope.builtin")
local u = require("daniil.utils")
local git = require("daniil.git")
local ls = require("luasnip")

-- General keymaps
vim.keymap.set("n", "<C-c>", ":nohl<CR>")

-- Quickfix and location list remaps
vim.keymap.set("n", "<C-q>", u.toggle_qflist)
vim.keymap.set("n", "<leader>q", u.toggle_locationlist)

-- Disable different keys and commands
vim.keymap.set({ "n", "i", "v" }, "<PageDown>", "<nop>")
vim.keymap.set({ "n", "i", "v" }, "<PageUp>", "<nop>")
vim.keymap.set({ "n", "i", "v" }, "<F1>", "<nop>")
vim.keymap.set("n", "q:", "<nop>")

-- Move focus between splits
vim.keymap.set("n", "<leader>h", "<C-w>h")
vim.keymap.set("n", "<leader>l", "<C-w>l")
vim.keymap.set("n", "<leader>j", "<C-w>j")
vim.keymap.set("n", "<leader>k", "<C-w>k")

-- Resize splits
vim.keymap.set("n", "<C-h>", ":vert :res -10<CR>")
vim.keymap.set("n", "<C-l>", ":vert :res +10<CR>")
vim.keymap.set("n", "<C-j>", ":res -5<CR>")
vim.keymap.set("n", "<C-k>", ":res +5<CR>")

-- Move lines easily
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- Leave selection when moving code left and right
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Terminal
vim.keymap.set("n", "Th", ":split | :term<CR>")
vim.keymap.set("n", "Tv", ":vs | :term<CR>")

-- Tabs
vim.keymap.set("n", "H", ":tabprev<CR>")
vim.keymap.set("n", "L", ":tabnext<CR>")
vim.keymap.set("n", "tn", ":tabnew<CR>")
vim.keymap.set("n", "tN", ":-tabnew<CR>")
vim.keymap.set("n", "tf", function()
  require("daniil.tabs").find_tab()
end)
vim.keymap.set("n", "<A-h>", ":-tabmove<CR>")
vim.keymap.set("n", "<A-l>", ":+tabmove<CR>")

-- Nvim Tree
vim.keymap.set("n", "<leader><leader>", ":NvimTreeToggle<CR>")

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
vim.keymap.set("i", "<C-i>", vim.lsp.buf.signature_help)

-- Diagnostics
vim.keymap.set("n", "<leader>ee", function()
  vim.diagnostic.open_float(nil, { focus = false, scope = "line" })
end)
vim.keymap.set("n", "<leader>ey", function()
  u.copy_diagnostic_message()
end)
vim.keymap.set("n", "<leader>en", function()
  vim.diagnostic.goto_next({ float = false })
end)
vim.keymap.set("n", "<leader>eN", function()
  vim.diagnostic.goto_prev({ float = false })
end)

-- Git
vim.keymap.set("n", "<leader>gg", ":G<CR>")
vim.keymap.set("n", "<leader>go", function()
  git.open_commit_on_github()
end)

-- Luasnip
local function next_choice()
  if ls.jumpable(1) then
    ls.jump(1)
  end
end
local function prev_choice()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end
vim.keymap.set("i", "<C-l>", next_choice, { noremap = true, silent = true })
vim.keymap.set("s", "<C-l>", next_choice, { noremap = true, silent = true })
vim.keymap.set("i", "<C-h>", prev_choice, { noremap = true, silent = true })
vim.keymap.set("s", "<C-h>", prev_choice, { noremap = true, silent = true })
