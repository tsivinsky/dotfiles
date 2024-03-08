local formatting = require("daniil.formatting")

vim.api.nvim_create_user_command("FormattingEnable", formatting.enable, {})
vim.api.nvim_create_user_command("FormattingDisable", formatting.disable, {})
vim.api.nvim_create_user_command("FormattingToggle", formatting.toggle, {})
vim.api.nvim_create_user_command("FormattingStatus", formatting.status, {})
