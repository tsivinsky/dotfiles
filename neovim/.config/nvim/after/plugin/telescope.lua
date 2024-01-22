local telescope = require("telescope")
local actions = require("telescope.actions")
local layout_actions = require("telescope.actions.layout")
local builtin = require("telescope.builtin")

telescope.setup({
  defaults = {
    sorting_strategy = "ascending",
    file_ignore_patterns = { ".git/", "node_modules/" },
    winblend = 15,
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_worse,
        ["<C-k>"] = actions.move_selection_better,
        ["<C-p>"] = layout_actions.toggle_preview,
        ["<C-x>"] = actions.add_selected_to_qflist,
        ["<C-t>"] = actions.toggle_selection,
      },
      n = {
        ["<C-p>"] = layout_actions.toggle_preview,
        ["<C-x>"] = actions.add_selected_to_qflist,
        ["<C-t>"] = actions.toggle_selection,
      },
    },
  },
  pickers = {
    lsp_references = {
      initial_mode = "normal",
    },
    lsp_definitions = {
      initial_mode = "normal",
    },
    find_files = {
      hidden = true,
    },
    live_grep = {
      additional_args = function()
        return { "--hidden" }
      end,
    },
  },
})

vim.keymap.set("n", "<leader>f", builtin.find_files)
vim.keymap.set("n", "<leader>s", builtin.live_grep)
vim.keymap.set("n", "<leader>p", vim.cmd.Telescope)
