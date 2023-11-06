local group = vim.api.nvim_create_augroup("RootGroup", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  group = group,
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "*",
  group = group,
  callback = function()
    if vim.bo.ft ~= "fugitive" then
      return
    end

    local bufnr = vim.api.nvim_get_current_buf()
    local opts = {
      buffer = bufnr,
    }

    vim.keymap.set("n", "<leader>p", ":Git push<CR>", opts)
  end,
})
