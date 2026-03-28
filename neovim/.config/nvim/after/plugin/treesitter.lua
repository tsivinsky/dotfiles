local languages = {
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
}

require("nvim-treesitter").setup({
  install_dir = vim.fn.stdpath("data") .. "/site",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "*" },
  callback = function()
    pcall(vim.treesitter.start)
  end,
})

vim.api.nvim_create_user_command("NvimTSInstall", function()
  require("nvim-treesitter").install(languages)
end, {})

vim.api.nvim_create_user_command("NvimTSUpdate", function()
  require("nvim-treesitter").update(languages)
end, {})

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
