local Job = require("plenary.job")

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
vim.g.nvim_tree_group_empty = 1

local function git_stage(node)
  local cwd = vim.loop.cwd()
  local relative_path = string.gsub(node.absolute_path, cwd .. "/", "")

  Job
    :new({
      command = "git",
      args = { "add", relative_path },
    })
    :start()

  require("nvim-tree.actions.reloaders").reload_explorer()
end
local function git_reset(node)
  local cwd = vim.loop.cwd()
  local relative_path = string.gsub(node.absolute_path, cwd .. "/", "")

  Job
    :new({
      command = "git",
      args = { "reset", relative_path },
    })
    :start()

  require("nvim-tree.actions.reloaders").reload_explorer()
end
-- TODO: add here keymap for git diff window

require("nvim-tree").setup({
  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = true,
  hijack_cursor = true,
  open_on_tab = false,
  update_cwd = true,
  update_focused_file = {
    enable = true,
  },
  view = {
    width = 30,
    side = "left",
    auto_resize = true,
    mappings = {
      list = {
        { key = "tn", action = "tabnew" },
        { key = "gs", action = "git_stage", action_cb = git_stage },
        { key = "gr", action = "git_reset", action_cb = git_reset },
        { key = "l", action = "edit" },
        { key = "@", action = "cd" },
      },
    },
  },
  filters = {
    custom = { ".git" },
  },
  actions = {
    open_file = {
      resize_window = true,
    },
  },
  git = {
    ignore = true,
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = { hint = "", info = "", warning = "", error = "" },
  },
})
