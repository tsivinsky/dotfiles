source $HOME/dotfiles/nvim/plugins.vim
source $HOME/dotfiles/nvim/general.vim
source $HOME/dotfiles/nvim/remaps.vim
source $HOME/dotfiles/nvim/theme.vim
source $HOME/dotfiles/nvim/terminal.vim
source $HOME/dotfiles/nvim/file-tree.vim
source $HOME/dotfiles/nvim/coc.vim
source $HOME/dotfiles/nvim/tabs.vim

" Filetypes for markdown extension
let g:mkdp_filetypes = ['md', 'mdx', 'markdown']

let g:svelte_preprocessors = ['typescript', 'scss']

let g:closetag_filenames = '*.html,*.svelte,*.jsx,*.tsx'
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" Ignore files inside .git directory by CtrlP
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

lua << EOF
  require("gitsigns").setup {
    current_line_blame = true,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
      delay = 500,
    },
    current_line_blame_formatter_opts = {
      relative_time = false
    }
  }
  require("gitabra").setup {}
EOF
