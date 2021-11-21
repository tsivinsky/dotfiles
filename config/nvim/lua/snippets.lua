local ls = require("luasnip")
-- local parse = ls.parser.parse_snippet

ls.config.set_config({
  history = true,
  -- Update more often, :h events for more info.
  updateevents = "TextChanged,TextChangedI"
})

require("luasnip/loaders/from_vscode").lazy_load()
