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
    ["<CR>"] = cmp.mapping(function(fallback)
      fallback()
    end),
    ["<C-u>"] = cmp.mapping(function(fallback)
      if ls.jumpable(1) then
        ls.jump(1)
      else
        fallback()
      end
    end),
    ["<C-i>"] = cmp.mapping(function(fallback)
      if ls.jumpable(-1) then
        ls.jump(-1)
      else
        fallback()
      end
    end),
    ["<C-j>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
      else
        fallback()
      end
    end),
    ["<C-k>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
      else
        fallback()
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
    ["<C-n>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.mapping.scroll_docs(4)
      else
        fallback()
      end
    end),
    ["<C-m>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.mapping.scroll_docs(-4)
      else
        fallback()
      end
    end),
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
