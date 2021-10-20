source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/general.vim
source $HOME/.config/nvim/remaps.vim
source $HOME/.config/nvim/theme.vim
source $HOME/.config/nvim/terminal.vim
source $HOME/.config/nvim/file-tree.vim
source $HOME/.config/nvim/coc.vim
source $HOME/.config/nvim/tabs.vim
source $HOME/.config/nvim/git.vim

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
