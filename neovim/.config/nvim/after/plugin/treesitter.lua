require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "bash",
    "c",
    "cmake",
    "comment",
    "css",
    "dockerfile",
    "go",
    "gomod",
    "html",
    "javascript",
    "jsdoc",
    "json",
    "jsonc",
    "lua",
    "make",
    "markdown",
    "python",
    "rust",
    "scss",
    "svelte",
    "tsx",
    "typescript",
    "vim",
    "yaml",
  },
  highlight = {
    enable = true,
  },
})

require("nvim-ts-autotag").setup({
  opts = {
    enable_close = true,
    enable_rename = true,
    enable_close_on_slash = false,
  },
})
