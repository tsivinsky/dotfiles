return require("packer").startup(function(use)
  use("wbthomason/packer.nvim")

  -- The best colorscheme out there
  use({ "ayu-theme/ayu-vim" })

  -- Treesitter
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
  use({ "p00f/nvim-ts-rainbow" })
  use({ "windwp/nvim-ts-autotag" })
  use({ "JoosepAlviste/nvim-ts-context-commentstring" })

  -- Make commenting code great
  use({ "tpope/vim-commentary" })

  -- File tree
  use({ "kyazdani42/nvim-tree.lua", requires = { "kyazdani42/nvim-web-devicons" } })

  -- Telescope
  use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } })
  use({ "nvim-telescope/telescope-symbols.nvim" })

  -- Automatically close brackets and quotes
  use({ "windwp/nvim-autopairs" })

  -- LSP
  use({ "neovim/nvim-lspconfig", "williamboman/nvim-lsp-installer", "onsails/lspkind-nvim" })
  use({ "hrsh7th/nvim-cmp", requires = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lua",
    "saadparwaiz1/cmp_luasnip"
  }})
  use({ "L3MON4D3/LuaSnip" })

  -- Signature like in vscode
  use({ "ray-x/lsp_signature.nvim" })

  -- Tabs
  use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons" } })

  -- Terminal
  use({ "caenrique/nvim-toggle-terminal" })

  -- Statusline
  use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } })

  -- Git
  use({ "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } })
  use({ "tpope/vim-fugitive" })

  use({ "fatih/vim-go", ft = { "go", "gomod" } })

  use({ "iamcco/markdown-preview.nvim", run = "cd app && yarn install" })

  -- Highlight colors in editor
  use({ "norcalli/nvim-colorizer.lua" })
end)
