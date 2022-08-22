vim.api.nvim_set_hl(0, "SpellBad", {
  fg = "red",
})

local env = vim.fn.environ()
if env["TMUX"] then
  vim.cmd("colorscheme gruvbox-material")
else
  vim.cmd("colorscheme ayu")
end

vim.cmd([[
hi clear SignColumn
]])
