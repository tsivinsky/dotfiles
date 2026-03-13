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

return M
