---@diagnostic disable:undefined-global

return {
  s(
    { trig = "iferr", snippetType = "autosnippet" },
    fmta(
      [[
    if err != nil {
        return <>
    }
    ]],
      { i(0) }
    )
  ),
}
