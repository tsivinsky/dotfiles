local M = {}

vim.g.daniil_formatting_enabled = 1

function M.enable()
  vim.g.daniil_formatting_enabled = 1
end

function M.disable()
  vim.g.daniil_formatting_enabled = 0
end

function M.toggle()
  if M.is_enabled() then
    M.disable()
  else
    M.enable()
  end

  M.status()
end

function M.is_enabled()
  return vim.g.daniil_formatting_enabled == 1
end

function M.status()
  if M.is_enabled() then
    vim.notify("Formatting enabled")
  else
    vim.notify("Formatting disabled")
  end
end

return M
