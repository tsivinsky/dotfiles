local M = {}

---@param name string
---@return string
local function transform_plugin_name(name)
  if string.sub(name, 1, 6) ~= "https:" then
    name = "https://github.com/" .. name
  end

  return name
end

---@class Plugin
---@field src string
---@field version? string
---@field name? string
---@field deps? Plugin[] | string[]

---@param opts Plugin | string
function M.add(opts)
  if type(opts) == "string" then
    opts = {
      src = opts,
    }
  end

  opts.src = transform_plugin_name(opts.src)

  local items = { opts }

  if opts.deps and #opts.deps > 0 then
    for _, dep in ipairs(opts.deps) do
      if type(dep) == "string" then
        table.insert(items, {
          src = transform_plugin_name(dep),
        })
      else
        dep.src = transform_plugin_name(dep.src)
        table.insert(items, dep)
      end
    end
  end

  vim.pack.add(items)
end

function M.register_user_commands()
  vim.api.nvim_create_user_command("PackUpdate", function()
    vim.pack.update()
  end, {})

  vim.api.nvim_create_user_command("PackClean", function()
    local plugins = vim.pack.get()

    local items = {}

    for _, plug in ipairs(plugins) do
      if not plug.active then
        table.insert(items, plug.spec.name)
      end
    end

    if #items == 0 then
      return
    end

    vim.pack.del(items)

    local msg = "Deleted " .. #items .. " plugins"
    vim.notify(msg)
  end, {})
end

return M
