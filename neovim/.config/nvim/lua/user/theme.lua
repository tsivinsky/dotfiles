vim.g.edge_diagnostic_virtual_text = "colored"
vim.g.edge_better_performance = 1

vim.cmd([[
colorscheme edge
hi SpellBad guifg=red

hi DiagnosticError guifg=#e80f43
hi DiagnosticWarn guifg=#ffc914
hi DiagnosticInfo guifg=#9fd356
hi DiagnosticHint guifg=#1d74f7
]])
