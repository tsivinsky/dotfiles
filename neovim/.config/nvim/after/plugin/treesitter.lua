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

-- colors generated using coolors.co
-- https://coolors.co/008bf8-43aa8b-ffc145-db4b4b
vim.api.nvim_set_hl(0, "@comment.todo", { bg = "none", fg = "#008BF8", italic = true, blend = 100 })
vim.api.nvim_set_hl(0, "@comment.note", { bg = "none", fg = "#43AA8B", italic = true, blend = 100 })
vim.api.nvim_set_hl(0, "@comment.warning", { bg = "none", fg = "#FFC145", italic = true, blend = 100 })
vim.api.nvim_set_hl(0, "@comment.error", { bg = "#db4b4b", fg = "white", italic = true, blend = 100 })
