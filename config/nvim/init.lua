require("plugins")
require("general")

require("treesitter")
require("file-tree")
require("telescope-config")
require("lsp")

require("remaps")

-- Tabs
require("bufferline").setup()

-- Statusline
require("lualine").setup()

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

require("nvim-autopairs").setup()

require("colorizer").setup()

-- Automatically formatting buffer on save
vim.api.nvim_command("autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()")
