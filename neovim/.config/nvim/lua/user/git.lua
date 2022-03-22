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
    vim.keymap.set("n", "<leader>gs", ":Gitsigns stage_hunk<CR>")
    vim.keymap.set("n", "<leader>gu", ":Gitsigns undo_stage_hunk<CR>")
    vim.keymap.set("n", "<leader>gr", ":Gitsigns reset_hunk<CR>")
    vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>")
    vim.keymap.set("n", "<leader>gn", ":Gitsigns next_hunk<CR>")
    vim.keymap.set("n", "<leader>gN", ":Gitsigns prev_hunk<CR>")

    vim.keymap.set("v", "s", ":Gitsigns stage_hunk<CR>")
    vim.keymap.set("v", "u", ":Gitsigns undo_stage_hunk<CR>")
    vim.keymap.set("v", "r", ":Gitsigns reset_hunk<CR>")
  end,
})
