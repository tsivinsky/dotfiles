call plug#begin('~/.config/nvim/plugged')

Plug 'ayu-theme/ayu-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'tpope/vim-commentary'
Plug 'neoclide/coc.nvim', { 'do': 'yarn install --frozen-lockfile' }
Plug 'kyazdani42/nvim-tree.lua'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'akinsho/bufferline.nvim'
Plug 'alvan/vim-closetag'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'fatih/vim-go'
Plug 'tpope/vim-fugitive'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'caenrique/nvim-toggle-terminal'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'folke/todo-comments.nvim'

call plug#end()
