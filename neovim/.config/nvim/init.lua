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

local function safe_require(mod_name)
  local ok, mod = pcall(require, mod_name)
  if not ok then
    return print("Error: " .. mod_name .. " didn't imported properly")
  end

  return mod
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
  use({ "folke/tokyonight.nvim" })
  use({ "sainnhe/edge" })
  use({ "sainnhe/gruvbox-material" })
  use({ "nocksock/bloop-vim" })

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
      safe_require("tailwindcss-colors").setup()
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
      safe_require("todo-comments").setup({
        signs = false,
      })
    end,
  })

  -- Highlight colors
  use({
    "norcalli/nvim-colorizer.lua",
    config = function()
      safe_require("colorizer").setup({ "*" })
    end,
  })

  use({
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      safe_require("indent_blankline").setup({
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
      safe_require("octo").setup()
    end,
  })

  use({
    "vuki656/package-info.nvim",
    config = function()
      safe_require("package-info").setup()
    end,
  })

  use({
    "dstein64/nvim-scrollview",
    config = function()
      safe_require("scrollview").setup({
        excluded_filetypes = { "NvimTree" },
        current_only = true,
        winblend = 50,
      })
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

safe_require("user.options")
safe_require("user.theme")

safe_require("nvim-autopairs").setup({})

safe_require("user.file-tree")
safe_require("user.treesitter")
safe_require("user.telescope")
safe_require("user.gitsigns")
safe_require("user.comp")
safe_require("user.lsp")
safe_require("user.comment")
safe_require("user.snippets")
safe_require("user.lualine")
safe_require("user.remaps")
safe_require("user.cmds")
safe_require("user.aus")
