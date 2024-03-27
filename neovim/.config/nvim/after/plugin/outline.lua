require("outline").setup({
  outline_window = {
    auto_close = true,
    center_on_jump = true,
  },
  preview_window = {
    auto_preview = true,
    live = true,
  },
})

vim.keymap.set("n", "<leader>o", vim.cmd.Outline)
