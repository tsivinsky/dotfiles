syntax on

set number

set tabstop=2 softtabstop=2
set shiftwidth=2
set noswapfile
set smartindent
set expandtab
set encoding=utf-8
set wrap

set colorcolumn=80

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'

call plug#end()

colorscheme gruvbox
set background=dark
