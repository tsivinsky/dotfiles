local Job = require("plenary.job")

local function git_stage(node)
  local cwd = vim.loop.cwd()
  local relative_path = string.gsub(node.absolute_path, cwd .. "/", "")

  Job:new({
    command = "git",
    args = { "add", relative_path },
  }):start()

  require("nvim-tree.actions.reloaders").reload_explorer()
end

local function git_reset(node)
  local cwd = vim.loop.cwd()
  local relative_path = string.gsub(node.absolute_path, cwd .. "/", "")

  Job:new({
    command = "git",
    args = { "reset", relative_path },
  }):start()

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
  auto_reload_on_write = true,
  reload_on_bufenter = true,
  update_focused_file = {
    enable = true,
  },
  view = {
    width = 30,
    adaptive_size = true,
    side = "left",
    preserve_window_proportions = true,
    centralize_selection = true,
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
  renderer = {
    add_trailing = true,
    group_empty = true,
    highlight_git = true,
    indent_markers = {
      enable = true,
    },
    icons = {
      show = {
        git = true,
        file = true,
        folder = true,
      },
      glyphs = {
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
      },
    },
  },
  filters = {
    custom = { "^.git$" },
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
