-- typescript
vim.lsp.config.ts_ls = {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git", vim.uv.cwd() },

  init_options = {
    hostInfo = "neovim",
  },
}
vim.lsp.enable("ts_ls")

-- css
vim.lsp.config.cssls = {
  cmd = { "vscode-css-language-server", "--stdio" },
  filetypes = { "css", "scss" },
  root_markers = { "package.json", ".git", vim.uv.cwd() },
  init_options = {
    provideFormatter = false,
  },
}
vim.lsp.enable("cssls")

-- cssmodules
vim.lsp.config.cssmodules_ls = {
  cmd = { "cssmodules-language-server" },
  filetypes = {
    "css",
    "scss",
    "javascript",
    "javascript.jsx",
    "javascriptreact",
    "typescript",
    "typescript.tsx",
    "typescriptreact",
  },
  root_markers = { "package.json", ".git", vim.uv.cwd() },
  init_options = {
    camelCase = true,
  },
}
vim.lsp.enable("cssmodules_ls")

-- tailwindcss
vim.lsp.config.tailwindcssls = {
  cmd = { "tailwindcss-language-server", "--stdio" },
  filetypes = {
    "html",
    "css",
    "scss",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
  },
  root_markers = {
    "tailwind.config.js",
    "tailwind.config.cjs",
    "tailwind.config.mjs",
    "tailwind.config.ts",
    "postcss.config.js",
    "postcss.config.cjs",
    "postcss.config.mjs",
    "postcss.config.ts",
    "package.json",
    "node_modules",
  },
  settings = {
    tailwindCSS = {
      classAttributes = { "class", "className", "class:list", "classList" },
      includeLanguages = {
        templ = "html",
      },
      lint = {
        cssConflict = "warning",
        invalidApply = "error",
        invalidConfigPath = "error",
        invalidScreen = "error",
        invalidTailwindDirective = "error",
        invalidVariant = "error",
        recommendedVariantOrder = "warning",
      },
      validate = true,
    },
  },
}
vim.lsp.enable("tailwindcssls")

-- html
vim.lsp.config.htmlls = {
  cmd = { "vscode-html-language-server", "--stdio" },
  filetypes = { "html" },
  root_markers = { "package.json", ".git", vim.uv.cwd() },

  init_options = {
    configurationSection = { "html", "css", "javascript" },
    embeddedLanguages = {
      css = true,
      javascript = true,
    },
  },
}
vim.lsp.enable("htmlls")

-- emmet
vim.lsp.config.emmet_ls = {
  cmd = { "emmet-ls", "--stdio" },
  filetypes = {
    "html",
    "css",
    "scss",
    "javascript",
    "javascript.jsx",
    "javascriptreact",
    "typescript",
    "typescript.tsx",
    "typescriptreact",
  },
  root_markers = { "package.json", ".git", vim.uv.cwd() },
}
vim.lsp.enable("emmet_ls")
