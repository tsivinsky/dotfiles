local telescope = require("telescope")
local actions = require("telescope.actions")
local layout_actions = require("telescope.actions.layout")
local builtin = require("telescope.builtin")
local conf = require("telescope.config").values
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local action_state = require("telescope.actions.state")

telescope.setup({
  defaults = {
    sorting_strategy = "ascending",
    file_ignore_patterns = { ".git/", "node_modules/" },
    winblend = 15,
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_worse,
        ["<C-k>"] = actions.move_selection_better,
        ["<C-p>"] = layout_actions.toggle_preview,
        ["<C-x>"] = actions.add_selected_to_qflist,
        ["<C-t>"] = actions.toggle_selection,
      },
      n = {
        ["<C-p>"] = layout_actions.toggle_preview,
        ["<C-x>"] = actions.add_selected_to_qflist,
        ["<C-t>"] = actions.toggle_selection,
      },
    },
  },
  pickers = {
    lsp_references = {
      initial_mode = "normal",
    },
    lsp_definitions = {
      initial_mode = "normal",
    },
    find_files = {
      hidden = true,
    },
    live_grep = {
      additional_args = function()
        return { "--hidden" }
      end,
    },
  },
})

vim.ui.select = function(items, opts, on_choice)
  opts = opts or {}
  local prompt = opts.prompt or "Select:"
  on_choice = on_choice or function(choice)
    print(choice)
  end

  on_choice = vim.schedule_wrap(on_choice)

  pickers
      .new({
        prompt_title = prompt,
        finder = finders.new_table({
          results = items,
          entry_maker = function(entry)
            local format_item = opts.format_item or function(item)
              return item
            end

            return {
              value = entry,
              display = format_item(entry),
              ordinal = format_item(entry),
            }
          end,
        }),
        attach_mappings = function(prompt_bufnr)
          actions.select_default:replace(function()
            local selection = action_state.get_selected_entry()
            actions.close(prompt_bufnr)
            if selection == nil then
              on_choice(nil, nil)
              return
            end
            on_choice(selection.value, selection.index)
          end)

          actions.close:enhance({
            post = function()
              on_choice(nil, nil)
            end,
          })

          return true
        end,
        sorter = conf.generic_sorter(),
      })
      :find()
end

vim.keymap.set("n", "<leader>f", builtin.find_files)
vim.keymap.set("n", "<leader>s", builtin.live_grep)
vim.keymap.set("n", "<leader>p", vim.cmd.Telescope)
