---@diagnostic disable:undefined-global

return {
  s(
    { trig = "if" },
    fmta(
      [[
      if <> then
        <>
      fi
      ]],
      { i(1), i(2) }
    )
  ),
}
