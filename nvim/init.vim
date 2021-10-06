" mark: modules
call plug#begin('~/.config/nvim/plugged')

Plug 'ayu-theme/ayu-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

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
Plug 'kevinoid/vim-jsonc'

call plug#end()

" mark: general
syntax on

set tabstop=2
set shiftwidth=2
set expandtab

set number
set wrap
set noswapfile
set encoding=utf-8
set hidden
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set mouse=nv
set cursorline

set termguicolors
set guifont=Fira\ Code:h20

" MY LEADER KEY IS GONNA BE A SPACE
let mapleader = " "

" Colorscheme
let ayucolor = 'mirage'
colorscheme ayu

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'ayu_mirage'

" Color highlighting
lua require'colorizer'.setup()

" Zen Mode plugin
lua require'zen-mode'.setup()


source $HOME/dotfiles/nvim/file-tree.vim
source $HOME/dotfiles/nvim/remaps.vim
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

let g:bracey_refresh_on_save = 1
let g:bracey_server_allow_remote_connections = 1
let g:bracey_server_port = 3000
let g:bracey_eval_on_save = 1
