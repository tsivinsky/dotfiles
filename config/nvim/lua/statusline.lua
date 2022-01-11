local function line_and_column()
    local line, column = unpack(vim.api.nvim_win_get_cursor(0))

    return "Ln " .. line .. ", Col " .. column
end

require("lualine").setup({
    options = {
        component_separators = {left = "", right = ""},
        section_separators = {left = "", right = ""},
        disabled_filetypes = {"NvimTree"}
    },
    sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {"branch", "diff", "filename"},
        lualine_x = {line_and_column, "encoding"},
        lualine_y = {},
        lualine_z = {}
    }
})
