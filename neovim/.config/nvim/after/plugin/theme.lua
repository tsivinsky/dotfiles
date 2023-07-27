vim.api.nvim_set_hl(0, "SpellBad", {
  fg = "red",
})

require("gruvbox").setup({
  italic = {
    comments = true,
  },
})

vim.cmd([[
colorscheme gruvbox
hi clear SignColumn
]])
