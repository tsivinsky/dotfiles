local actions = require("gitsigns.actions")

require("gitsigns").setup({
  signcolumn = true,
  attach_to_untracked = false,
  current_line_blame = true,
  current_line_blame_opts = {
    delay = 1000,
  },
  current_line_blame_formatter_opts = {
    relative_time = true,
  },
  on_attach = function(bufnr)
    vim.keymap.set("n", "gn", actions.next_hunk)
    vim.keymap.set("n", "gN", actions.prev_hunk)
    vim.keymap.set("n", "gr", actions.reset_hunk)
  end,
})

vim.keymap.set("n", "<leader>gg", ":Git<CR>")
vim.keymap.set("n", "gh", ":diffget //2<CR>")
vim.keymap.set("n", "gl", ":diffget //3<CR>")
