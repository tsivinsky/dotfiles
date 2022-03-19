local nmap = require("user.utils").nmap
local vmap = require("user.utils").vmap

require("gitsigns").setup({
  signcolumn = true,
  attach_to_untracked = false,
  current_line_blame = true,
  current_line_blame_opts = {
    delay = 1000,
  },
  current_line_blame_formatter_opts = {
    relative_time = true,
  },
  on_attach = function(bufnr)
    nmap("<leader>gs", ":Gitsigns stage_hunk<CR>")
    nmap("<leader>gu", ":Gitsigns undo_stage_hunk<CR>")
    nmap("<leader>gr", ":Gitsigns reset_hunk<CR>")
    nmap("<leader>gp", ":Gitsigns preview_hunk<CR>")
    nmap("<leader>gn", ":Gitsigns next_hunk<CR>")
    nmap("<leader>gN", ":Gitsigns prev_hunk<CR>")

    vmap("gs", ":Gitsigns stage_hunk<CR>")
    vmap("gu", ":Gitsigns undo_stage_hunk<CR>")
    vmap("gr", ":Gitsigns reset_hunk<CR>")
  end,
})
