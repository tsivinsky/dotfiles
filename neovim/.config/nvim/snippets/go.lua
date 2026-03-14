---@diagnostic disable:undefined-global

return {
  s(
    { trig = "if err", snippetType = "autosnippet" },
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
