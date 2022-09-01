-- Locals
local fn = vim.fn

-- Install packer automagically
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
end

require("packer").startup(function(use)
  use({ "wbthomason/packer.nvim" })

  use({ "MunifTanjim/nui.nvim" })
  use({ "nvim-lua/popup.nvim" })
  use({ "nvim-lua/plenary.nvim" })
  use({ "folke/lua-dev.nvim" })

  -- Colorschemes go here
  use({ "sainnhe/gruvbox-material" })

  -- Make commenting code great
  use({ "numToStr/Comment.nvim" })

  -- Icons used by many plugins
  use({ "kyazdani42/nvim-web-devicons" })

  -- Auto pairs plugin that automatically closes brackets and quotes
  use({ "windwp/nvim-autopairs" })

  -- File tree
  use({ "kyazdani42/nvim-tree.lua" })

  -- Treesitter for better syntax highlighting
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    {
      { "JoosepAlviste/nvim-ts-context-commentstring" },
      { "nvim-treesitter/playground" },
      { "windwp/nvim-ts-autotag" },
    },
  })

  -- Git things
  use({ "lewis6991/gitsigns.nvim" })
  use({ "tpope/vim-fugitive" })

  -- LSP stuff
  use({ "neovim/nvim-lspconfig" })
  use({ "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" })
  use({ "jose-elias-alvarez/null-ls.nvim" })
  use({ "ray-x/lsp_signature.nvim" })
  use({
    "themaxmarchuk/tailwindcss-colors.nvim",
    module = "tailwindcss-colors",
    config = function()
      require("tailwindcss-colors").setup()
    end,
  })
  use({ "b0o/SchemaStore.nvim" })

  -- Completion, snippets, etc
  use({
    "hrsh7th/nvim-cmp",
    {
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-cmdline" },
      { "petertriho/cmp-git" },
    },
  })
  use({ "L3MON4D3/LuaSnip", {
    "saadparwaiz1/cmp_luasnip",
  } })
  use({ "rafamadriz/friendly-snippets" })

  use({
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      run = "make",
    },
    {
      "nvim-telescope/telescope-symbols.nvim",
    },
  })

  -- Statusline
  use({ "nvim-lualine/lualine.nvim" })

  -- Highlight colors
  use({
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "*" })
    end,
  })

  use({ "iamcco/markdown-preview.nvim", run = "cd app && yarn install" })

  use({ "editorconfig/editorconfig-vim" })

  use({
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup({})
      vim.notify = require("notify")
    end,
  })

  use({
    "stevearc/dressing.nvim",
    config = function()
      require("dressing").setup({})
    end,
  })

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

vim.g.mapleader = " "
vim.opt.termguicolors = true
