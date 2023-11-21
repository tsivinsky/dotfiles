local group = vim.api.nvim_create_augroup("RootGroup", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  group = group,
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
  pattern = "*",
  group = group,
  callback = function()
    vim.lsp.codelens.refresh()
  end,
})
