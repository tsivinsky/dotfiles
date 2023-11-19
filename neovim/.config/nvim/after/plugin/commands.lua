local formatting = require("daniil.formatting")

vim.api.nvim_create_user_command("ClearQuickfixList", function()
  vim.fn.setqflist({})
end, {})

vim.api.nvim_create_user_command("FormattingEnable", formatting.enable, {})
vim.api.nvim_create_user_command("FormattingDisable", formatting.disable, {})
vim.api.nvim_create_user_command("FormattingToggle", formatting.toggle, {})
vim.api.nvim_create_user_command("FormattingStatus", formatting.status, {})

vim.api.nvim_create_user_command("LspCommands", function()
  vim.ui.input({ prompt = "LSP server: " }, function(input)
    local clients = vim.lsp.get_active_clients()
    for _, client in ipairs(clients) do
      if client.name == input then
        print(vim.inspect(client.server_capabilities.executeCommandProvider.commands))
      end
    end
  end)
end, {})

vim.api.nvim_create_user_command("CodelensList", function()
  vim.lsp.codelens.refresh()

  local codelens = vim.lsp.codelens.get()
  vim.ui.select(codelens, {
    prompt = "What codelens to run:",
    format_item = function(item)
      return item.command.title
    end,
  }, function(choice)
    vim.lsp.buf.execute_command(choice.command)
  end)
end, {})

vim.api.nvim_create_user_command("CodelensRefresh", function()
  vim.lsp.codelens.refresh()
end, {})
