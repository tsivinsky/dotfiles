-- lua
vim.lsp.config.lua_ls = {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { ".luarc.json", ".git", vim.uv.cwd() },
  settings = {
    Lua = {
      format = {
        enable = false,
      },
      telemetry = {
        enable = false,
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
    },
  },
}
vim.lsp.enable("lua_ls")

-- json
vim.lsp.config.json_ls = {
  cmd = { "vscode-json-language-server", "--stdio" },
  filetypes = { "json", "jsonc" },
  root_markers = { vim.uv.cwd() },
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
      validate = {
        enable = true,
      },
    },
  },
}
vim.lsp.enable("json_ls")

-- bash
vim.lsp.config.bashls = {
  cmd = { "bash-language-server", "start" },
  filetypes = { "bash", "sh" },
  root_markers = { ".git", vim.uv.cwd() },
  settings = {
    bashIde = {
      globPattern = vim.env.GLOB_PATTERN or "*@(.sh|.inc|.bash|.command)",
    },
  },
}
vim.lsp.enable("bashls")

-- docker
vim.lsp.config.docker_ls = {
  cmd = { "docker-language-server", "start", "--stdio" },
  filetypes = { "dockerfile" },
  root_markers = { "Dockerfile", ".git", vim.uv.cwd() },
  init_options = {
    telemetry = "off",
  },
}
vim.lsp.enable("docker_ls")

-- c
vim.lsp.config.clangd = {
  cmd = { "clangd", "--clang-tidy" },
  filetypes = { "c" },
  root_markers = { "Makefile", "main.c" },
}
vim.lsp.enable("clangd")

-- yaml
vim.lsp.config.yaml = {
  cmd = { "yaml-language-server", "--stdio" },
  filetypes = { "yaml" },
}
vim.lsp.enable("yaml")
