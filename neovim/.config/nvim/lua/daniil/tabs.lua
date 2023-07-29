local M = {}

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
