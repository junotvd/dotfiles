local ls = require('luasnip')
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local rep = require('luasnip.extras').rep

return {
  -- Math stuff
  s({ trig = 'mk', snippetType = 'autosnippet' }, fmta('$<>$ ', { i(1) })),
  s({ trig = 't' }, fmta('^(<>) ', { i(1) })),

  s({ trig = 'rt', snippetType = 'autosnippet' }, fmta('^(<>) ', { i(1) })),

  s({ trig = 'md', snippetType = 'autosnippet' }, fmta('$ <> $ ', { i(1) })),

  s({ trig = 'iff', snippetType = 'autosnippet' }, fmt('<==>', {})),
  s({ trig = 'impl' }, fmt('==>', {})),
}
