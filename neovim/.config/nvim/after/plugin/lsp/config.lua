local ts = require("telescope.builtin")
local null_ls = require("null-ls")
local formatting = require("daniil.formatting")

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.lsp.config("*", {
  capabilities = capabilities,
})

local servers_with_annoying_formatters = { "ts_ls" }
local null_formatting = null_ls.builtins.formatting
null_ls.setup({
  sources = {
    null_formatting.prettierd.with({
      extra_filetypes = { "svelte" },
    }),
    null_formatting.stylua,
    null_formatting.gofmt,
    null_formatting.goimports,
    null_formatting.shfmt,
    require("none-ls.diagnostics.eslint"),
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

        vim.lsp.buf.format({
          filter = function(client)
            return not vim.tbl_contains(servers_with_annoying_formatters, client.name)
          end,
        })
      end,
    })
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if not client then
      return
    end

    local opts = { silent = true }

    vim.keymap.set("n", "gd", ts.lsp_definitions, opts)
    vim.keymap.set("n", "gr", ts.lsp_references, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>.", vim.lsp.buf.code_action, opts)
    vim.keymap.set("i", "<C-e>", vim.lsp.buf.signature_help, opts)

    if not vim.lsp.buf.range_code_action == nil then
      vim.keymap.set("v", "<leader>.", vim.lsp.buf.range_code_action, opts)
    end
  end,
})

vim.diagnostic.config({
  update_in_insert = false,
  virtual_text = {
    severity = { vim.diagnostic.severity.ERROR },
  },
})

vim.keymap.set("n", "<leader>ee", function()
  vim.diagnostic.open_float(nil, { focus = false, scope = "line" })
end)
vim.keymap.set("n", "<leader>en", function()
  vim.diagnostic.goto_next({ float = false })
end)
vim.keymap.set("n", "<leader>eN", function()
  vim.diagnostic.goto_prev({ float = false })
end)
