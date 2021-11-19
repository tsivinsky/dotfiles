require("nvim-tree").setup({
  open_on_setup = true,
  hijack_cursor = true,
  auto_close = true,
  update_cwd = true,
  update_focused_file = {
    enable = true
  },
  view = {
    width = 30,
    side = "left",
    auto_resize = true
  },
  filters = {
    custom = { ".git" }
  }
})

vim.g.nvim_tree_add_trailing = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_show_icons = {
  git = 0,
  folders = 0,
  files = 0,
  folder_arrows = 0
}
