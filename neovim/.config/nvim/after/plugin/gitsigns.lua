local a = require("gitsigns.actions")
local reload_nvimtree = require("nvim-tree.actions.reloaders.reloaders").reload_explorer

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
      reload_nvimtree()
    end)
    vim.keymap.set("n", "<leader>gu", function()
      a.undo_stage_hunk()
      reload_nvimtree()
    end)
    vim.keymap.set("n", "<leader>gr", function()
      a.reset_hunk()
      reload_nvimtree()
    end)
    vim.keymap.set("n", "<leader>gp", function()
      a.preview_hunk()
      reload_nvimtree()
    end)
    vim.keymap.set("n", "<leader>gn", function()
      a.next_hunk()
      reload_nvimtree()
    end)
    vim.keymap.set("n", "<leader>gN", function()
      a.prev_hunk()
      reload_nvimtree()
    end)

    vim.keymap.set("v", "gs", function()
      a.stage_hunk()
      reload_nvimtree()
    end)
    vim.keymap.set("v", "gu", function()
      a.undo_stage_hunk()
      reload_nvimtree()
    end)
    vim.keymap.set("v", "gr", function()
      a.reset_hunk()
      reload_nvimtree()
    end)
  end,
})
