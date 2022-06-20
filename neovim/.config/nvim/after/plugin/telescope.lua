local telescope = require("telescope")
local actions = require("telescope.actions")
local layout_actions = require("telescope.actions.layout")

telescope.setup({
  defaults = {
    sorting_strategy = "ascending",
    file_ignore_patterns = { ".git/", "node_modules/" },
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_worse,
        ["<C-k>"] = actions.move_selection_better,
        ["<C-d>"] = function(prompt_bufnr)
          actions.delete_buffer(prompt_bufnr)
        end,
        ["<C-p>"] = layout_actions.toggle_preview,
      },
      n = {
        ["<C-d>"] = function(prompt_bufnr)
          actions.delete_buffer(prompt_bufnr)
        end,
        ["<C-p>"] = layout_actions.toggle_preview,
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
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
  },
})

if vim.fn.has("win32") == 0 then
  require("telescope").load_extension("fzf")
end

telescope.load_extension("possession")