source $HOME/dotfiles/nvim/plugins.vim
source $HOME/dotfiles/nvim/general.vim
source $HOME/dotfiles/nvim/remaps.vim
source $HOME/dotfiles/nvim/file-tree.vim
source $HOME/dotfiles/nvim/coc.vim
source $HOME/dotfiles/nvim/tabs.vim

" Colorscheme
let ayucolor = 'mirage'
colorscheme ayu

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'ayu_mirage'

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

let g:bracey_refresh_on_save = 1
let g:bracey_server_allow_remote_connections = 1
let g:bracey_server_port = 3000
let g:bracey_eval_on_save = 1

" Ignore files inside .git directory by CtrlP
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
