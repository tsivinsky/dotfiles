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
  sections = { "error", "warn", "info", "hint" },
  always_visible = true,
}

local filename = {
  function()
    local filename = vim.fn.expand("%:t")
    local fileext = vim.fn.expand("%:e")
    local icon = require("nvim-web-devicons").get_icon(filename, fileext)

    return icon .. " " .. filename
  end,
}

local fileformat = {
  function()
    return "[" .. vim.bo.fileformat .. "]"
  end,
}

local tabstop = {
  function()
    local tabstop = vim.bo.tabstop
    local expandtab = vim.bo.expandtab

    local method = expandtab == true and "spaces" or "tabs"
    local format = tabstop .. " " .. method

    return format
  end,
}

local globalstatus = false
local disabledfts = { "NvimTree" }
if vim.fn.has("nvim-0.7") == 1 then
  globalstatus = true
  disabledfts = {}
end

lualine.setup({
  options = {
    disabled_filetypes = disabledfts,
    component_separators = "",
    section_separators = "",
    globalstatus = globalstatus,
  },
  sections = {
    lualine_a = { mode },
    lualine_b = { branch },
    lualine_c = { diagnostics },
    lualine_x = { tabstop, fileformat },
    lualine_y = { filename },
    lualine_z = {},
  },
})