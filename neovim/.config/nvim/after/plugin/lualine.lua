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

local relative_filename = {
  "filename",
  path = 1,
}

local filetype = {
  function()
    local filetype = vim.bo.filetype
    local filename = vim.fn.expand("%:t")
    local fileext = vim.fn.expand("%:e")
    local icon = devicons.get_icon(filename, fileext)

    if filetype == "fugitive" then
      icon = devicons.get_icons().git.icon
    end

    if not icon then
      return filetype
    end

    return icon .. " " .. filetype
  end,
}

local filename = {
  function()
    local filetype = vim.bo.filetype
    local filename = vim.fn.expand("%:t")
    local fileext = vim.fn.expand("%:e")
    local icon = devicons.get_icon(filename, fileext)
    local modified = vim.bo.modified

    if filetype == "fugitive" then
      icon = devicons.get_icons().git.icon
    end

    if not icon then
      return filename
    end

    if modified then
      return icon .. " " .. filename .. " " .. "[+]"
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

local location = {
  function()
    local line = vim.fn.line(".")
    local total_lines = vim.api.nvim_buf_line_count(0)

    local percent = math.floor(line / total_lines * 100)

    return line .. "/" .. total_lines .. " (" .. percent .. "%%)"
  end,
}

local diff = {
  "diff",
}

lualine.setup({
  options = {
    component_separators = "",
    section_separators = "",
    globalstatus = true,
    disabled_filetypes = {
      winbar = {
        "NvimTree",
      },
    },
  },
  winbar = {
    lualine_a = { filename },
  },
  inactive_winbar = {
    lualine_a = { filename },
  },
  sections = {
    lualine_a = { mode },
    lualine_b = { branch },
    lualine_c = { diagnostics, relative_filename },
    lualine_x = { diff, location, tabstop, fileformat },
    lualine_y = { filetype },
    lualine_z = {},
  },
  extensions = { "nvim-tree", "fugitive", "quickfix" },
})
