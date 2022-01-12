local function prettierd()
    return {
        exe = "prettierd",
        args = {vim.api.nvim_buf_get_name(0)},
        stdin = true
    }
end

local function luaformat()
    return {
        exe = "lua-format",
        args = {vim.api.nvim_buf_get_name(0)},
        stdin = true
    }
end

local function gofmt()
    return {exe = "gofmt", args = {vim.api.nvim_buf_get_name(0)}, stdin = true}
end

local function goimports()
    return {
        exe = "goimports",
        args = {vim.api.nvim_buf_get_name(0)},
        stdin = true
    }
end

require("formatter").setup({
    filetype = {
        javascript = {prettierd},
        javascriptreact = {prettierd},
        typescript = {prettierd},
        typescriptreact = {prettierd},
        html = {prettierd},
        css = {prettierd},
        scss = {prettierd},
        json = {prettierd},
        svelte = {prettierd},
        lua = {luaformat},
        go = {gofmt, goimports}
    }
})

vim.cmd(
    [[autocmd BufWritePost *.js,*.jsx,*.ts,*.tsx,*.html,*.css,*.scss,*.json,*.svelte,*.lua,*.go FormatWrite]])