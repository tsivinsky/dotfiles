local function get_available_session_names()
  local sessions = require("possession.query").as_list()

  local available_names = {}
  for _, session in ipairs(sessions) do
    table.insert(available_names, session.name)
  end

  return available_names
end

local function choose_session(available_names, prompt)
  local name

  vim.ui.select(available_names, {
    prompt = prompt,
  }, function(ans)
    name = ans
  end)

  return name
end

local function save_session()
  local default_name = "temp-session-" .. math.random(0, 99)
  local name

  vim.ui.input({
    prompt = "Session name: ",
  }, function(ans)
    name = ans or default_name
  end)

  require("possession.commands").save(name)
end

local function list_sessions()
  require("telescope").extensions.possession.list()
end

local function use_session()
  local available_names = get_available_session_names()
  local name = choose_session(available_names, "Choose session to load")

  if name == nil then
    print("no session? :(")
    return
  end

  require("possession.commands").load(name)
end

local function delete_session()
  local available_names = get_available_session_names()
  local name = choose_session(available_names, "Choose session to delete")

  if name == nil then
    print("no session? :(")
    return
  end

  require("possession.commands").delete(name)
end

-- remaps
vim.keymap.set("n", "<leader>ss", save_session)
vim.keymap.set("n", "<leader>sl", list_sessions)
vim.keymap.set("n", "<leader>su", use_session)
vim.keymap.set("n", "<leader>sd", delete_session)
