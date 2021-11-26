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
        expand = function(args) require("luasnip").lsp_expand(args.body) end
    },
    mapping = {
        ["<C-j>"] = cmp.mapping.select_next_item({
            behavior = cmp.SelectBehavior.Select
        }),
        ["<C-k>"] = cmp.mapping.select_prev_item({
            behavior = cmp.SelectBehavior.Select
        }),
        ["<C-space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.SelectBehavior.Insert
        }),
        ["<TAB>"] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.SelectBehavior.Insert
        })
    },
    sources = cmp.config.sources({
        {name = "nvim_lsp", trigger_characters = {"."}}, {name = "luasnip"},
        {name = "nvim_lua"}
    }, {{name = "path"}, {name = "buffer"}}),
    completion = {completeopt = "menu,menuone,noselect,noinsert,preview"},
    experimental = {ghost_text = true},
    sorting = {
        comparators = {
            cmp.config.compare.exact, cmp.config.compare.score,
            cmp.config.compare.recently_used, cmp.config.compare.kind,
            cmp.config.compare.offset
        }
    },
    documentation = {
        border = {"╭", "─", "╮", "│", "╯", "─", "╰", "│"},
        zindex = 999
    },
    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind],
                                          vim_item.kind)
            vim_item.menu = ({
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                luasnip = "[Snippet]",
                nvim_lua = "[Lua]",
                path = "[File]"
            })[entry.source.name]
            return vim_item
        end
    }
})

cmp.setup.cmdline("/", {sources = {{name = "buffer"}}})

cmp.setup.cmdline(":", {sources = {{name = "path"}, {name = "cmdline"}}})

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp
                                                                     .protocol
                                                                     .make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

lsp_installer.on_server_ready(function(server)
    local opts = {}

    if server.name == "sumneko_lua" then
        local runtime_path = vim.split(package.path, ';')
        table.insert(runtime_path, "lua/?.lua")
        table.insert(runtime_path, "lua/?/init.lua")

        opts.settings = {
            Lua = {
                runtime = {version = "LuaJIT", path = runtime_path},
                diagnostics = {globals = {"vim"}},
                workspace = {library = vim.api.nvim_get_runtime_file("", true)},
                telemetry = {enable = false}
            }
        }
    end

    server:setup(opts)
end)

require("luasnip/loaders/from_vscode").lazy_load()
