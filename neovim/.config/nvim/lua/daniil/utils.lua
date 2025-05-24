local M = {}

---@return number width, number height
function M.get_terminal_size()
  local width = vim.o.columns
  local height = vim.o.lines
  return width, height
end

---@param width number width in percentage of screen width (0.75, 0.5, etc)
---@param height number height in percentage of screen height (0.75, 0.5, etc)
---@return number buffer, number window
function M.create_floating_window_in_center(width, height)
  local bufnr = vim.api.nvim_create_buf(false, true) -- not listed, scratch buffer

  local max_width, max_height = M.get_terminal_size()
  local win_width = math.floor(max_width * width)
  local win_height = math.floor(max_height * height)

  local winnr = vim.api.nvim_open_win(bufnr, true, {
    relative = "editor",
    width = win_width,
    height = win_height,
    row = (max_height - win_height) / 2,
    col = (max_width - win_width) / 2,
    focusable = true,
    style = "minimal",
  })

  return bufnr, winnr
end

---@param bufnr number
---@param content string
function M.set_buffer_text(bufnr, content)
  local lines = {}
  for s in content:gmatch("[^\r\n]+") do
    table.insert(lines, s)
  end
  vim.api.nvim_buf_set_lines(bufnr, 0, vim.tbl_count(lines), false, lines)
end

return M
