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

return M
