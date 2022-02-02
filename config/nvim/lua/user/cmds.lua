local yank = require("user.utils").yank

local M = {}

M.open_terminal = function(vertically)
  vertically = vertically or false

  if vertically then
    vim.cmd(":vs term://bash")
  else
    vim.cmd(":split term://bash")
  end
end

M.copy_diagnostic_message = function()
  local diagnostics = vim.lsp.diagnostic.get_line_diagnostics()

  if #diagnostics == 0 then
    print("No diagnostics to yank")
    return
  end

  -- TODO: print all messages available and prompt which one to yank

  local message = diagnostics[1].message

  yank(message)

  print("Diagnostic message was yanked")
end

return M
