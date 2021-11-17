-- Tabs
require("bufferline").setup()

-- Statusline
require("lualine").setup()

require("nvim-autopairs").setup()

require("colorizer").setup()

-- Git
require("gitsigns").setup({
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol",
    delay = 500
  },
  keymaps = {
    noremap = true,
    ["n <leader>gs"] = '<cmd>lua require("gitsigns").stage_hunk()<CR>',
    ["n <leader>gu"] = '<cmd>lua require("gitsigns").undo_stage_hunk()<CR>',
    ["n <leader>gr"] = '<cmd>lua require("gitsigns").reset_hunk()<CR>'
  }
})

require("iswap").setup({
  keys = "1234567890",
  autoswap = true
})
