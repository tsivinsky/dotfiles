local group = vim.api.nvim_create_augroup("RootGroup", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  group = group,
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  group = group,
  callback = function()
    vim.cmd(":checktime")
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  group = group,
  callback = function()
    local ft = vim.bo.filetype

    if ft == "fugitive" then
      vim.wo.colorcolumn = ""
    end

    if ft == "gitcommit" then
      vim.wo.colorcolumn = "50"
      vim.cmd("setlocal spell")
    end
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  group = group,
  callback = function()
    vim.cmd(":silent :!goimports -w %")
  end,
})
