local tex = require('luasnippets.snippets.tex.utils').conditions

return {
  s({ trig = 'oo', snippetType = 'autosnippet', name = 'Infinity' }, { t('\\infty') }, { condition = tex.in_math }),

  s(
    { trig = 'NN', snippetType = 'autosnippet', name = 'Natural numbers' },
    { t('\\mathbb{N}') },
    { condition = tex.in_math }
  ),

  s(
    { trig = 'QQ', snippetType = 'autosnippet', name = 'Rational numbers' },
    { t('\\mathbb{Q}') },
    { condition = tex.in_math }
  ),

  s(
    { trig = 'II', snippetType = 'autosnippet', name = 'Eenheidsrelatie' },
    { t('\\mathbb{I}') },
    { condition = tex.in_math }
  ),

  s(
    { trig = 'RR', snippetType = 'autosnippet', name = 'Real numbers' },
    { t('\\mathbb{R}') },
    { condition = tex.in_math }
  ),

  s({ trig = 'ZZ', snippetType = 'autosnippet', name = 'Integers' }, { t('\\mathbb{Z}') }, { condition = tex.in_math }),

  s({ trig = 'FF', snippetType = 'autosnippet', name = 'Field' }, { t('\\mathbb{F}') }, { condition = tex.in_math }),

  s(
    { trig = 'CC', snippetType = 'autosnippet', name = 'Complex numbers' },
    { t('\\mathbb{C}') },
    { condition = tex.in_math }
  ),

  s({ trig = 'OO', snippetType = 'autosnippet', name = 'Empty set' }, { t('\\emptyset') }, { condition = tex.in_math }),

  s({ trig = ';E', snippetType = 'autosnippet', name = 'Exists' }, { t('\\exists') }, { condition = tex.in_math }),

  s({ trig = ';A', snippetType = 'autosnippet', name = 'For all' }, { t('\\forall') }, { condition = tex.in_math }),

  s({ trig = 'imp', snippetType = 'autosnippet', name = 'Implies' }, { t('\\implies') }, { condition = tex.in_math }),

  s(
    { trig = 'pmi', snippetType = 'autosnippet', name = 'Implied by' },
    { t('\\impliedby') },
    { condition = tex.in_math }
  ),

  s({ trig = '[', snippetType = 'autosnippet', name = 'Left bracket' }, { t('\\lbrack') }, { condition = tex.in_math }),

  s(
    { trig = ']', snippetType = 'autosnippet', name = 'Right bracket' },
    { t('\\rbrack') },
    { condition = tex.in_math }
  ),

  s(
    { trig = 'cdd', snippetType = 'autosnippet', name = 'Centered dots' },
    { t('\\cdots') },
    { condition = tex.in_math }
  ),

  s({ trig = 'ldd', snippetType = 'autosnippet', name = 'Lower dots' }, { t('\\ldots') }),

  s(
    { trig = 'vdd', snippetType = 'autosnippet', name = 'Vertical dots' },
    { t('\\vdots') },
    { condition = tex.in_math }
  ),

  s(
    { trig = 'ddd', snippetType = 'autosnippet', name = 'Diagonal dots' },
    { t('\\ddots') },
    { condition = tex.in_math }
  ),

  s(
    { trig = '||', snippetType = 'autosnippet', name = 'Parallel sign' },
    { t('\\parallel') },
    { condition = tex.in_math }
  ),
}
