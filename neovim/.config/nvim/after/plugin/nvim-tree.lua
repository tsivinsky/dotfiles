local function on_attach(bufnr)
  local api = require("nvim-tree.api")

  local function opts(desc)
    return {
      desc = "nvim-tree: " .. desc,
      buffer = bufnr,
      noremap = true,
      silent = true,
      nowait = true,
    }
  end

  vim.keymap.set("n", "tn", api.node.open.tab, opts("tabnew"))
  vim.keymap.set("n", "l", api.node.open.edit, opts("edit"))
  vim.keymap.set("n", "<CR>", api.node.open.edit, opts("edit ENTER"))
  vim.keymap.set("n", "@", api.tree.change_root_to_node, opts("change root"))
  vim.keymap.set("n", "<C-v>", api.node.open.vertical, opts("vertical split"))
  vim.keymap.set("n", "<C-s>", api.node.open.horizontal, opts("horizontal split"))
  vim.keymap.set("n", "a", api.fs.create, opts("create file"))
  vim.keymap.set("n", "d", api.fs.remove, opts("remove file"))
  vim.keymap.set("n", "r", api.fs.rename, opts("rename file"))
  vim.keymap.set("n", "R", api.tree.reload, opts("reload"))
  vim.keymap.set("n", "x", api.fs.cut, opts("cut"))
  vim.keymap.set("n", "y", api.fs.copy.filename, opts("copy filename"))
  vim.keymap.set("n", "Y", api.fs.copy.relative_path, opts("copy relative path file"))
  vim.keymap.set("n", "W", api.tree.collapse_all, opts("collapse all"))
  vim.keymap.set("n", "I", api.tree.toggle_gitignore_filter, opts("toggle git ignored files"))
  vim.keymap.set("n", "H", api.tree.toggle_hidden_filter, opts("toggle hidden files"))
  vim.keymap.set("n", "<TAB>", api.node.open.preview, opts("preview node"))
  vim.keymap.set("n", "q", api.tree.close, opts("quit"))
  vim.keymap.set("n", "p", api.fs.paste, opts("paste"))
  vim.keymap.set("n", "g?", api.tree.toggle_help, opts("toggle help"))
end

require("nvim-tree").setup({
  disable_netrw = true,
  hijack_netrw = true,
  hijack_cursor = true,
  open_on_tab = false,
  update_cwd = true,
  auto_reload_on_write = true,
  reload_on_bufenter = true,
  update_focused_file = {
    enable = true,
  },
  view = {
    width = 50,
    adaptive_size = false,
    side = "left",
    preserve_window_proportions = true,
    centralize_selection = true,
    number = false,
    relativenumber = false,
  },
  renderer = {
    add_trailing = true,
    group_empty = false,
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
      quit_on_open = true,
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
  on_attach = on_attach,
})

vim.keymap.set("n", "<leader><leader>", vim.cmd.NvimTreeToggle)
