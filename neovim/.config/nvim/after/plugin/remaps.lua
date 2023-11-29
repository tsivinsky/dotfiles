local formatting = require("daniil.formatting")

-- Disable different keys and commands
vim.keymap.set({ "n", "i", "v" }, "<PageDown>", "<nop>")
vim.keymap.set({ "n", "i", "v" }, "<PageUp>", "<nop>")
vim.keymap.set({ "n", "i", "v" }, "<F1>", "<nop>")

vim.keymap.set("n", "<leader><leader>", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<C-c>", vim.cmd.nohl)

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
vim.keymap.set("n", "tn", ":tabnew<CR>")
vim.keymap.set("n", "tN", ":-tabnew<CR>")
vim.keymap.set("n", "H", ":tabprev<CR>")
vim.keymap.set("n", "L", ":tabnext<CR>")

-- quickfix
vim.keymap.set("n", "<C-q><C-q>", function()
  if vim.bo.ft == "qf" then
    vim.cmd(":cclose")
  else
    vim.cmd(":copen")
  end
end)
vim.keymap.set("n", "<C-q>n", vim.cmd.cnext)
vim.keymap.set("n", "<C-q>N", vim.cmd.cprevious)

-- zenmode
vim.keymap.set("n", "<leader>z", require("daniil.zenmode").toggle)
