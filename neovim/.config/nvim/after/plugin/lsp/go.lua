local filetypes = { "go", "gotempl", "gowork", "gomod" }
local root_markers = { ".git", "go.mod", "go.work", vim.uv.cwd() }

vim.lsp.config.gopls = {
  cmd = { "gopls" },
  filetypes = filetypes,
  root_markers = root_markers,
  settings = {
    gopls = {
      linksInHover = true,
      usePlaceholders = false, -- just to ensure it's off, incase in the future go team decides to toggle it on by default
      completeUnimported = true,
      analyses = {
        unusedparams = true,
      },
      ["ui.inlayhint.hints"] = {
        compositeLiteralFields = true,
        constantValues = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
    },
  },
}
vim.lsp.enable("gopls")

vim.lsp.config.golangci_lint_ls = {
  cmd = { "golangci-lint-langserver" },
  filetypes = filetypes,
  root_markers = root_markers,
}
