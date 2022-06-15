vim.g.edge_diagnostic_virtual_text = "colored"
vim.g.edge_better_performance = 1
vim.g.tokyonight_style = "night"

vim.api.nvim_set_hl(0, "SpellBad", {
  fg = "red",
})

vim.cmd([[
colorscheme gruvbox-material
hi clear SignColumn
]])
