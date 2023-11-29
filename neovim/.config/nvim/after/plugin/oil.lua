local oil = require("oil")

oil.setup({
  default_file_explorer = false,
  skip_confirm_for_simple_edits = true,
  columns = {},
})

vim.keymap.set("n", "<leader>o", function()
  if vim.bo.filetype == "oil" then
    oil.close()
  else
    oil.open()
  end
end)
