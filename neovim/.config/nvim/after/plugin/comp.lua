local cmp = require("cmp")
local ls = require("luasnip")

require("cmp_git").setup()

local kind_icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "ﴯ",
  Interface = "",
  Module = "",
  Property = "ﰠ",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}

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
    ["<TAB>"] = cmp.mapping.confirm({
      select = true,
      behavior = cmp.SelectBehavior.Insert,
    }),
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
  experimental = {
    ghost_text = true,
  },
  sorting = {
    comparators = {
      cmp.config.compare.score,
      cmp.config.compare.sort_text,
      cmp.config.compare.kind,
    },
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
      vim_item.menu = ({
        buffer = "[Buffer]",
        luasnip = "[Snippet]",
        nvim_lua = "[Lua]",
        path = "[File]",
        nvim_lsp = "[LSP]",
      })[entry.source.name]

      return vim_item
    end,
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
