require("packer").startup(function(use)
  use({ "wbthomason/packer.nvim" })

  -- Colorscheme
  use({ "EdenEast/nightfox.nvim" })

  -- Treesitter
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", {
    { "p00f/nvim-ts-rainbow" },
    { "JoosepAlviste/nvim-ts-context-commentstring" },
    { "nvim-treesitter/playground" }
  }})

  -- Make commenting code great
  use({ "tpope/vim-commentary" })

  -- File tree
  use({ "kyazdani42/nvim-tree.lua", requires = { "kyazdani42/nvim-web-devicons" } })

  -- Automatically close brackets and quotes
  use({ "windwp/nvim-autopairs" })

  -- Telescope
  use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } })
  use({ "nvim-telescope/telescope-symbols.nvim" })

  -- Statusline
  use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })

  use({ "iamcco/markdown-preview.nvim", run = "cd app && yarn install" })

  -- Highlight colors in editor
  use({ "norcalli/nvim-colorizer.lua" })

  -- LSP
  use({ "neovim/nvim-lspconfig" })
  use({ "hrsh7th/nvim-cmp" })
  use({ "L3MON4D3/LuaSnip" })
  use({
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lua",
    "saadparwaiz1/cmp_luasnip"
  })
  use({ "ray-x/lsp_signature.nvim" })
  use({ "dense-analysis/ale" })

  -- Tabs
  use({ "romgrk/barbar.nvim" })

  -- Git
  use({ "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } })
  use({ "tpope/vim-fugitive" })
end)

require("nightfox").load()

vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = true
vim.o.swapfile = true
vim.o.encoding = "utf-8"
vim.o.hidden = true
vim.o.writebackup = false
vim.o.cmdheight = 2
vim.o.updatetime = 300
vim.o.shortmess = "filnxtToOFc"
vim.o.mouse = "a"
vim.o.cursorline = true
vim.o.clipboard = "unnamedplus"
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.termguicolors = true
vim.o.signcolumn = "yes"

vim.g.mapleader = " "

require("lsp")

vim.cmd("let g:ale_fixers = {'javascript': ['prettier', 'eslint'], 'typescript': ['prettier', 'eslint'], 'python': ['autopep8', 'remove_trailing_lines', 'reorder-python-imports', 'trim_whitespace']}")
vim.cmd("let g:ale_fix_on_save = 1")

require("nvim-treesitter.configs").setup({
  ensure_installed = "maintained",
  highlight = {
    enable = true
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    disable = { "html" }
  },
  context_commentstring = {
    enable = true
  }
})

require("nvim-tree").setup({
  open_on_setup = true,
  hijack_cursor = true,
  update_cwd = true,
  update_focused_file = { enable = true },
  view = { width = 30, side = "left", auto_resize = true },
  filters = { custom = { ".git" } }
})
vim.g.nvim_tree_add_trailing = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_show_icons = { git = 0, folders = 0, files = 0, folder_arrows = 0 }

require("telescope").setup({
  defaults = {
    sorting_strategy = "ascending",
    file_ignore_patterns = { ".git", "node_modules" }
  }
})

require("gitsigns").setup({
  current_line_blame = true,
})

require("nvim-autopairs").setup()

require("lualine").setup()

require("colorizer").setup()

require("remaps")
