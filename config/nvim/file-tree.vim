lua << EOF
  require("nvim-tree").setup({
    open_on_setup = true,
    hijack_cursor = true,
    indent_markers = true,
    update_cwd = true,
    update_focused_file = {
      enable = true
    },
    view = {
      width = 30,
      side = "left",
      auto_resize = true
    }
  })
EOF

let g:nvim_tree_add_trailing = 1
let g:nvim_tree_indent_markers = 1
let g:nvim_tree_show_icons = {
    \ 'git': 0,
    \ 'folders': 0,
    \ 'files': 0,
    \ 'folder_arrows': 0,
    \ }

" Remaps
nnoremap <leader>b :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
