local formatting = require("daniil.formatting")

vim.api.nvim_create_user_command("ClearQuickfixList", function()
  vim.fn.setqflist({})
end, {})

vim.api.nvim_create_user_command("FormattingEnable", formatting.enable, {})
vim.api.nvim_create_user_command("FormattingDisable", formatting.disable, {})
vim.api.nvim_create_user_command("FormattingToggle", formatting.toggle, {})
vim.api.nvim_create_user_command("FormattingStatus", formatting.status, {})

vim.api.nvim_create_user_command("Format", function()
  local bf = vim.bo.filetype

  if bf == "typescript" or bf == "typescriptreact" then
    vim.cmd(":!npx prettier --loglevel silent -w %")
    return
  end

  vim.lsp.buf.format()
end, {})
