vim.keymap.set("n", "<C-c>", vim.cmd.nohl)

-- Move lines easily
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- Leave selection when moving code left and right
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Terminal
vim.keymap.set("n", "Th", ":split | :term<CR>")

-- Tabs
vim.keymap.set("n", "tn", ":tabnew<CR>")
vim.keymap.set("n", "tN", ":-tabnew<CR>")
vim.keymap.set("n", "H", ":tabprev<CR>")
vim.keymap.set("n", "L", ":tabnext<CR>")

vim.keymap.set("n", "<C-->", ":vert :res -5<CR>")
vim.keymap.set("n", "<C-=>", ":vert :res +5<CR>")
vim.keymap.set("n", "<C-A-->", ":res -5<CR>")
vim.keymap.set("n", "<C-A-=>", ":res +5<CR>")
