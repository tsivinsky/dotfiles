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

local function toggle_quickfix()
  if is_quickfix_opened() then
    vim.cmd.cclose()
  else
    vim.cmd.copen()
  end
end

vim.keymap.set("n", "<leader>qq", toggle_quickfix)
vim.keymap.set("n", "<leader>qn", vim.cmd.cnext)
vim.keymap.set("n", "<leader>qN", vim.cmd.cprevious)
