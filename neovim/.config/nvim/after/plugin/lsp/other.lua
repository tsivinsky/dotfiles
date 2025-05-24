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
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          vim.fn.expand("~/.local/share/nvim/site/pack/packer/start"),
        },
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

-- docker compose
vim.lsp.config.compose_ls = {
  cmd = { "docker-compose-langserver", "--stdio" },
  filetypes = { "yaml" },
  root_markers = { "docker-compose.yml", vim.uv.cwd() },
}
vim.lsp.enable("compose_ls")

-- docker
vim.lsp.config.docker_ls = {
  cmd = { "docker-langserver", "--stdio" },
  filetypes = { "dockerfile" },
  root_markers = { "Dockerfile", ".git", vim.uv.cwd() },
}
vim.lsp.enable("docker_ls")
