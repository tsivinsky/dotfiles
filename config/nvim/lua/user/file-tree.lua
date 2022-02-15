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
vim.g.nvim_tree_group_empty = 1

-- TODO: don't know if these keymaps are working on windows, need to check
local function git_stage(node)
  local cwd = vim.loop.cwd()
  local relative_path = string.gsub(node.absolute_path, cwd .. "/", "")

  os.execute("git stage " .. relative_path)
end
local function git_reset(node)
  local cwd = vim.loop.cwd()
  local relative_path = string.gsub(node.absolute_path, cwd .. "/", "")

  os.execute("git reset " .. relative_path)
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
        { key = "gr", action = "git_restore", action_cb = git_reset },
        { key = "l", action = "edit" },
      },
    },
  },
  filters = {
    custom = { ".git" },
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

nmap("<leader>b", ":NvimTreeToggle<CR>")
