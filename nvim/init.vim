" mark: modules
call plug#begin('~/.config/nvim/plugged')

Plug 'ayu-theme/ayu-vim'
Plug 'tpope/vim-commentary'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'jiangmiao/auto-pairs'

call plug#end()

" mark: general
syntax on

set number

set tabstop=2
set shiftwidth=2
set smartindent
set expandtab

set wrap
set noswapfile
set encoding=utf-8

set termguicolors

" MY LEADER KEY IS GONNA BE A SPACE
let mapleader = " "

" Colorscheme
let ayucolor = "mirage"
colorscheme ayu

" Color highlighting
lua require'colorizer'.setup()

" mark: remaps
" These allow me to quickly save and quit vim
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" Remaps to move line under the cursor up and down
nnoremap <C-k> :m .-2<CR>==
nnoremap <C-j> :m .+1<CR>==
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv
