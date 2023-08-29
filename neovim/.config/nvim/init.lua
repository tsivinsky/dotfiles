-- Install packer automagically
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = vim.fn.system({
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
  use({ "nvim-lua/plenary.nvim" })

  use({ "sainnhe/gruvbox-material" })

  use({ "nvim-treesitter/nvim-treesitter" })
  use({ "JoosepAlviste/nvim-ts-context-commentstring" })

  use({
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
  })

  use({ "tpope/vim-fugitive" })
  use({ "lewis6991/gitsigns.nvim" })

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

  use({ "neovim/nvim-lspconfig" })
  use({ "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" })
  use({ "jose-elias-alvarez/null-ls.nvim" })

  use({ "mbbill/undotree" })

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

vim.g.mapleader = " "
vim.opt.termguicolors = true
