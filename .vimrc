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
set autochdir

" Remap to use Alt+Q to quit panel or vim
nmap <A-q> :q<CR>

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

call plug#end()

" Theme
colorscheme gruvbox
set background=dark

" NerdTree remap to toggle it
nmap <C-b> :NERDTreeToggle<CR>

" Remap to open CtrlP menu
nmap <C-p> :CtrlP<CR>

" Remaps to switching between panes with Ctrl+j/k/h/l
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Remap to quickly quit Vim on Ctrl+Q
nmap <C-q> :q<CR>

" Remap to save file with Ctrl+S
nmap <C-s> :w<CR>

" Remaps to move line under the cursor down and up
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
