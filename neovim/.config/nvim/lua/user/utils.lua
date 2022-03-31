local M = {}

M.yank = function(message)
  if vim.fn.has("win32") == 1 then
    os.execute("echo '" .. message .. "' | win32yank -i")
  else
    -- i use wayland, so there is no xclip for X11
    os.execute("echo -n '" .. message .. "' | wl-copy")
  end
end

M.copy_diagnostic_message = function()
  local diagnostics = vim.lsp.diagnostic.get_line_diagnostics()

  if #diagnostics == 0 then
    print("No diagnostics to yank")
    return
  end

  local message = ""

  if #diagnostics == 1 then
    message = diagnostics[1].message
  elseif #diagnostics > 1 then
    local d = {}
    for _, diagnostic in ipairs(diagnostics) do
      table.insert(d, diagnostic.message)
    end

    vim.ui.select(d, { prompt = "Pick a diagnostic to yank" }, function(item)
      message = item
    end)
  end

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
  -- TODO: implement windows support
  if vim.fn.has("win32") == 1 then
    print("windows not supported, sorry")
    return
  end

  local f = io.popen("xdg-open " .. url, "r")
  f:close()
end

return M
