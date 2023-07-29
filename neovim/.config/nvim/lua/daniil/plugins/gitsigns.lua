local a = require("gitsigns.actions")

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
    vim.keymap.set("n", "<leader>gs", function()
      a.stage_hunk()
    end)
    vim.keymap.set("n", "<leader>gu", function()
      a.undo_stage_hunk()
    end)
    vim.keymap.set("n", "<leader>gr", function()
      a.reset_hunk()
    end)
    vim.keymap.set("n", "<leader>gp", function()
      a.preview_hunk()
    end)
    vim.keymap.set("n", "<leader>gn", function()
      a.next_hunk()
    end)
    vim.keymap.set("n", "<leader>gN", function()
      a.prev_hunk()
    end)

    vim.keymap.set("v", "gs", function()
      a.stage_hunk()
    end)
    vim.keymap.set("v", "gu", function()
      a.undo_stage_hunk()
    end)
    vim.keymap.set("v", "gr", function()
      a.reset_hunk()
    end)
  end,
})
