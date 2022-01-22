local tree_cb = require("nvim-tree.config").nvim_tree_callback
local nmap = require("user.utils").nmap

vim.g.nvim_tree_show_icons = {
  git = 1,
  files = 1,
  folders = 1,
}
vim.g.nvim_tree_icons = {
  default = "",
  symlink = "",
  git = {
    unstaged = "U",
    staged = "S",
    unmerged = "M",
    renamed = "R",
    untracked = "N",
    deleted = "D",
  },
}
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_add_trailing = 1
vim.g.nvim_tree_indent_markers = 1

require("nvim-tree").setup({
  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = true,
  hijack_cursor = true,
  open_on_tab = true,
  update_cwd = true,
  auto_close = true,
  update_focused_file = {
    enable = true,
  },
  view = {
    width = 30,
    side = "left",
    auto_resize = true,
    mappings = {
      list = {
        {
          key = "<C-t>",
          cb = tree_cb("tabnew"),
        },
      },
    },
  },
  filters = {
    custom = { ".git" },
  },
  git = {
    ignore = false,
  },
})

nmap("<leader>b", ":NvimTreeToggle<CR>")
