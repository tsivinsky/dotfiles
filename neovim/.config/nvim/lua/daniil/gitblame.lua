local u = require("daniil.utils")

local M = {}

---@param line number
---@param path string
---@return string
local function get_commit_hash_at_line(line, path)
  local cmd = vim.system({ "git", "blame", "-L", line .. "," .. line, "-p", "--", path }, { text = true }):wait()

  local lines = {}
  for s in cmd.stdout:gmatch("[^\r\n]+") do
    table.insert(lines, s)
  end

  local commit_hash = lines[1]:gmatch("[^%s]+")() -- why I need to call this here but not above. i don't understand
  return commit_hash
end

---@param hash string
---@param dir string
---@return string
local function get_commit_info(hash, dir)
  local cmd = vim.system({ "git", "-C", dir, "show", hash }, { text = true }):wait()
  return cmd.stdout
end

function M.open_blame_window()
  local cursor = vim.api.nvim_win_get_cursor(0)
  local line = cursor[1]
  local buf_name = vim.fn.expand("%:.")

  local commit_hash = get_commit_hash_at_line(line, buf_name)
  local commit_info = get_commit_info(commit_hash, vim.uv.cwd())

  local bufnr, winnr = u.create_floating_window_in_center(0.75, 0.75)
  u.set_buffer_text(bufnr, commit_info)

  vim.bo[bufnr].filetype = "gitcommit"

  vim.keymap.set("n", "<esc>", ":q<CR>", { buffer = bufnr })
  vim.keymap.set("n", "q", ":q<CR>", { buffer = bufnr })

  -- TODO: open not at the top of the buffer, but on line in OG file
end

return M
