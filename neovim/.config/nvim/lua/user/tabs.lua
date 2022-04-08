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

M.find_tab = function()
  local tabpages = vim.api.nvim_list_tabpages()
  local tabs = {}
  for _, tabnr in ipairs(tabpages) do
    local winnr = vim.api.nvim_tabpage_get_win(tabnr)
    local bufnr = vim.api.nvim_win_get_buf(winnr)

    local bufname = vim.api.nvim_buf_get_name(bufnr)
    local root = vim.loop.cwd()
    local relative_path = string.gsub(bufname, root .. "/", "")

    table.insert(tabs, {
      bufname = relative_path,
      tabnr = tabnr,
    })
  end

  vim.ui.select(tabs, {
    prompt = "Choose a tab: ",
    format_item = function(item)
      return item.tabnr .. " - " .. item.bufname
    end,
  }, function(item)
    if not item then
      return
    end

    vim.api.nvim_set_current_tabpage(item.tabnr)
  end)
end

return M
