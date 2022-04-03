local M = {}

M.yank = function(message)
  if vim.fn.has("win32") == 1 then
    os.execute("echo '" .. message .. "' | win32yank -i")
  else
    -- i use wayland, so there is no xclip for X11
    os.execute("echo -n '" .. message .. "' | wl-copy")
  end
end

--- @param diagnostics list
--- @param prompt string
--- @return string
M.select_diagnostic = function(diagnostics, prompt)
  if #diagnostics == 0 then
    return ""
  end

  local message = ""

  if #diagnostics == 1 then
    message = diagnostics[1].message
  else
    local d = {}
    for _, diagnostic in ipairs(diagnostics) do
      table.insert(d, diagnostic.message)
    end

    vim.ui.select(d, { prompt = prompt }, function(item)
      message = item
    end)
  end

  return message
end

M.copy_diagnostic_message = function()
  local diagnostics = vim.lsp.diagnostic.get_line_diagnostics()

  local message = M.select_diagnostic(diagnostics, "Pick a diagnostic to yank")

  M.yank(message)

  print("Diagnostic message was yanked")
end

M.lsp_organize_imports = function(bufnr, timeout)
  if not bufnr then
    bufnr = vim.api.nvim_get_current_buf()
  end

  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(bufnr) },
    title = "",
  }

  vim.lsp.buf_request_sync(bufnr, "workspace/executeCommand", params, timeout or 500)
end

M.open_url_in_browser = function(url)
  local f

  if vim.fn.has("win32") == 1 then
    f = io.popen("explorer " .. url, "r")
  else
    f = io.popen("xdg-open " .. url, "r")
  end

  f:close()
end

return M
