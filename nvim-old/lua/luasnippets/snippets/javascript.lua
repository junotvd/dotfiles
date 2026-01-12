return {
  s({ trig = 'dei', snippetType = 'snippet' }, fmt('document.getElementById("{}")', { i(1) })),
  s({ trig = 'cre', snippetType = 'snippet' }, fmt('document.createElement("{}")', { i(1) })),
  s(
    { trig = 'func', snippetType = 'snippet' },
    fmta(
      [[
  function <>(<>) {
    <>
  }
    ]],
      { i(1), i(2), i(3) }
    )
  ),
  s(
    { trig = 'if', snippetType = 'snippet' },
    fmta(
      [[
  if (<>) {
    <>
  }
  ]],
      { i(1), i(2) }
    )
  ),
}
