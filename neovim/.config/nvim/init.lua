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

  use({ "nvim-treesitter/nvim-treesitter" })
  use({
    "JoosepAlviste/nvim-ts-context-commentstring",
    config = function()
      require("ts_context_commentstring").setup({})
      vim.g.skip_ts_context_commentstring_module = true
    end,
  })

  use({ "nvim-telescope/telescope.nvim" })

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
    "rafamadriz/friendly-snippets",
  } })

  use({ "neovim/nvim-lspconfig" })
  use({ "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" })
  use({ "nvimtools/none-ls.nvim" })

  use({ "kyazdani42/nvim-tree.lua" })
  use({ "kyazdani42/nvim-web-devicons" })

  use({
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  })
  use({ "windwp/nvim-ts-autotag" })

  use({ "numToStr/Comment.nvim" })

  use({ "nvim-lualine/lualine.nvim" })

  use({ "b0o/SchemaStore.nvim" })

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

vim.g.mapleader = " "
vim.opt.termguicolors = true
