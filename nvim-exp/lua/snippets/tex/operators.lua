local tex = require("snippets.tex.utils").conditions

return {
  s({ trig = "<<", snippetType = "autosnippet", name = "langle" },
    { t("\\langle") },
    { condition = tex.in_math }),

  s({ trig = ">>", snippetType = "autosnippet", name = "rangle" },
    { t("\\rangle") },
    { condition = tex.in_math }),

  s({ trig = "sr", wordTrig = false, snippetType = "autosnippet", name = "square" },
    { t("^2") },
    { condition = tex.in_math }),

  s({ trig = "cb", wordTrig = false, snippetType = "autosnippet", name = "cube" },
    { t("^3") },
    { condition = tex.in_math }),

  s({ trig = "invs", wordTrig = false, snippetType = "autosnippet", name = "Inverse" },
    { t("^{-1}") },
    { condition = tex.in_math }),

  s({ trig = "xx", snippetType = "autosnippet", name = "Vectorproduct" },
    { t("\\times") },
    { condition = tex.in_math }),

  s({ trig = "**", snippetType = "autosnippet", name = "Scalar product" },
    { t("\\cdot") },
    { condition = tex.in_math }),

  s({ trig = "Uu", snippetType = "autosnippet", name = "Union" },
    { t("\\cup") },
    { condition = tex.in_math }),

  s({ trig = "Nn", snippetType = "autosnippet", name = "Intersection" },
    { t("\\cap") },
    { condition = tex.in_math }),

  s({ trig = "Cc", snippetType = "autosnippet", name = "Subset" },
    { t("\\subset") },
    { condition = tex.in_math }),

  s({ trig = "==", snippetType = "autosnippet", name = "Equals in align" },
    { t("&=") },
    { condition = tex.in_math }),

  s({ trig = "!=", snippetType = "autosnippet", name = "Not equal to" },
    { t("\\neq") },
    { condition = tex.in_math }),

  s({ trig = "eqq", snippetType = "autosnippet", name = "Equivalent to" },
    { t("\\equiv") },
    { condition = tex.in_math }),

  s({ trig = "px", snippetType = "autosnippet", name = "Approximate to" },
    { t("\\approx") },
    { condition = tex.in_math }),

  s({ trig = "pt", snippetType = "autosnippet", name = "Proportional to" },
    { t("\\propto") },
    { condition = tex.in_math }),

  s({ trig = "::", wordTrig = false, snippetType = "autosnippet", name = "Colon" },
    { t("\\colon") },
    { condition = tex.in_math }),

  s({ trig = "<=", snippetType = "autosnippet", name = "Les than or equal to" },
    { t("\\leq") },
    { condition = tex.in_math }),

  s({ trig = ">=", snippetType = "autosnippet", name = "Greater than or equal to" },
    { t("\\geq") },
    { condition = tex.in_math }),

  s({ trig = "!>", snippetType = "autosnippet", name = "Maps to" },
    { t("\\mapsto") },
    { condition = tex.in_math }),

  s({ trig = "abs", snippetType = "autosnippet", name = "vert" },
    fmta([[\lvert <>\rvert<>]],
      { i(1), i(0) }),
    { condition = tex.in_math }),

  s({ trig = "nor", snippetType = "autosnippet", name = "Vert" },
    fmta([[\lVert <>\rVert<>]],
      { i(1), i(0) }),
    { condition = tex.in_math }),

  s({ trig = "sq", snippetType = "autosnippet", name = "square root" },
    fmta([[\sqrt{<>}<>]],
      { i(1), i(0) }),
    { condition = tex.in_math }),

  s({ trig = "//", snippetType = "autosnippet", name = "fraction" },
    fmta([[\frac{<>}{<>}<>]],
      { i(1), i(2), i(0) }),
    { condition = tex.in_math }),

  s({ trig = "td", wordTrig = false, snippetType = "autosnippet", name = "superscript" },
    fmta([[^{<>}<>]],
      { i(1), i(0) }),
    { condition = tex.in_math }),

  s({ trig = "lim", name = "Limit" },
    fmta([[\lim_{<> \to <>}]],
      { i(1, "n"), i(2, "\\infty") }),
    { condition = tex.in_math }),

  s({ trig = "limsup", name = "Limsup" },
    fmta([[\limsup_{<> \to <>}]],
      { i(1, "n"), i(2, "\\infty") }),
    { condition = tex.in_math }),

  s({ trig = "liminf", name = "Liminf" },
    fmta([[\liminf{<> \to <>}]],
      { i(1, "n"), i(2, "\\infty") }),
    { condition = tex.in_math }),

  s({ trig = "sum", name = "Sum" },
    fmta([[\sum_{<>}^{<>}]],
      { i(1, "i=1"), i(2, "\\infty") }),
    { condition = tex.in_math }),

  s({ trig = "prod", name = "Product" },
    fmta([[\prod{<>}^{<>}]],
      { i(1, "i=1"), i(2, "\\infty") }),
    { condition = tex.in_math }),

  s({ trig = "int", name = "Integral (defined)" },
    fmta([[\int{<>}^{<>} <>\,d<>]],
      { i(1, "a"), i(2, "b"), i(3), i(4, "x") }),
    { condition = tex.in_math }),

}
