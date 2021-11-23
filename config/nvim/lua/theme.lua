local function set_highlight(group, options)
  local bg = options.bg == nil and '' or 'guibg=' .. options.bg
  local fg = options.fg == nil and '' or 'guifg=' .. options.fg
  local gui = options.gui == nil and '' or 'gui=' .. options.gui

  vim.cmd(string.format('hi %s %s %s %s', group, bg, fg, gui))
end

vim.cmd([[
  let ayucolor = "mirage"
  colorscheme ayu
]])

-- Remove highlighting in signcolumn
vim.cmd("highlight clear SignColumn")

-- Autocompletion menu
set_highlight("CmpItemMenu", { fg = "DarkGrey" })
set_highlight("Pmenu", { bg = "#191e2a", fg = "#cbccc6" })
set_highlight("PmenuSel", { bg = "#cbccc6", fg = "#ffa754" })
set_highlight("PmenuThumb", { bg = "#ffa754" })
set_highlight("Comment", { gui = "italic" })

-- Diagnostics
set_highlight("DiagnosticVirtualTextError", { fg = "DarkRed" })
