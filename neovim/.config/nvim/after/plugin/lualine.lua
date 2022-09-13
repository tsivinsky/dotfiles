local lualine = require("lualine")
local devicons = require("nvim-web-devicons")

local gstatus = { ahead = 0, behind = 0 }
local function update_gstatus()
  local Job = require("plenary.job")
  Job:new({
    command = "git",
    args = { "rev-list", "--left-right", "--count", "HEAD...@{upstream}" },
    on_exit = function(job, _)
      local res = job:result()[1]
      if type(res) ~= "string" then
        gstatus = { ahead = 0, behind = 0 }
        return
      end
      local ok, ahead, behind = pcall(string.match, res, "(%d+)%s*(%d+)")
      if not ok then
        ahead, behind = 0, 0
      end
      gstatus = { ahead = ahead, behind = behind }
    end,
  }):start()
end

if _G.Gstatus_timer == nil then
  _G.Gstatus_timer = vim.loop.new_timer()
else
  _G.Gstatus_timer:stop()
end
_G.Gstatus_timer:start(0, 2000, vim.schedule_wrap(update_gstatus))

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

local tabs = {
  "tabs",
  mode = 2,
  tabs_color = {
    active = "lualine_a_normal",
    inactive = "lualine_a_inactive",
  },
}

local git_status = {
  function()
    return "勒" .. gstatus.ahead .. " " .. gstatus.behind .. ""
  end,
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
  tabline = {
    lualine_a = { tabs },
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
    lualine_c = { diagnostics, git_status },
    lualine_x = { diff, location, tabstop, fileformat },
    lualine_y = { filetype },
    lualine_z = {},
  },
  extensions = { "nvim-tree", "fugitive", "quickfix" },
})
