local lualine = require("lualine")
local devicons = require("nvim-web-devicons")

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
    local filetype = vim.bo.filetype
    local filename = vim.fn.expand("%:t")
    local fileext = vim.fn.expand("%:e")
    local icon = devicons.get_icon(filename, fileext)

    if filetype == "fugitive" then
      icon = devicons.get_icons().git.icon
      filename = "git"
    end

    if not icon then
      return filename
    end

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

local tabs = {
  "tabs",
  mode = 1,
}

local windows = {
  "windows",
  disabled_buftypes = { "nofile" },
  filetype_names = {
    NvimTree = "File Tree",
  },
}

lualine.setup({
  options = {
    component_separators = "",
    section_separators = "",
    globalstatus = true,
  },
  tabline = {
    lualine_a = { tabs },
    lualine_z = { windows },
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
