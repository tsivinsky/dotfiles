local ts = require("telescope.builtin")
local mason = require("mason")
local lsp_installer = require("mason-lspconfig")
local lspconfig = require("lspconfig")
local null_ls = require("null-ls")
local util = lspconfig.util
local formatting = require("daniil.formatting")

local null_formatting = null_ls.builtins.formatting

mason.setup()
lsp_installer.setup()

null_ls.setup({
  sources = {
    null_formatting.prettierd.with({
      extra_filetypes = { "svelte" },
    }),
    null_formatting.stylua,
    null_formatting.gofmt,
    null_formatting.goimports,
    null_formatting.shfmt,
  },
  on_attach = function()
    local group = vim.api.nvim_create_augroup("NullLsLspFormatting", { clear = true })
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      group = group,
      callback = function()
        if not formatting.is_enabled() then
          return
        end

        vim.lsp.buf.format()
      end,
    })
  end,
})

local lsp_server_without_formatting = { "tsserver", "html", "css", "eslint", "jsonls", "svelte" }

local function on_attach(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  -- disable tsserver formatting here because i don't understand how lsp configuration works
  if vim.list_contains(lsp_server_without_formatting, client.name) then
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end

  vim.keymap.set("n", "gd", ts.lsp_definitions, opts)
  vim.keymap.set("n", "gr", ts.lsp_references, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>.", vim.lsp.buf.code_action, opts)

  if not vim.lsp.buf.range_code_action == nil then
    vim.keymap.set("v", "<leader>.", vim.lsp.buf.range_code_action, opts)
  end

  if client.name ~= "tsserver" and client.server_capabilities.inlayHintProvider then
    vim.lsp.inlay_hint.enable(bufnr, true)
  end
end

vim.keymap.set("n", "<leader>ee", function()
  vim.diagnostic.open_float(nil, { focus = false, scope = "line" })
end)
vim.keymap.set("n", "<leader>en", function()
  vim.diagnostic.goto_next({ float = false })
end)
vim.keymap.set("n", "<leader>eN", function()
  vim.diagnostic.goto_prev({ float = false })
end)

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

local servers = lsp_installer.get_installed_servers()
for _, server in ipairs(servers) do
  local opts = {
    capabilities = capabilities,
    on_attach = on_attach,
    root_dir = util.root_pattern(".git"),
  }

  if server == "emmet_ls" then
    opts.filetypes = { "html", "css", "scss", "javascripreact", "typescriptreact", "astro" }
  end

  if server == "gopls" then
    -- https://github.com/golang/tools/blob/master/gopls/doc/settings.md
    opts.settings = {
      gopls = {
        linksInHover = true,
      },
    }
  end

  if server == "tailwindcss" then
    opts.root_dir = util.root_pattern("tailwind.config.js", ".git")
  end

  if server == "jsonls" then
    opts.settings = {
      json = {
        schemas = require("schemastore").json.schemas(),
        validate = {
          enable = true,
        },
      },
    }
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
