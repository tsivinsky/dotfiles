local M = {
  history = {},
}

M.close_tab = function()
  local wins = vim.api.nvim_tabpage_list_wins(0)

  for _, win in ipairs(wins) do
    local bufnr = vim.api.nvim_win_get_buf(win)
    local is_modified = vim.api.nvim_buf_get_option(bufnr, "modified")

    if is_modified then
      local bufname = vim.fn.bufname(bufnr)
      print(bufname .. " is not saved")
      return
    end
  end

  table.insert(M.history, vim.fn.bufnr("%"))
  vim.cmd("tabclose")
end

M.restore_tab = function()
  local buflen = #M.history

  if buflen == 0 then
    print("No buffers remaining")
    return
  end

  local buf = M.history[buflen]
  vim.cmd("tabnew +" .. tostring(buf) .. "buf")

  table.remove(M.history, buflen)
end

return M
