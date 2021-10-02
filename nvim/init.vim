" mark: modules
call plug#begin('~/.config/nvim/plugged')

" Colorschemes
Plug 'ayu-theme/ayu-vim'
Plug 'sainnhe/sonokai'
Plug 'kaicataldo/material.vim'

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
Plug 'tc50cal/vim-terminal'
Plug 'alvan/vim-closetag'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'turbio/bracey.vim', { 'do': 'npm install --prefix server' }

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

" MY LEADER KEY IS GONNA BE A SPACE
let mapleader = " "

" Colorscheme
let ayucolor = 'mirage' " light/mirage/dark
" let g:sonokai_style = 'andromeda' " default/atlantis/andromeda/shusia/maia/espresso
" let g:material_theme_style = 'ocean' " default/palenight/ocean/lighter/darker

colorscheme ayu " ayu/sonokai/material

" Color highlighting
lua require'colorizer'.setup()

" let g:clipboard = {
"   \   'name': 'clipboard',
"   \   'copy': {
"   \     '+': 'xclip -selection clipboard',
"   \     '*': 'xclip -selection clipboard'
"   \   },
"   \   'paste': {
"   \     '+': 'xclip -selection clipboard -o',
"   \     '*': 'xclip -selection -clipboard -o'
"   \   },
"   \   'cache_enabled': 1,
"   \ }




"  ____  _____ __  __    _    ____  ____  
" |  _ \| ____|  \/  |  / \  |  _ \/ ___| 
" | |_) |  _| | |\/| | / _ \ | |_) \___ \ 
" |  _ <| |___| |  | |/ ___ \|  __/ ___) |
" |_| \_\_____|_|  |_/_/   \_\_|   |____/ 
"                                        
" mark: remaps
" These allow me to quickly save and quit vim
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" Remaps to move line under the cursor up and down
nnoremap <C-k> :m .-2<CR>==
nnoremap <C-j> :m .+1<CR>==
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv




"   ____ ___   ____   _   ___     _____ __  __ 
"  / ___/ _ \ / ___| | \ | \ \   / /_ _|  \/  |
" | |  | | | | |     |  \| |\ \ / / | || |\/| |
" | |__| |_| | |___ _| |\  | \ V /  | || |  | |
"  \____\___/ \____(_)_| \_|  \_/  |___|_|  |_|
"                                             
"
" mark: coc.nvim
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" GoTo definition
nmap <silent> gd <Plug>(coc-definition)



"  ____  _   _ ___ ____  ____  _____ _____ ____  
" / ___|| \ | |_ _|  _ \|  _ \| ____|_   _/ ___| 
" \___ \|  \| || || |_) | |_) |  _|   | | \___ \ 
"  ___) | |\  || ||  __/|  __/| |___  | |  ___) |
" |____/|_| \_|___|_|   |_|   |_____| |_| |____/ 
"                                               
" mark: snippets
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'



"  _____ ___ _     _____   _____ ____  _____ _____ 
" |  ___|_ _| |   | ____| |_   _|  _ \| ____| ____|
" | |_   | || |   |  _|     | | | |_) |  _| |  _|  
" |  _|  | || |___| |___    | | |  _ <| |___| |___ 
" |_|   |___|_____|_____|   |_| |_| \_\_____|_____|
"                                                 
"
" mark: file tree
let g:nvim_tree_width = 20
let g:nvim_tree_ignore = [ '.git' ]
let g:nvim_tree_add_trailing = 1
let g:nvim_tree_show_icons = {
    \ 'git': 0,
    \ 'folders': 0,
    \ 'files': 0,
    \ 'folder_arrows': 0,
    \ }

highlight NvimTreeFolderIcon guibg = blue

" Remaps
nnoremap <C-b> :NvimTreeToggle<CR>



"  __  __    _    ____  _  ______   _____        ___   _ 
" |  \/  |  / \  |  _ \| |/ /  _ \ / _ \ \      / / \ | |
" | |\/| | / _ \ | |_) | ' /| | | | | | \ \ /\ / /|  \| |
" | |  | |/ ___ \|  _ <| . \| |_| | |_| |\ V  V / | |\  |
" |_|  |_/_/   \_\_| \_\_|\_\____/ \___/  \_/\_/  |_| \_|
"                                                       
" mark: markdown
let g:mkdp_filetypes = ['md', 'mdx', 'markdown']

" Remap to toggle markdown preview
nmap <C-m> <Plug>MarkdownPreviewToggle



"  _____  _    ____ ____  
" |_   _|/ \  | __ ) ___| 
"   | | / _ \ |  _ \___ \ 
"   | |/ ___ \| |_) |__) |
"   |_/_/   \_\____/____/ 
"                        
" mark: tabs
lua << EOF
require("bufferline").setup{}
EOF

" These commands will navigate through buffers in order regardless of which mode you are using
" e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
nnoremap <silent>[b :BufferLineCycleNext<CR>
nnoremap <silent>b] :BufferLineCyclePrev<CR>

nnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
nnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
nnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
nnoremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
nnoremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
nnoremap <silent><leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
nnoremap <silent><leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
nnoremap <silent><leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
nnoremap <silent><leader>9 <Cmd>BufferLineGoToBuffer 9<CR>




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
