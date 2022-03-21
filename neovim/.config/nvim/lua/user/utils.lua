local M = {}

local function map(mode, shortcut, command, additional_opts)
  local opts = { noremap = true, silent = true }

  if opts then
    opts = vim.tbl_extend("force", opts, additional_opts)
  end

  vim.api.nvim_set_keymap(mode, shortcut, command, opts)
end

M.nmap = function(shortcut, command, opts)
  opts = opts or {}

  map("n", shortcut, command, opts)
end

M.vmap = function(shortcut, command, opts)
  opts = opts or {}

  map("v", shortcut, command, opts)
end

M.tmap = function(shortcut, command, opts)
  opts = opts or {}

  map("t", shortcut, command, opts)
end

M.imap = function(shortcut, command, opts)
  opts = opts or {}

  map("i", shortcut, command, opts)
end

M.list_includes_item = function(list, item)
  for _, value in pairs(list) do
    if value == item then
      return true
    end
  end

  return false
end

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

M.get_definitions = function()
  local params = vim.lsp.util.make_position_params()

  local resp = vim.lsp.buf_request_sync(0, "textDocument/definition", params, 1000)
  local result = {}
  for _, v in pairs(resp) do
    table.insert(result, v)
  end
  result = result[1].result

  return result
end

M.goto_local_definition = function()
  local definitions = M.get_definitions()

  local local_definition = unpack(definitions)
  local target = local_definition.targetSelectionRange

  local startLine = target.start.line + 1
  local startCol = target.start.character

  vim.api.nvim_win_set_cursor(0, { startLine, startCol })
end

M.goto_global_definition = function()
  local definitions = M.get_definitions()

  local global_definition = definitions[#definitions]
  local target = global_definition.targetSelectionRange

  local startLine = target.start.line + 1
  local startCol = target.start.character

  local fileuri = global_definition.targetUri
  local filepath = string.gsub(fileuri, "file://", "")

  vim.cmd("tabnew")
  vim.cmd("e " .. filepath)

  vim.api.nvim_win_set_cursor(0, { startLine, startCol })
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

return M
