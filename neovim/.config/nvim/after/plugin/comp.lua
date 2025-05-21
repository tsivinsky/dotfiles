local cmp = require("cmp")
local ls = require("luasnip")

require("cmp_git").setup()

cmp.setup({
  snippet = {
    expand = function(args)
      ls.lsp_expand(args.body)
    end,
  },
  mapping = {
    ["<C-j>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
      else
        ls.jump(1)
      end
    end),
    ["<C-k>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
      else
        ls.jump(-1)
      end
    end),
    ["<C-space>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.close()
      else
        cmp.complete()
      end
    end),
    ["<TAB>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.confirm({
          select = true,
          behavior = cmp.SelectBehavior.Insert,
        })
      else
        fallback()
      end
    end),
    ["<C-S-j>"] = cmp.mapping.scroll_docs(4),
    ["<C-S-k>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping(function(fallback)
      if ls.expand_or_jumpable() then
        ls.expand_or_jump()
      else
        fallback()
      end
    end),
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
  }, {
    { name = "path" },
    { name = "buffer" },
  }),
  completion = {
    completeopt = "menu,menuone,noselect,noinsert,preview",
  },
  sorting = {
    comparators = {
      cmp.config.compare.score,
      cmp.config.compare.sort_text,
      cmp.config.compare.kind,
    },
  },
})

cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
})

cmp.setup.filetype("gitcommit", {
  sources = cmp.config.sources({
    { name = "git" },
  }, {
    { name = "buffer" },
  }),
})

require("luasnip.loaders.from_vscode").lazy_load()

local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local d = ls.dynamic_node
local sn = ls.snippet_node
local fmt = require("luasnip.extras.fmt").fmt

local ts_utils = require("nvim-treesitter.ts_utils")

ls.add_snippets("go", {
  s(
    "iferr",
    fmt(
      [[
    if err != nil {
      <>
    }
    ]],
      {
        d(1, function()
          local current_node = ts_utils.get_node_at_cursor(0, true)
          if not current_node then
            return ""
          end

          local func = current_node
          while func do
            if func:type() == "function_declaration" then
              break
            end
            func = func:parent()
          end

          if not func then
            return ""
          end

          local return_type_node = func:child(3)
          if not return_type_node then
            return ""
          end

          local params = {}
          for index = 0, return_type_node:child_count(), 1 do
            local param = return_type_node:child(index)
            if param then
              if param:type() == "parameter_declaration" then
                local text = ts_utils.get_node_text(param)
                table.insert(params, text[1])
              end
            end
          end

          local rec = {
            ["string"] = '""',
            ["int"] = "0",
            ["uint"] = "0",
            ["error"] = "err",
          }

          local size = vim.tbl_count(params)

          if size == 0 then
            return sn(nil, { i(1) })
          end

          local x = { t("return ") }
          for index, param in ipairs(params) do
            local replace = rec[param]
            if replace ~= nil then
              table.insert(x, i(index, replace))
            else
              table.insert(x, i(index, param))
            end

            if index < size then
              table.insert(x, t(", "))
            end
          end

          return sn(nil, x)
        end, {}),
      },
      {
        delimiters = "<>",
      }
    )
  ),
})
