local lsp_installer = require("nvim-lsp-installer")
local cmp = require("cmp")

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
  TypeParameter = ""
}

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end
  },
  mapping = {
    ['<C-y>'] = cmp.config.disable,
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true, behavior = cmp.SelectBehavior.Insert }),
    ['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ['<C-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    ['<TAB>'] = cmp.mapping.confirm({ behavior = cmp.SelectBehavior.Insert })
  },
  sources = { { name = "nvim_lsp" }, { name = "luasnip" }, { name = "nvim_lua" }, { name = "path" }, { name = "buffer", keyword_length = 5 } },
  completion = { completeopt = "menu,menuone,noselect,noinsert" },
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
      vim_item.menu = ({ buffer = "[Buffer]", nvim_lsp = "[LSP]", luasnip = "[Snippet]", nvim_lua = "[Lua]", path = "[File]" })[entry.source.name]
      return vim_item
    end
  },
  experimental = { ghost_text = true },
  documentation = { border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }, zindex = 999 }
})

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

lsp_installer.on_server_ready(function(server)
  local opts = { capabilities = capabilities }

  if server.name == "sumneko_lua" then
    opts = {
      capabilities = capabilities,
      settings = {
        Lua = {
          runtime = { version = "LuaJIT", path = vim.split(package.path, ";") },
          diagnostics = { globals = { "vim" } },
          workspace = {
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
              [vim.fn.expand("$HOME/.local/share/nvim/site/pack/packer/start")] = true
            }
          }
        }
      }
    }
  end

  if server.name == "efm" then
    opts = {
      capabilities = capabilities,
      init_options = { documentFormatting = true },
      filetypes = { "lua" },
      settings = {
        rootMarkers = { ".git/" },
        languages = {
          lua = {
            {
              formatCommand = "lua-format -i --no-keep-simple-function-one-line --no-break-after-operator --column-limit=150 --break-after-table-lb --tab-width 2 --indent-width 2 --spaces-inside-table-braces",
              formatStdin = true
            }
          }
        }
      }
    }
  end

  require("lsp_signature").setup({ bind = true })

  server:setup(opts)
end)
