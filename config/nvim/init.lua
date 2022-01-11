require("packer").startup(function(use)
    use({"wbthomason/packer.nvim"})

    -- Colorscheme
    use({"EdenEast/nightfox.nvim"})
    use({"projekt0n/github-nvim-theme"})

    -- Treesitter
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        {
            {"p00f/nvim-ts-rainbow"},
            {"JoosepAlviste/nvim-ts-context-commentstring"},
            {"nvim-treesitter/playground"}, {"windwp/nvim-ts-autotag"}
        }
    })
    use({"haringsrob/nvim_context_vt"})

    -- Make commenting code great
    use({"tpope/vim-commentary"})

    -- File tree
    use({
        "kyazdani42/nvim-tree.lua",
        requires = {"kyazdani42/nvim-web-devicons"}
    })

    -- Automatically close brackets and quotes
    use({"windwp/nvim-autopairs"})

    -- Telescope
    use({"nvim-telescope/telescope.nvim", requires = {"nvim-lua/plenary.nvim"}})
    use({"nvim-telescope/telescope-symbols.nvim"})

    -- Statusline
    use({
        "nvim-lualine/lualine.nvim",
        requires = {"kyazdani42/nvim-web-devicons"}
    })

    use({"iamcco/markdown-preview.nvim", run = "cd app && yarn install"})

    -- Highlight colors in editor
    use({"norcalli/nvim-colorizer.lua"})

    -- LSP
    use({"neovim/nvim-lspconfig", "williamboman/nvim-lsp-installer"})
    use({"hrsh7th/nvim-cmp"})
    use({"L3MON4D3/LuaSnip"})
    use({"rafamadriz/friendly-snippets"})
    use({
        "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline", "hrsh7th/cmp-nvim-lua",
        "saadparwaiz1/cmp_luasnip"
    })
    use({"ray-x/lsp_signature.nvim"})

    -- Tabs
    use({"romgrk/barbar.nvim"})

    -- Git
    use({"lewis6991/gitsigns.nvim", requires = {"nvim-lua/plenary.nvim"}})
    use({"tpope/vim-fugitive"})

    -- Formatter
    use({"mhartington/formatter.nvim"})

    use({"caenrique/nvim-toggle-terminal"})

    use({"lukas-reineke/indent-blankline.nvim"})

    -- NOTE: Don't need this for now
    -- use({"folke/trouble.nvim"})

    use({"folke/todo-comments.nvim"})

    use({"luukvbaal/stabilize.nvim"})
end)

-- require("nightfox").load()
require("github-theme").setup({theme_style = "dark_default"})

vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = true
vim.o.swapfile = false
vim.o.encoding = "utf-8"
vim.o.hidden = true
vim.o.writebackup = false
vim.o.updatetime = 300
vim.o.shortmess = "filnxtToOFc"
vim.o.mouse = "a"
vim.o.cursorline = true
vim.o.clipboard = "unnamedplus"
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.termguicolors = true
vim.o.signcolumn = "yes"
vim.opt.fillchars:append({eob = " "})

-- Go and Lua specific settings
vim.cmd([[
autocmd FileType go,lua set tabstop=4
autocmd FileType go,lua set shiftwidth=4
autocmd FileType go,lua set noexpandtab
]])

vim.g.mapleader = " "

require("theme")
require("format")
require("lsp")
require("statusline")

require("nvim-treesitter.configs").setup({
    ensure_installed = "maintained",
    highlight = {enable = true},
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<CR>",
            scope_incremental = "<CR>",
            node_incremental = "<TAB>",
            node_decremental = "<S-TAB>"
        }
    },
    rainbow = {enable = true, extended_mode = true, disable = {"html"}},
    context_commentstring = {enable = true},
    autotag = {enable = true}
})

require("nvim-tree").setup({
    open_on_setup = true,
    hijack_cursor = true,
    auto_close = true,
    open_on_tab = true,
    update_cwd = true,
    update_focused_file = {enable = true},
    view = {width = 30, side = "left", auto_resize = true},
    filters = {custom = {".git"}},
    git = {ignore = false}
})
vim.g.nvim_tree_add_trailing = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_icons = {default = "", symlink = ""}

require("telescope").setup({
    defaults = {
        sorting_strategy = "ascending",
        file_ignore_patterns = {".git", "node_modules"}
    }
})

require("gitsigns").setup({
    current_line_blame = true,
    keymaps = {
        noremap = true,
        ["n <leader>gs"] = [[:lua require("gitsigns").stage_hunk()<CR>]],
        ["n <leader>gu"] = [[:lua require("gitsigns").undo_stage_hunk()<CR>]],
        ["n <leader>gr"] = [[:lua require("gitsigns").reset_hunk()<CR>]]
    }
})

require("indent_blankline").setup({show_end_of_line = true})

-- require("trouble").setup()

require("nvim-autopairs").setup()

require("colorizer").setup()

require("todo-comments").setup({signs = false})

require("stabilize").setup()

require("nvim_context_vt").setup()

require("remaps")
