local formatting = require("daniil.formatting")

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

-- Tabs
vim.keymap.set("n", "tn", ":tabnew<CR>")
vim.keymap.set("n", "tN", ":-tabnew<CR>")
vim.keymap.set("n", "H", ":tabprev<CR>")
vim.keymap.set("n", "L", ":tabnext<CR>")

-- quickfix
local function is_quickfix_opened()
  local wins = vim.api.nvim_tabpage_list_wins(0)
  for _, win in ipairs(wins) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.bo[buf].buftype == "quickfix" then
      return true
    end
  end

  return false
end
vim.keymap.set("n", "<leader>qq", function()
  if is_quickfix_opened() then
    vim.cmd.cclose()
  else
    vim.cmd.copen()
  end
end)
vim.keymap.set("n", "<leader>qn", vim.cmd.cnext)
vim.keymap.set("n", "<leader>qN", vim.cmd.cprevious)
