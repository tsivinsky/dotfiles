local M = {}

M.yank = function(message)
  vim.cmd(":!echo -n '" .. message .. "' | wl-copy")
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
  local _url = string.format('"%s"', url)

  vim.cmd(":!exec xdg-open " .. _url)
end

function M.lsp_format(bufnr)
  bufnr = bufnr or 0

  vim.lsp.buf.format({
    filter = function(client)
      if client.name == "tsserver" then
        return false
      end

      return true
    end,
    bufnr = bufnr,
  })
end

function M.open_unsaved_buffers()
  local buffers = vim.api.nvim_list_bufs()
  local unsaved_buffers = {}

  local og_bufnr = vim.api.nvim_get_current_buf()

  for _, bufnr in ipairs(buffers) do
    local is_saved = vim.api.nvim_buf_get_option(bufnr, "modified")

    if is_saved and bufnr ~= og_bufnr then
      local bufname = vim.api.nvim_buf_get_name(bufnr)

      table.insert(unsaved_buffers, bufnr)

      vim.cmd("tabnew " .. bufname)
    end
  end

  if #unsaved_buffers > 0 then
    vim.notify("Opened " .. #unsaved_buffers .. " unsaved buffers")
  end
end

function M.toggle_qflist()
  if vim.bo.ft == "qf" then
    vim.cmd(":cclose")
  else
    vim.cmd(":copen")
  end
end

function M.toggle_locationlist()
  if vim.bo.ft == "qf" then
    vim.cmd(":lclose")
  else
    vim.cmd(":lopen")
  end
end

function M.is_inside_tmux()
  local TMUX = os.getenv("TMUX")

  return TMUX ~= nil
end

function M.get_colorscheme()
  local IS_TMUX = M.is_inside_tmux()

  if IS_TMUX then
    return "gruvbox-material"
  else
    return "material"
  end
end

function M.open_error_on_stackoverflow()
  local diagnostics = vim.lsp.diagnostic.get_line_diagnostics()
  local selected_diagnostic = M.select_diagnostic(diagnostics, "Select diagnostic to open on Stack Overflow")

  local url = string.format("https://stackoverflow.com/search?q=%s", selected_diagnostic)

  M.open_url_in_browser(url)

  M.yank(selected_diagnostic)
end

return M
