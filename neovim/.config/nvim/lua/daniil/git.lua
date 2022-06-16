local u = require("daniil.utils")

local git = {}

--- @return string commit_hash
function git.get_commit_hash_for_current_line()
  local fullpath = vim.api.nvim_buf_get_name(0)
  local cwd = vim.loop.cwd()
  local relative_path = string.gsub(fullpath, cwd .. "/", "")

  local line = unpack(vim.api.nvim_win_get_cursor(0))

  local f = io.popen("git blame -L " .. line .. ",+1 " .. relative_path, "r")
  local data = f:read("*a")
  f:close()

  local commit_hash = vim.split(data, " ")[1]

  return commit_hash
end

--- @return string git_remote_url
function git.get_remote_url()
  local f = io.popen("git remote get-url origin", "r")
  local remote_url = f:read("*l")
  f:close()

  if string.sub(remote_url, 0, 4) == "git@" then
    remote_url = string.gsub(remote_url, "git@", "")
    remote_url = string.gsub(remote_url, ".git", "")
    remote_url = string.gsub(remote_url, ":", "/")
  end

  if string.sub(remote_url, 0, 5) ~= "https" then
    remote_url = "https://" .. remote_url
  end

  return remote_url
end

function git.open_commit_on_github()
  local commit_hash = git.get_commit_hash_for_current_line()
  local remote_url = git.get_remote_url()

  if commit_hash == "00000000" then
    print("Not committed yet")
    return
  end

  local commit_url = remote_url .. "/commit/" .. commit_hash

  u.open_url_in_browser(commit_url)
end

return git
