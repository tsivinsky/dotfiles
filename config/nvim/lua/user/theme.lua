local cmd = vim.cmd

vim.g.tokyonight_style = "night"
cmd([[colorscheme tokyonight]])

cmd([[
hi NvimTreeGitNew guifg=green
hi NvimTreeGitStaged guifg=lightgreen
hi NvimTreeGitDeleted guifg=red
hi NvimTreeGitDirty guifg=lightblue
hi NvimTreeGitMerge guifg=yellow
hi NvimTreeGitIgnored guifg=gray
hi NvimTreeOpenedFolderName gui=italic,bold
]])
