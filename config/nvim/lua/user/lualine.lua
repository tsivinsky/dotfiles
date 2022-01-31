local lualine = require("lualine")

-- Section "a"
local mode = {
  "mode",
}

-- Section "b"
local branch = {
  "branch",
  icons_enabled = true,
  icon = "",
}

-- Section "c"
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

-- Section "x"
local location = {
  "location",
}

-- Section "y"
local encoding = {
  "encoding",
}
local filetype = {
  "filetype",
}

lualine.setup({
  options = {
    disabled_filetypes = { "NvimTree" },
    component_separators = "",
    section_separators = "",
  },
  sections = {
    lualine_a = { mode },
    lualine_b = { branch },
    lualine_c = { filename, fileformat },
    lualine_x = { location },
    lualine_y = { encoding, filetype },
    lualine_z = {},
  },
})
