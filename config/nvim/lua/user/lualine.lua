local lualine = require("lualine")

local branch = {
  "branch",
  icons_enabled = true,
  icon = "",
}

local mode = {
  "mode",
}

local filetype = {
  "filetype",
}

local location = function()
  local line, column = unpack(vim.api.nvim_win_get_cursor(0))

  return "Ln " .. line .. ", Col " .. column
end

lualine.setup({
  options = {
    disabled_filetypes = { "NvimTree" },
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
  },
  sections = {
    lualine_a = { mode },
    lualine_b = { branch },
    lualine_c = {},
    lualine_x = { location },
    lualine_y = { "encoding", filetype },
    lualine_z = {},
  },
})
