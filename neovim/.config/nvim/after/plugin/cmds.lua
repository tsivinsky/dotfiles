local git = require("daniil.git")
local u = require("daniil.utils")

vim.api.nvim_create_user_command("OrganizeImports", function()
  u.lsp_organize_imports()
end, {})
vim.api.nvim_create_user_command("AddMissingImports", function()
  u.addMissingImports(0)
  u.lsp_format(0)
end, {})

vim.api.nvim_create_user_command("GitShowCommit", function()
  local commit = git.get_commit_hash_for_current_line()

  vim.cmd(":Git show " .. commit)
end, {})

vim.api.nvim_create_user_command("ClearMessages", function()
  require("notify").dismiss()
end, {})

vim.api.nvim_create_user_command("OpenUnsavedBuffers", function()
  require("daniil.utils").open_unsaved_buffers()
end, {})

vim.api.nvim_create_user_command("ClearQuickfixList", function()
  vim.fn.setqflist({})
end, {})

vim.api.nvim_create_user_command("GoRunFile", ":!go run %", {})
