vim.cmd([[
command! DeleteNonameBufs lua require('user.utils').delete_noname_buffers()
]])
