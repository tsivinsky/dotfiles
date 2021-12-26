-- General
vim.cmd([[
hi Comment gui=italic
]])

-- File tree
vim.cmd([[
hi NvimTreeGitNew guibg=green
hi NvimTreeGitStaged guibg=lightgreen
hi NvimTreeGitDeleted guibg=red
hi NvimTreeGitDirty guibg=lightblue
hi NvimTreeGitMerge guibg=yellow
hi NvimTreeGitIgnored guibg=gray

hi NvimTreeOpenedFolderName gui=italic,bold
]])
