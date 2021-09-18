syntax on

set nocp

set number

set tabstop=2 softtabstop=2
set shiftwidth=2
set noswapfile
set smartindent
set expandtab
set encoding=utf-8
set wrap

" Map leader key to Space
let mapleader = " "
let g:closetag_filenames = '*.html,*.svelte'

call plug#begin('~/.vim/plugged')

" Gruvbox theme
Plug 'morhetz/gruvbox'

" Packages for JavaScript/TypeScript and Go
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'fatih/vim-go'

" Nerdtree for file tree
" Use Ctrl+B to toggle it
Plug 'scrooloose/nerdtree'

" Completion engine
Plug 'valloric/youcompleteme'

" Package for opening files with Ctrl+P
Plug 'kien/ctrlp.vim'

" Git wrapper
Plug 'tpope/vim-fugitive'

" While in Visual mode, select the code and press 'gc' keys to
" comment/uncomment it
Plug 'tpope/vim-commentary'

" HTML plugins
Plug 'mattn/emmet-vim'
Plug 'alvan/vim-closetag'

" Svelte plugin
Plug 'evanleck/vim-svelte'

Plug 'ap/vim-css-color'

call plug#end()

" Theme
colorscheme gruvbox
set background=dark

" NerdTree remap to toggle it
nmap <C-b> :NERDTreeToggle <CR>

" Remap to open CtrlP menu
nmap <C-p> :CtrlP<CR>

" Remaps to switching between panes with Ctrl+j/k/h/l
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Remap to quickly quit Vim with Space+q
nmap <leader>q :q<CR>

" Remap to save file with Space+w
nmap <leader>w :w<CR>

" Remaps to move line under the cursor down and up
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
