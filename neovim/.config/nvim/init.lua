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

pcall(require, "impatient")

require("packer").startup(function(use)
  use({ "wbthomason/packer.nvim" })

  use({ "lewis6991/impatient.nvim" })

  use({ "MunifTanjim/nui.nvim" })
  use({ "nvim-lua/popup.nvim" })
  use({ "nvim-lua/plenary.nvim" })
  use({ "folke/lua-dev.nvim" })

  -- Colorschemes go here
  use({
    { "folke/tokyonight.nvim" },
    { "nocksock/bloop-vim" },
    { "sainnhe/edge" },
    { "sainnhe/gruvbox-material" },
    { "sainnhe/sonokai" },
  })

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
  use({ "williamboman/nvim-lsp-installer" })
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

  -- Highlight todo comments
  use({
    "folke/todo-comments.nvim",
    config = function()
      require("todo-comments").setup({
        signs = false,
      })
    end,
  })

  -- Highlight colors
  use({
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "*" })
    end,
  })

  use({
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup({
        space_char_blankline = " ",
        show_current_context = true,
      })
    end,
  })

  -- Markdown preview
  use({ "iamcco/markdown-preview.nvim", run = "cd app && yarn install" })

  use({ "editorconfig/editorconfig-vim" })

  use({
    "rcarriga/nvim-notify",
    config = function()
      vim.notify = require("notify")
    end,
  })

  use({
    "pwntester/octo.nvim",
    config = function()
      require("octo").setup()
    end,
  })

  use({
    "vuki656/package-info.nvim",
    config = function()
      require("package-info").setup()
    end,
  })

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

vim.cmd([[
  hi IndentBlanklineChar guifg=#373737 guibg=none gui=none
  hi IndentBlanklineContextChar guifg=#808080 guibg=none gui=none
]])

vim.g.mapleader = " "

require("user.options")
require("user.theme")

require("nvim-autopairs").setup({})

require("user.file-tree")
require("user.treesitter")
require("user.telescope")
require("user.gitsigns")
require("user.comp")
require("user.lsp")
require("user.comment")
require("user.snippets")
require("user.lualine")
require("user.remaps")
require("user.cmds")
require("user.aus")
