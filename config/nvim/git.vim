lua << EOF
  require("gitsigns").setup {
    signcolumn = false,
    current_line_blame = true,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
      delay = 500,
    }
  }
EOF

" Remap to toggle gitsigns as linehl
nnoremap <leader>sg :Gitsigns toggle_linehl<CR>

" Open Gitabra
nnoremap <leader>gg :G<CR>

nnoremap <leader>gs :Gitsigns stage_hunk<CR>
nnoremap <leader>gu :Gitsigns undo_stage_hunk<CR>
nnoremap <leader>gc :!git commit<CR>
