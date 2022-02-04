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

M.get_hidden_buffers = function()
  local buffers = vim.api.nvim_list_bufs()

  local hidden_buffers = {}

  for _, bufnr in ipairs(buffers) do
    local buf = vim.fn.getbufinfo(bufnr)[1]

    if buf.hidden == 1 then
      table.insert(hidden_buffers, { bufnr = buf.bufnr, name = buf.name })
    end
  end

  return hidden_buffers
end

M.delete_noname_buffers = function()
  local buffers = M.get_hidden_buffers()

  if buffers == nil then
    print("No noname buffers")
    return
  end

  for _, buf in ipairs(buffers) do
    if buf.name == "" then
      vim.cmd("bd " .. buf.bufnr)
    end
  end

  print("Deleted " .. #buffers .. " buffers")
end

M.copy_diagnostic_message = function()
  local diagnostics = vim.lsp.diagnostic.get_line_diagnostics()

  if #diagnostics == 0 then
    print("No diagnostics to yank")
    return
  end

  -- TODO: print all messages available and prompt which one to yank

  local message = diagnostics[1].message

  M.yank(message)

  print("Diagnostic message was yanked")
end

M.open_terminal = function(vertically)
  vertically = vertically or false

  if vertically then
    vim.cmd(":vs term://bash")
  else
    vim.cmd(":split term://bash")
  end
end

return M
