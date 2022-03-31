local Job = require("plenary.job")

local M = {}

M.yank = function(message)
  if vim.fn.has("win32") == 1 then
    os.execute("echo '" .. message .. "' | win32yank -i")
  else
    -- i use wayland, so there is no xclip for X11
    os.execute("echo -n '" .. message .. "' | wl-copy")
  end
end

M.copy_diagnostic_message = function()
  local diagnostics = vim.lsp.diagnostic.get_line_diagnostics()

  if #diagnostics == 0 then
    print("No diagnostics to yank")
    return
  end

  local message = ""

  if #diagnostics == 1 then
    message = diagnostics[1].message
  elseif #diagnostics > 1 then
    local d = {}
    for _, diagnostic in ipairs(diagnostics) do
      table.insert(d, diagnostic.message)
    end

    vim.ui.select(d, { prompt = "Pick a diagnostic to yank" }, function(item)
      message = item
    end)
  end

  M.yank(message)

  print("Diagnostic message was yanked")
end

M.lsp_organize_imports = function(bufnr, timeout)
  if not bufnr then
    bufnr = vim.api.nvim_get_current_buf()
  end

  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(bufnr) },
    title = "",
  }

  vim.lsp.buf_request_sync(bufnr, "workspace/executeCommand", params, timeout or 500)
end

M.get_commit_hash_for_current_line = function()
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

M.get_git_remote_url = function()
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

M.open_url_in_browser = function(url)
  if vim.fn.has("win32") == 1 then
    print("windows not supported, sorry")
    return
  end

  local f = io.popen("xdg-open " .. url, "r")
  f:close()
end

M.open_commit_on_github = function()
  local commit_hash = M.get_commit_hash_for_current_line()
  local remote_url = M.get_git_remote_url()

  if commit_hash == "00000000" then
    print("Not committed yet")
    return
  end

  local commit_url = remote_url .. "/commit/" .. commit_hash

  M.open_url_in_browser(commit_url)
end

return M
