local actions = require("gitsigns.actions")
local telescope_builtin = require("telescope.builtin")

require("gitsigns").setup({
  signcolumn = true,
  sign_priority = 20,
  attach_to_untracked = false,
  current_line_blame = true,
  current_line_blame_opts = {
    delay = 1000,
  },
  on_attach = function(bufnr)
    vim.keymap.set("n", "gn", actions.next_hunk)
    vim.keymap.set("n", "gN", actions.prev_hunk)
    vim.keymap.set({ "n", "v" }, "<leader>gr", actions.reset_hunk)
  end,
})

vim.keymap.set("n", "<leader>gg", vim.cmd.Git)
vim.keymap.set("n", "<leader>gb", function()
  telescope_builtin.git_branches({
    show_remote_tracking_branches = false,
  })
end)
