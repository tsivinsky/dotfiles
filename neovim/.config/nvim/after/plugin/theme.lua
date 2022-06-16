vim.g.edge_diagnostic_virtual_text = "colored"
vim.g.edge_better_performance = 1
vim.g.tokyonight_style = "night"

vim.api.nvim_set_hl(0, "SpellBad", {
  fg = "red",
})

vim.api.nvim_set_hl(0, "IndentBlanklineChar", {
  fg = "#373737",
  bg = "none",
})
vim.api.nvim_set_hl(0, "IndentBlanklineContextChar", {
  fg = "#808080",
  bg = "none",
})

vim.cmd([[
colorscheme gruvbox-material
hi clear SignColumn
]])
