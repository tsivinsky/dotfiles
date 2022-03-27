local ls = require("luasnip")
local s, i = ls.s, ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

local clg_snippet = s(
  "clg",
  fmt([[console.log({});]], {
    i(0),
  })
)

ls.snippets = {
  javascript = {
    clg_snippet,
  },
  typescript = {
    clg_snippet,
  },
  javascriptreact = {
    clg_snippet,
  },
  typescriptreact = {
    clg_snippet,
  },
  svelte = {
    clg_snippet,
  },
}

require("luasnip.loaders.from_vscode").load()
