vim.api.nvim_create_user_command("ClearQuickfixList", function()
  vim.fn.setqflist({})
end, {})
