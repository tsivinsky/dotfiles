local lsp_installer = require("nvim-lsp-installer")
local cmp = require("cmp")
local null_ls = require("null-ls")
local util = require("lspconfig").util

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

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
  sources = {
    formatting.prettierd,
    formatting.stylua,
    formatting.black,
    formatting.gofmt,
    formatting.goimports,
    formatting.shfmt,
  },
  on_attach = function()
    vim.cmd([[
      augroup LspFormatting
        autocmd! * <buffer>
        autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
      augroup END
    ]])
  end,
})

-- Other formats that work weird with null_ls
vim.cmd([[autocmd BufWritePre *.svelte lua vim.lsp.buf.formatting_sync(nil, 1000)]])

local completion_trigger = "<C-space>"
if vim.fn.has("win32") == 1 then
  completion_trigger = "<C-y>"
end

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = {
    ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    [completion_trigger] = cmp.mapping(function(fallback)
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
  documentation = {
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    zindex = 999,
    format = { "markdown" },
  },
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
      vim_item.menu = ({
        buffer = "[Buffer]",
        luasnip = "[Snippet]",
        nvim_lua = "[Lua]",
        path = "[File]",
      })[entry.source.name]

      return vim_item
    end,
  },
})

cmp.setup.cmdline("/", {
  sources = {
    { name = "cmdline" },
  },
})

cmp.setup.cmdline(":", {
  sources = {
    { name = "cmdline" },
  },
})

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

local lsps_with_disabled_formatting = { "tsserver", "gopls", "jsonls", "html" }

local on_attach = function(client, bufnr)
  if vim.tbl_contains(lsps_with_disabled_formatting, client.name) then
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end

  if client.resolved_capabilities.document_highlight then
    vim.cmd([[
      autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()
      autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
      autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    ]])
  end

  if client.name == "tailwindcss" then
    require("tailwindcss-colors").buf_attach(bufnr)
  end

  require("lsp_signature").on_attach({
    bind = true,
    hint_enable = false,
  }, bufnr)
end

lsp_installer.on_server_ready(function(server)
  local opts = {
    capabilities = capabilities,
    on_attach = on_attach,
  }

  if server.name == "sumneko_lua" then
    local runtime_path = vim.split(package.path, ";")
    table.insert(runtime_path, "lua/?.lua")
    table.insert(runtime_path, "lua/?/init/lua")

    opts.settings = {
      Lua = {
        runtime = {
          version = "LuaJIT",
          path = runtime_path,
        },
        diagnostics = {
          library = vim.api.nvim_get_runtime_file("", true),
          globals = { "vim" },
        },
        telemetry = {
          enable = false,
        },
      },
    }
  end

  if server.name == "jsonls" then
    opts.filetypes = { "json", "jsonc" }
    opts.settings = {
      json = {
        schemas = require("schemastore").json.schemas({
          select = {
            ".eslintrc",
            "package.json",
            "tsconfig.json",
            "prettierrc.json",
          },
        }),
      },
    }
  end

  if server.name == "tsserver" then
    opts.root_dir = util.root_pattern(".git", "package.json", "tsconfig.json")
  end

  server:setup(opts)
end)

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  update_in_insert = false,
  signs = false,
})

vim.cmd([[
hi DiagnosticError guifg=#e80f43
hi DiagnosticWarn guifg=#ffc914
hi DiagnosticInfo guifg=#9fd356
hi DiagnosticHint guifg=#1d74f7
]])
