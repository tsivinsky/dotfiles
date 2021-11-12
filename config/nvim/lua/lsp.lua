local lsp_installer = require("nvim-lsp-installer")
local cmp = require("cmp")
local lspkind = require("lspkind")

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end
  },
  mapping = {
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<TAB>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ['<S-TAB>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "nvim_lua" }
  }, {
    { name = "buffer", keyword_length = 5 }
  }),
  completion = {
    completeopt = "menu,menuone,noselect,noinsert"
  },
  formatting = {
    format = lspkind.cmp_format({
      with_text = true,
      menu = {
        buffer = "[buf]",
        nvim_lsp = "[LSP]",
        path = "[path]"
      }
    })
  },
  experimental = {
    ghost_text = true
  }
})

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

lsp_installer.on_server_ready(function(server)
  local opts = {
    capabilities = capabilities
  }

  server:setup(opts)
end)
