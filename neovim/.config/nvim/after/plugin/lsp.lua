local mason = require("mason")
local lsp_installer = require("mason-lspconfig")
local lspconfig = require("lspconfig")
local null_ls = require("null-ls")
local util = require("lspconfig").util
local u = require("daniil.utils")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

mason.setup()

lsp_installer.setup({
  ensure_installed = {
    "bashls",
    "cssmodules_ls",
    "dockerls",
    "tailwindcss",
    "tsserver",
    "vimls",
    "cssls",
    "html",
    "jsonls",
    "svelte",
    "emmet_ls",
    "eslint",
    "gopls",
  },
  automatic_installation = true,
})

null_ls.setup({
  sources = {
    formatting.prettierd,
    formatting.stylua,
    formatting.gofmt,
    formatting.goimports,
    formatting.shfmt,
  },
  on_attach = function()
    local group = vim.api.nvim_create_augroup("NullLsLspFormatting", { clear = true })
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      group = group,
      callback = function()
        u.lsp_format()
      end,
    })
  end,
})

-- Other formats that work weird with null_ls
local group = vim.api.nvim_create_augroup("OtherLspFormatting", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.svelte" },
  group = group,
  callback = function()
    vim.lsp.buf.format()
  end,
})

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

local lsps_with_disabled_formatting = { "tsserver", "gopls", "jsonls", "html", "sumneko_lua" }

local on_attach = function(client, bufnr)
  if vim.tbl_contains(lsps_with_disabled_formatting, client.name) then
    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false
    client.server_capabilities.documentFormattingProvider = false
  end

  if client.name == "tailwindcss" then
    require("tailwindcss-colors").buf_attach(bufnr)
  end
end

local servers = lsp_installer.get_installed_servers()

require("neodev").setup({})

for _, server in ipairs(servers) do
  local opts = {
    capabilities = capabilities,
    on_attach = on_attach,
    root_dir = util.root_pattern(".git"),
  }

  if server == "emmet_ls" then
    opts.filetypes = { "html", "css", "scss", "javascripreact", "typescriptreact", "astro" }
  end

  if server == "jsonls" then
    opts.filetypes = { "json", "jsonc", "yaml" }
    opts.settings = {
      json = {
        format = {
          enable = false,
        },
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

  if server == "tsserver" then
    opts.settings = {
      tsserver = {
        experimental = {
          enableProjectDiagnostics = true,
        },
        javascript = {
          format = {
            enable = false,
          },
        },
        typescript = {
          format = {
            enable = false,
          },
        },
      },
    }
  end

  if server == "tailwindcss" then
    opts.root_dir = util.root_pattern("tailwind.config.js", ".git")
  end

  lspconfig[server].setup(opts)
end

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
