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
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kevinoid/vim-jsonc'
Plug 'fatih/vim-go'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-fugitive'
Plug 'evanleck/vim-svelte'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'yuezk/vim-js'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'nvim-lua/plenary.nvim'

call plug#end()
