if !filereadable($HOME . "/.vim/autoload/plug.vim")
  call system("curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim")
endif

call plug#begin()

Plug 'morhetz/gruvbox'

call plug#end()


" Options
set number
set relativenumber

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smartindent

set shortmess="filnxtToOFc"
set splitbelow
set splitright
set wrap
set noswapfile
set nobackup
set scrolloff=5
set autoread
set autowrite
set wildmenu
set clipboard=unnamed
set clipboard+=unnamedplus

set smartcase
set ignorecase

set list
set listchars="multispace:·,tab:>~"

syntax on
colorscheme gruvbox
set background=dark
set cursorline
set colorcolumn=120

let g:mapleader = " "



" Remaps
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

vnoremap < <gv
vnoremap > >gv
