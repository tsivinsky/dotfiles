vim.api.nvim_add_user_command("OrganizeImports", function()
  require("user.utils").lsp_organize_imports()
end, {})
