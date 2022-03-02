local lualine = require("lualine")

local mode = {
  "mode",
}

local branch = {
  "branch",
  icons_enabled = true,
  icon = "",
}

local diagnostics = {
  "diagnostics",
  sections = { "error", "warn" },
}

local filename = {
  "filename",
}

local fileformat = {
  "fileformat",
  symbols = {
    unix = "",
    dos = "",
    mac = "",
  },
}

-- don't know if it's working or not. seems working right
local tabstop = {
  function()
    local tabstop = vim.bo.tabstop
    local expandtab = vim.bo.expandtab

    local method = expandtab == true and "spaces" or "tabs"
    local format = tabstop .. " " .. method

    return format
  end,
}

local location = {
  "location",
}

local encoding = {
  "encoding",
}

local filetype = {
  "filetype",
}

-- local timer = vim.loop.new_timer()
-- timer:start(
--   0,
--   1000,
--   vim.schedule_wrap(function()
--     vim.g.lualine_time_module = os.date("%H:%M", os.time())
--   end)
-- )
-- local time = {
--   function()
--     return vim.g.lualine_time_module
--   end,
--   cond = function()
--     if vim.g.lualine_time_module then
--       return true
--     end

--     return false
--   end,
-- }

lualine.setup({
  options = {
    disabled_filetypes = { "NvimTree" },
    component_separators = "",
    section_separators = "",
  },
  sections = {
    lualine_a = { mode },
    lualine_b = { branch },
    lualine_c = { diagnostics, filename, fileformat },
    lualine_x = { tabstop, location, encoding, filetype },
    lualine_y = {},
    lualine_z = {},
  },
})
