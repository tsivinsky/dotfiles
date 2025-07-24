-- Install lazy automagically
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.opt.termguicolors = true

require("lazy").setup({
  spec = {
    { "nvim-lua/plenary.nvim" },

    { "nvim-treesitter/nvim-treesitter" },
    { "nvim-treesitter/playground" },

    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      config = function()
        require("ts_context_commentstring").setup({})
        vim.g.skip_ts_context_commentstring_module = true
      end,
    },

    { "nvim-telescope/telescope.nvim" },

    { "tpope/vim-fugitive" },
    { "lewis6991/gitsigns.nvim" },

    {
      "hrsh7th/nvim-cmp",
      dependencies = {
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
        { "hrsh7th/cmp-cmdline" },
        { "petertriho/cmp-git" },
      },
    },

    {
      "L3MON4D3/LuaSnip",
      dependencies = {
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets",
      },
    },

    { "nvimtools/none-ls.nvim", dependencies = {
      "nvimtools/none-ls-extras.nvim",
    } },

    {
      "kyazdani42/nvim-tree.lua",
      dependencies = {
        { "kyazdani42/nvim-web-devicons" },
      },
    },

    { "windwp/nvim-autopairs", opts = {} },
    { "windwp/nvim-ts-autotag" },

    { "numToStr/Comment.nvim" },

    { "nvim-lualine/lualine.nvim" },

    { "b0o/SchemaStore.nvim" },
  },
})
