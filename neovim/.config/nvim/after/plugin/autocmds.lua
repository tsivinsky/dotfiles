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
    local lead = "┊"
    for _ = 1, vim.bo.shiftwidth - 1 do
      lead = lead .. " "
    end
    vim.opt_local.listchars:append({ leadmultispace = lead })
  end,
})
