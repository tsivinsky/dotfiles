local git = require("user.git")

vim.api.nvim_create_user_command("OrganizeImports", function()
  require("user.utils").lsp_organize_imports()
end, {})

vim.api.nvim_create_user_command("GitShowCommit", function()
  local commit = git.get_commit_hash_for_current_line()

  vim.cmd(":Git show " .. commit)
end, {})

vim.api.nvim_create_user_command("ClearMessages", function()
  require("notify").dismiss()
end, {})
