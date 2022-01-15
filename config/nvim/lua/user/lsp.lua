local lsp_installer = require("nvim-lsp-installer")
local cmp = require("cmp")
local null_ls = require("null-ls")
local list_includes_item = require("user.utils").list_includes_item

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

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = {
		["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
		["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
		["<C-space>"] = cmp.mapping(function(fallback)
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

local lsps_with_disabled_formatting = { "tsserver", "gopls" }

local on_attach = function(client)
	if list_includes_item(lsps_with_disabled_formatting, client.name) then
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false
	end
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
				},
				telemetry = {
					enable = false,
				},
			},
		}
	end

	server:setup(opts)
end)

-- Don't show diagnostics as virtual text
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	update_in_insert = true,
	virtual_text = false,
})

require("luasnip.loaders.from_vscode").load()
