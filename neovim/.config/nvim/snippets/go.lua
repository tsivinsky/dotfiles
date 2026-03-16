---@diagnostic disable:undefined-global

return {
  s(
    { trig = "if err" },
    fmta(
      [[
    if err != nil {
        return <>
    }
    ]],
      { i(0) }
    ),
    {
      condition = function(line_to_cursor)
        return #line_to_cursor == vim.api.nvim_get_current_line():len()
      end,
    }
  ),
}
