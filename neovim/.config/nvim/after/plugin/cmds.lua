local git = require("daniil.git")

vim.api.nvim_create_user_command("GitShowCommit", function()
  local commit = git.get_commit_hash_for_current_line()

  vim.cmd(":Git show " .. commit)
end, {})

vim.api.nvim_create_user_command("OpenUnsavedBuffers", function()
  require("daniil.utils").open_unsaved_buffers()
end, {})

vim.api.nvim_create_user_command("ClearQuickfixList", function()
  vim.fn.setqflist({})
end, {})
