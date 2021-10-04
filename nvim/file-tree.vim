lua << EOF
  require("nvim-tree").setup {}
EOF

let g:nvim_tree_width = 20
let g:nvim_tree_ignore = [ '.git' ]
let g:nvim_tree_add_trailing = 1
let g:nvim_tree_quit_on_open = 1
let g:nvim_tree_show_icons = {
    \ 'git': 0,
    \ 'folders': 0,
    \ 'files': 0,
    \ 'folder_arrows': 0,
    \ }

" Remaps
nnoremap <C-b> :NvimTreeToggle<CR>

