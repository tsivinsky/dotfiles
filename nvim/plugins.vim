call plug#begin('~/.config/nvim/plugged')

Plug 'ayu-theme/ayu-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'tpope/vim-commentary'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'kyazdani42/nvim-tree.lua'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'akinsho/bufferline.nvim'
Plug 'alvan/vim-closetag'
Plug 'turbio/bracey.vim', { 'do': 'npm install --prefix server' }
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kevinoid/vim-jsonc'
Plug 'fatih/vim-go'
Plug 'ctrlpvim/ctrlp.vim'

call plug#end()