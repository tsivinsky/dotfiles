vim.g.mapleader = " "
vim.opt.termguicolors = true

local pack = require("pack")

pack.add("kyazdani42/nvim-web-devicons")
pack.add("nvim-lua/plenary.nvim")

pack.add("nvim-tree/nvim-tree.lua")

pack.add("nvim-lualine/lualine.nvim")

pack.add("nvim-telescope/telescope.nvim")

pack.add({
  src = "nvim-treesitter/nvim-treesitter",
  version = "master",
})
pack.add("windwp/nvim-ts-autotag")
pack.add("windwp/nvim-autopairs")

pack.add("tpope/vim-fugitive")
pack.add("lewis6991/gitsigns.nvim")

pack.add("numToStr/Comment.nvim")
pack.add("JoosepAlviste/nvim-ts-context-commentstring")

pack.add("b0o/SchemaStore.nvim")

pack.add({
  src = "L3MON4D3/LuaSnip",
  deps = {
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
  },
})

pack.add({
  src = "hrsh7th/nvim-cmp",
  deps = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "petertriho/cmp-git",
  },
})

pack.add({
  src = "nvimtools/none-ls.nvim",
  deps = {
    "nvimtools/none-ls-extras.nvim",
  },
})

vim.api.nvim_create_user_command("PackUpdate", function()
  vim.pack.update()
end, {})

vim.api.nvim_create_user_command("PackClean", function()
  local plugins = vim.pack.get()

  local items = {}

  for _, plug in ipairs(plugins) do
    if not plug.active then
      table.insert(items, plug.spec.name)
    end
  end

  if #items == 0 then
    return
  end

  vim.pack.del(items)

  local msg = "Deleted " .. #items .. " plugins"
  vim.notify(msg)
end, {})
