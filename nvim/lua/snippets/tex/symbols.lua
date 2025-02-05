local tex = require("snippets.tex.utils").conditions

return {
  s({ trig = "oo", snippetType = "autosnippet", name = "infinity" },
    { t("\\infty") },
    { condition = tex.in_math }),

  s({ trig = "NN", snippetType = "autosnippet", name = "Natuurlijke getallen" },
    { t("\\mathbb{N}") },
    { condition = tex.in_math }),

  s({ trig = "QQ", snippetType = "autosnippet", name = "Rationale Getallen" },
    { t("\\mathbb{Q}") },
    { condition = tex.in_math }),

  s({ trig = "II", snippetType = "autosnippet", name = "Eenheidsrelatie" },
    { t("\\mathbb{I}") },
    { condition = tex.in_math }),

  s({ trig = "ZZ", snippetType = "autosnippet", name = "Gehele getallen" },
    { t("\\mathbb{Z}") },
    { condition = tex.in_math }),

  s({ trig = "FF", snippetType = "autosnippet", name = "Field" },
    { t("\\mathbb{F}") },
    { condition = tex.in_math }),

  s({ trig = "CC", snippetType = "autosnippet", name = "Complexe getallen" },
    { t("\\mathbb{C}") },
    { condition = tex.in_math }),

  s({ trig = "OO", snippetType = "autosnippet", name = "Empty set" },
    { t("\\emptyset") },
    { condition = tex.in_math }),

  s({ trig = ";E", snippetType = "autosnippet", name = "Exists" },
    { t("\\exists") },
    { condition = tex.in_math }),

  s({ trig = ";A", snippetType = "autosnippet", name = "For all" },
    { t("\\forall") },
    { condition = tex.in_math }),

  s({ trig = "imp", snippetType = "autosnippet", name = "Implies" },
    { t("\\implies") },
    { condition = tex.in_math }),

  s({ trig = "pmi", snippetType = "autosnippet", name = "Implied by" },
    { t("\\impliedby") },
    { condition = tex.in_math }),

}
