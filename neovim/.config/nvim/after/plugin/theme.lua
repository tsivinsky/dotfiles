vim.api.nvim_set_hl(0, "SpellBad", {
  fg = "red",
})

local colorscheme = require("daniil.utils").get_colorscheme()
vim.cmd("colorscheme " .. colorscheme)

vim.cmd([[
hi clear SignColumn
]])
