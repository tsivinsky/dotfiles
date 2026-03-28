--[[
-- this file breaks my brain with all of these booleans, but it seems to work
--]]

local M = {
  -- false    = formatting enabled for all buffers
  -- true     = formatting disabled for all buffers
  -- number[] = formatting disabled for only these buffers
  ---@type true | false | number[]
  _disabled_buffers = false,
}

---@param buf number
---@return boolean, boolean
--- returns 2 booleans: enabled for all buffers, enabled for this buffer
function M._is_enabled(buf)
  if M._disabled_buffers == true then
    return false, false
  end

  if type(M._disabled_buffers) == "table" then
    local enabled = not vim.tbl_contains(M._disabled_buffers, buf)
    return true, enabled
  end

  return true, true
end

---@param buf number
function M.is_enabled(buf)
  local _, enabled = M._is_enabled(buf)
  return enabled
end

function M.register_user_commands()
  vim.api.nvim_create_user_command("FormattingEnable", function()
    M._disabled_buffers = false
  end, {})

  vim.api.nvim_create_user_command("FormattingEnableBuf", function()
    local current_buf = vim.api.nvim_get_current_buf()

    if type(M._disabled_buffers) == "table" then
      local new_table = {}
      for _, b in ipairs(M._disabled_buffers) do
        if b ~= current_buf then
          table.insert(new_table, b)
        end
      end
      M._disabled_buffers = new_table
    else
      M._disabled_buffers = false
    end
  end, {})

  vim.api.nvim_create_user_command("FormattingDisable", function()
    M._disabled_buffers = true
  end, {})

  vim.api.nvim_create_user_command("FormattingDisableBuf", function()
    local current_buf = vim.api.nvim_get_current_buf()
    if type(M._disabled_buffers) == "table" then
      table.insert(M._disabled_buffers, current_buf)
    else
      M._disabled_buffers = { current_buf }
    end
  end, {})
end

return M
