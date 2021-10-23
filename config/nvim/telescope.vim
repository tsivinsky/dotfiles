lua << EOF
  require("telescope").setup {
    pickers = {
      defaults = {
        sorting_strategy = "ascending",
        file_ignore_patterns = { "^node_modules/" }
      }
    }
  }
EOF

