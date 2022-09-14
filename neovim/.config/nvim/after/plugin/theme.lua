vim.api.nvim_set_hl(0, "SpellBad", {
  fg = "red",
})

local colorschemes = { "gruvbox-material", "material" }
local random_colorscheme = colorschemes[math.random(#colorschemes)]

vim.cmd("colorscheme " .. random_colorscheme)

vim.cmd([[
hi clear SignColumn
]])
