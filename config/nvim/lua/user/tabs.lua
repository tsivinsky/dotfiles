local M = {
  history = {},
}

M.close_tab = function()
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
