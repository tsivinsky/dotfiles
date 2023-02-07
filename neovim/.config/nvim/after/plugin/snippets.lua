local ls = require("luasnip")
local s, i = ls.s, ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

-- NOTE: this is not working right now, i need to RTFM
ls.filetype_extend("javascript", { "javascriptreact", "javascript.jsx" })
ls.filetype_extend("typescript", { "typescriptreact", "typescript.jsx" })

local clg = s(
  "clg",
  fmt([[console.log({});]], {
    i(0),
  })
)

ls.add_snippets("javascript", { clg })
ls.add_snippets("typescript", { clg })
ls.add_snippets("svelte", { clg })

require("luasnip.loaders.from_vscode").lazy_load({
  include = { "go", "typescript", "typescriptreact", "javascript", "javascriptreact" },
})
