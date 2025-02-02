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
}
