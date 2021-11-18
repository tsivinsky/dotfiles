require("nvim-treesitter.configs").setup({
  highlight = {
    enable = true
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    disable = { "html" }
  },
  autotag = {
    enable = true
  },
  context_commentstring = {
    enable = true
  }
})
