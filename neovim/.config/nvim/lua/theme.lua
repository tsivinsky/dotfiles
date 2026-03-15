local M = {
  name = "apple_system_colors_light",
}

M.palette = {
  black = "#1a1a1a",
  red_dark = "#cc372e",
  green_dark = "#26a439",
  yellow_dark = "#cdac08",
  blue_dark = "#0869cb",
  purple_dark = "#9647bf",
  cyan_dark = "#479ec2",
  gray_light = "#98989d",
  gray_dark = "#464646",
  red_light = "#ff453a",
  green_light = "#32d74b",
  yellow_light = "#e5bc00",
  blue_light = "#0a84ff",
  purple_light = "#bf5af2",
  cyan_light = "#69c9f2",
  white = "#ffffff",
  background = "#feffff",
  foreground = "#000000",
  cursor_color = "#98989d",
  cursor_text = "#ffffff",
  selection_background = "#abd8ff",
  selection_foreground = "#000000",
}

local function hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

function M.setup()
  vim.g.colors_name = M.name

  -- Basic UI groups
  hl("Normal", { fg = M.palette.foreground, bg = M.palette.background })
  hl("NormalNC", { fg = M.palette.foreground, bg = M.palette.background })
  hl("CursorLine", { bg = M.palette.cursor_color, fg = M.palette.cursor_text })
  hl("Visual", { bg = M.palette.selection_background })
  hl("LineNr", { fg = M.palette.gray_light, bg = M.palette.background })
  hl("CursorLineNr", { fg = M.palette.cyan_dark, bg = M.palette.background })

  -- Syntax groups
  hl("Comment", { fg = M.palette.gray_light, italic = true })
  hl("Constant", { fg = M.palette.red_dark })
  hl("String", { fg = M.palette.red_light })
  hl("Identifier", { fg = M.palette.blue_dark })
  hl("Statement", { fg = M.palette.green_dark })
  hl("PreProc", { fg = M.palette.red_dark })
  hl("Type", { fg = M.palette.purple_dark })
  hl("Special", { fg = M.palette.gray_dark })
  hl("Underlined", { underline = true })

  -- Diagnostic groups
  hl("DiagnosticError", { fg = M.palette.red_dark })
  hl("DiagnosticWarn", { fg = M.palette.yellow_dark })
  hl("DiagnosticInfo", { fg = M.palette.cyan_dark })
  hl("DiagnosticHint", { fg = M.palette.blue_dark })
  hl("DiagnosticUnderlineError", { sp = M.palette.red_dark, undercurl = true })
  hl("DiagnosticUnderlineWarn", { sp = M.palette.yellow_dark, undercurl = true })
  hl("DiagnosticUnderlineInfo", { sp = M.palette.cyan_dark, undercurl = true })
  hl("DiagnosticUnderlineHint", { sp = M.palette.blue_dark, undercurl = true })
end

return M
