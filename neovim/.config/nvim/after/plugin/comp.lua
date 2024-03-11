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
