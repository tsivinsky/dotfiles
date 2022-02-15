local telescope = require("telescope")

telescope.setup({
  defaults = {
    sorting_strategy = "ascending",
    file_ignore_patterns = { ".git/", "node_modules/" },
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

telescope.load_extension("fzf")
