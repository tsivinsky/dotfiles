--[
-- i don't use this module but i didn't want to delete either. i'll just leave it here until the end of times.
--]

local curl = require("plenary.curl")
local async = require("plenary.async")

---@param messages {role: string; content: string}[]
---@param model string
---@param ollama_url string
---@param callback fun(data:any)
local send_prompt_request = function(messages, model, ollama_url, callback)
  curl.request({
    method = "POST",
    url = ollama_url .. "/api/chat",
    body = vim.json.encode({
      model = model,
      messages = messages,
      stream = true,
    }),
    headers = {
      content_type = "application/json",
    },
    stream = function(_, chunk)
      if chunk == nil then
        return
      end
      callback(chunk)
    end,
  })
end

local M = {
  sessions = {},
}

---@param opts {
--- ollama_url: string;
--- model: string;
---}
function M.setup(opts)
  M.ollama_url = opts.ollama_url
  M.model = opts.model
end

---@param buf_name string
---@return integer
local function create_buffer(buf_name)
  local buf = vim.api.nvim_create_buf(false, false)
  vim.api.nvim_buf_set_name(buf, buf_name)
  vim.bo[buf].buftype = "acwrite"
  vim.bo[buf].bufhidden = "hide"
  vim.bo[buf].swapfile = false
  vim.bo[buf].modifiable = true

  return buf
end

---@param buf integer
---@return integer
local function create_window(buf)
  local term_width = tonumber(vim.api.nvim_get_option_value("columns", { scope = "global" }))
  local term_height = tonumber(vim.api.nvim_get_option_value("lines", { scope = "global" }))

  local row, col = unpack(vim.api.nvim_win_get_cursor(0))

  local win_width = math.min(term_width - col - 5, 150)
  local win_height = math.min(term_height - row - 5, 30)

  local win = vim.api.nvim_open_win(
    buf,
    true,
    { relative = "cursor", row = 1, col = 1, width = win_width, height = win_height, anchor = "NW", border = "single" }
  )

  vim.wo[win].signcolumn = "no"
  vim.wo[win].number = false
  vim.wo[win].relativenumber = false

  return win
end

---@param buf integer
function M._close_buffer(buf)
  vim.api.nvim_win_close(vim.api.nvim_get_current_win(), true)
  vim.api.nvim_buf_delete(buf, { unload = true, force = true })
  M.sessions = {}
end

function M.prompt()
  local id = #M.sessions + 1
  M.sessions[id] = { messages = {} }

  local buf = create_buffer("ai_prompt_" .. id)

  vim.api.nvim_create_autocmd("BufWriteCmd", {
    buffer = buf,
    callback = function()
      vim.bo[buf].modified = false

      local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
      local content = table.concat(lines, "\n")
      table.insert(lines, "")
      table.insert(lines, "")

      vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

      table.insert(M.sessions[id].messages, { role = "user", content = content })

      async.void(send_prompt_request)(M.sessions[id].messages, M.model, M.ollama_url, function(chunk)
        if chunk == nil then
          return
        end

        vim.schedule(function()
          local data = vim.json.decode(chunk)
          if data.done then
            return
          end

          local lastMessage = M.sessions[id].messages[#M.sessions[id].messages]
          if lastMessage.role == "user" then
            table.insert(M.sessions[id].messages, data.message)
            lastMessage = data.message
          else
            M.sessions[id].messages[#M.sessions[id].messages] = {
              role = lastMessage.role,
              content = lastMessage.content .. data.message.content,
            }
          end

          local all_lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
          all_lines[#all_lines] = all_lines[#all_lines] .. data.message.content
          local s = table.concat(all_lines, "\n")

          vim.api.nvim_buf_set_lines(buf, 0, -1, false, vim.split(s, "\n"))
        end)
      end)
    end,
  })

  vim.keymap.set("n", "q", function()
    M._close_buffer(buf)
  end, { buf = buf })

  vim.keymap.set("n", "c", function()
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, {})
  end, { buf = buf })

  create_window(buf)
end

return M
