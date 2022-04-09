local lsp_installer = require("nvim-lsp-installer")
local null_ls = require("null-ls")
local util = require("lspconfig").util

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
    local group = vim.api.nvim_create_augroup("NullLsLspFormatting", { clear = true })
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      group = group,
      callback = vim.lsp.buf.formatting_sync,
    })
  end,
})

-- Other formats that work weird with null_ls
local group = vim.api.nvim_create_augroup("OtherLspFormatting", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.svelte" },
  group = group,
  callback = vim.lsp.buf.formatting_sync,
})

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

local lsps_with_disabled_formatting = { "tsserver", "gopls", "jsonls", "html", "sumneko_lua" }

local on_attach = function(client, bufnr)
  if vim.tbl_contains(lsps_with_disabled_formatting, client.name) then
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
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
    local luadev = require("lua-dev").setup({
      lspconfig = {
        capabilities = capabilities,
        on_attach = on_attach,
      },
    })

    opts = luadev
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
            "babelrc.json",
            "Vercel",
            "cypress.json",
            "GitHub Action",
            "GitHub Workflow",
            "lerna.json",
            "openapi.json",
            ".postcssrc",
            "prisma.yml",
            "Swagger API 2.0",
            "huskyrc",
            "jsdoc",
            ".commitlintrc",
            "docker-compose.yml",
            ".yarnrc.yml",
            "swcrc",
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
