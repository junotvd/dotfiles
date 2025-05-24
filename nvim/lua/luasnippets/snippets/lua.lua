local ls = require('luasnip')
local as = ls.extend_decorator.apply(s, { snippetType = 'autosnippet' })

return {
  s(
    'snipf',
    fmta(
      [[ 
    <>({ trig='<>', name='<>', dscr='<>'},
    fmta(<>,
    { <> }
    )<>)<>,]],
      {
        c(1, { t('s'), t('as') }),
        i(2, 'trig'),
        i(3, 'trig'),
        i(4, 'dscr'),
        i(5, 'fmt'),
        i(6, 'inputs'),
        i(7, 'opts'),
        i(0),
      }
    )
  ),
  s(
    'snipt',
    fmta(
      [[ 
    <>(<>, {t('<>')}<>
    <>)<>,]],
      {
        c(1, { t('s'), t('as') }),
        c(2, { i(nil, 'trig'), sn(nil, { t("{trig='"), i(1), t("'}") }) }),
        i(3, 'text'),
        i(4, 'opts'),
        i(5),
        i(0),
      }
    )
  ),
}
