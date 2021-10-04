" mark: modules
call plug#begin('~/.config/nvim/plugged')

" Colorschemes
Plug 'ayu-theme/ayu-vim'

Plug 'tpope/vim-commentary'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'prettier/vim-prettier', {'do': 'yarn install'}
Plug 'fatih/vim-go'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'evanleck/vim-svelte', {'branch': 'main'}
Plug 'kyazdani42/nvim-tree.lua'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'akinsho/bufferline.nvim'
Plug 'alvan/vim-closetag'
Plug 'turbio/bracey.vim', { 'do': 'npm install --prefix server' }
Plug 'folke/zen-mode.nvim'
Plug 'kyazdani42/nvim-web-devicons'

call plug#end()

" mark: general
syntax on

set number

set tabstop=2
set softtabstop=2
set shiftwidth=2
set smartindent
set expandtab

set wrap
set noswapfile
set encoding=utf-8
set hidden
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set mouse=nv

set termguicolors
set guifont=Fira\ Code:h20

" MY LEADER KEY IS GONNA BE A SPACE
let mapleader = " "

" Colorscheme
let ayucolor = 'mirage' " light/mirage/dark
colorscheme ayu " ayu/sonokai/material

" Color highlighting
lua require'colorizer'.setup()


source $HOME/dotfiles/nvim/file-tree.vim
source $HOME/dotfiles/nvim/remaps.vim
source $HOME/dotfiles/nvim/coc.vim
source $HOME/dotfiles/nvim/tabs.vim


" Filetypes for markdown extension
let g:mkdp_filetypes = ['md', 'mdx', 'markdown']




"  ______     _______ _   _____ _____ 
" / ___\ \   / / ____| | |_   _| ____|
" \___ \\ \ / /|  _| | |   | | |  _|  
"  ___) |\ V / | |___| |___| | | |___ 
" |____/  \_/  |_____|_____|_| |_____|
"                                    
" mark: svelte
let g:svelte_preprocessors = ['typescript', 'scss']



"  _   _ _____ __  __ _     
" | | | |_   _|  \/  | |    
" | |_| | | | | |\/| | |    
" |  _  | | | | |  | | |___ 
" |_| |_| |_| |_|  |_|_____|
"                          
" mark: html
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



"  _____ _   _ ____________   __  _____ ___ _   _ ____  _____ ____  
" |  ___| | | |__  /__  /\ \ / / |  ___|_ _| \ | |  _ \| ____|  _ \ 
" | |_  | | | | / /  / /  \ V /  | |_   | ||  \| | | | |  _| | |_) |
" |  _| | |_| |/ /_ / /_   | |   |  _|  | || |\  | |_| | |___|  _ < 
" |_|    \___//____/____|  |_|   |_|   |___|_| \_|____/|_____|_| \_\
"                                                                  
" mark: fuzzy finder
nnoremap <leader>f :FZF<CR>



"  __________ _   _   __  __  ___  ____  _____ 
" |__  / ____| \ | | |  \/  |/ _ \|  _ \| ____|
"   / /|  _| |  \| | | |\/| | | | | | | |  _|  
"  / /_| |___| |\  | | |  | | |_| | |_| | |___ 
" /____|_____|_| \_| |_|  |_|\___/|____/|_____|
"                                             
" mark: zen mode
lua << EOF
require("zen-mode").setup {}
EOF
noremap <leader>z :ZenMode<CR>
