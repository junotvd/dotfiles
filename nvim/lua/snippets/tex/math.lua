local tex = {}
tex.in_mathzone = function() return vim.fn['vimtex#syntax#in_mathzone']() == 1 end
tex.in_text = function() return not tex.in_mathzone() end

return {
  s({ trig = "([%w%)%]%}]);", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      "<>_{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        d(1, get_visual),
      }
    ),
    { condition = tex.in_mathzone }
  ),

  s({ trig = '(%a)(%d)', snippetType = 'autosnippet', regTrig = true, name = 'auto subscript', dscr = 'hi' },
    fmt([[<>_<>]],
      { f(function(_, snip) return snip.captures[1] end),
        f(function(_, snip) return snip.captures[2] end) },
      { delimiters = '<>' }),
    { condition = math }),

  s({ trig = '(%a)_(%d%d)', snippetType = 'autosnippet', regTrig = true, name = 'auto subscript 2', dscr = 'auto subscript for 2+ digits' },
    fmt([[<>_{<>}]],
      { f(function(_, snip) return snip.captures[1] end),
        f(function(_, snip) return snip.captures[2] end) },
      { delimiters = '<>' }),
    { condition = tex.in_mathzone }),
}
