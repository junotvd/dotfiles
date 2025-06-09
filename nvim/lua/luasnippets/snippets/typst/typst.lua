-- TODO: alles wat recursief is
--
-- local test = function(_, snip)
-- end

local generate_matrix = function(args, snip)
  local rows = tonumber(snip.captures[2])
  local cols = tonumber(snip.captures[3])
  local nodes = {}
  local ins_indx = 1
  for j = 1, rows do
    table.insert(nodes, r(ins_indx, tostring(j) .. 'x1', i(1)))
    ins_indx = ins_indx + 1
    for k = 2, cols do
      table.insert(nodes, t(' , '))
      table.insert(nodes, r(ins_indx, tostring(j) .. 'x' .. tostring(k), i(1)))
      ins_indx = ins_indx + 1
    end
    table.insert(nodes, t({ ';', '' }))
  end
  -- fix last node.
  nodes[#nodes] = t(';')
  return sn(nil, nodes)
end

local postfix_snippet = require('luasnippets.snippets.typst.utils.scaffolding').postfix_snippet
local typst = require('luasnippets.snippets.typst.utils').conditions
local line_begin = require('luasnip.extras.conditions.expand').line_begin
local get_visual = require('luasnippets.helper-funcs').get_visual
local ls = require('luasnip')
local as = ls.extend_decorator.apply(s, { snippetType = 'autosnippet' })
local asm = ls.extend_decorator.apply(s, { snippetType = 'autosnippet', condition = typst.in_mathzone })

local M = {
  --------------
  --[[ Math ]]
  --------------

  as({ trig = 'mk', name = 'inline math' }, fmta('$<>$<>', { d(1, get_visual), i(0) })),
  as({ trig = 'dmk', name = 'display math inline' }, fmta('$display(<>)$<>', { d(1, get_visual), i(0) })),
  as(
    { trig = 'md', name = 'display math', wordTrig = false, regTrig = false },
    fmta(
      [[
$
  <>
$<>]],
      {
        d(1, get_visual),
        i(0),
      }
    ),
    { condition = line_begin }
  ),

  -- sub/super
  asm({ trig = 'sr', name = 'squared', wordTrig = false }, { t('^2') }),
  asm({ trig = 'cb', name = 'cubed', wordTrig = false }, { t('^3') }),
  asm({ trig = 'inv', name = 'inverse', wordTrig = false }, t('^(-1)')),
  asm({ trig = 'td', name = 'tot de ...', wordTrig = false }, fmta('^(<>)<>', { i(1), i(0) })),
  -- TODO: originele subscripts zoals bij tex
  asm(
    {
      trig = '([%a]+)(%d)',
      wordTrig = false,
      regTrig = true,
      name = 'Auto-subscript 1D',
      dscr = 'Auto-subscript with 1 digit',
    },
    fmta('<>_<>', {
      f(function(_, snip)
        return snip.captures[1]
      end),
      f(function(_, snip)
        return snip.captures[2]
      end),
    })
  ),
  asm(
    {
      trig = '(%w)_(%d%d)',
      wordTrig = false,
      regTrig = true,
      name = 'Auto-subscript 2D',
      dscr = 'Auto-subscript for 2 digits',
    },
    fmta([[<>_(<>)]], {
      f(function(_, snip)
        return snip.captures[1]
      end),
      f(function(_, snip)
        return snip.captures[2]
      end),
    })
  ),
  asm(
    {
      trig = 'jj',
      desc = 'Subscript',
      wordTrig = false,
    },
    fmta('_(<>)<>', {
      i(1),
      i(0),
    })
  ),
  asm(
    {
      trig = 'jt',
      desc = 'Subscript',
      wordTrig = false,
    },
    fmta('_("<>")<>', {
      i(1),
      i(0),
    })
  ),
  asm({ trig = 'bnd', name = 'boundaries', wordTrig = false }, fmta('_(<>)^(<>)<>', { i(1), i(2), i(0) })),

  -------------------
  --[[ Functions ]]
  -------------------

  asm(
    {
      trig = '//',
      name = 'fraction',
      dscr = 'fraction | visual up',
      wordTrig = false,
    },
    fmta('frac(<>, <>)<>', {
      d(1, get_visual),
      i(2),
      i(0),
    })
  ),
  asm(
    {
      trig = '\\\\',
      name = 'fraction',
      dscr = 'fractian | visual down',
    },
    fmta('frac(<>, <>)<>', {
      i(2),
      d(1, get_visual),
      i(0),
    })
  ),

  asm(
    { trig = 'cases', wordTrig = false },
    fmta(
      [[cases(
    <>
    )<>]],
      { i(1), i(0) }
    )
  ),
  -- TODO
  asm(
    { trig = 'attach', wordTrig = false },
    fmta(
      [[attach(
    <>, t: , b: ,
    tl: , tr: , bl: , br: ,
    )<>]],
      { d(1, get_visual), i(0) }
    )
  ),

  asm(
    { trig = 'limt' },
    fmt('lim_({} --> {}){}{}', {
      i(1, 'x'),
      i(2, 'infinity'),
      d(3, get_visual),
      i(0),
    })
  ),
  asm(
    { trig = 'lims' },
    fmta('limits(<>)_(<>)<>', {
      d(1, get_visual),
      i(2),
      i(0),
    })
  ),

  -- TODO
  asm({ trig = 'ubre' }, fmta('underbrace(<>)<>', { d(1, get_visual), i(0) })),
  asm({ trig = 'obre' }, fmta('overbrace(<>)<>', { d(1, get_visual), i(0) })),
  asm({ trig = 'ubrk' }, fmta('underbracket(<>)<>', { d(1, get_visual), i(0) })),
  asm({ trig = 'obrk' }, fmta('overbracket(<>)<>', { d(1, get_visual), i(0) })),
  asm({ trig = 'upar' }, fmta('underparen(<>)<>', { d(1, get_visual), i(0) })),
  asm({ trig = 'opar' }, fmta('overparen(<>)<>', { d(1, get_visual), i(0) })),
  asm({ trig = 'ushe' }, fmta('undershell(<>)<>', { d(1, get_visual), i(0) })),
  asm({ trig = 'oshe' }, fmta('overshell(<>)<>', { d(1, get_visual), i(0) })),

  asm({ trig = 'stretch' }, fmta('stretch(<>)^"<>"<>', { d(1, get_visual), i(2), i(0) })),
  asm({ trig = 'cnl' }, fmta('cancel(<>)<>', { d(1, get_visual), i(0) })),
  asm({ trig = 'abs' }, fmta('abs(<>)<>', { d(1, get_visual), i(0) })),
  asm({ trig = 'norm' }, fmta('norm(<>)<>', { d(1, get_visual), i(0) })),
  asm({ trig = 'sqrt', name = 'square root' }, fmta('sqrt(<>)<>', { d(1, get_visual), i(0) })),

  -- TODO
  s(
    { trig = 'eq', name = 'numbered equation' },
    fmta(
      [[#math.equation(block: true, numbering: (1),
    $
    <>
    $
    )<>]],
      { i(1), i(0) }
    ),
    { condition = typst.in_textzone }
  ),

  --------------
  --[[ Text ]]
  --------------

  asm(
    { trig = 'tii', name = 'italic', dscr = 'italic text', wordTrig = false },
    fmta([[italic(<>)<>]], {
      d(1, get_visual),
      i(0),
    })
  ),
  asm(
    { trig = 'bld', name = 'bold', dscr = 'bold text', wordTrig = false },
    fmta([[bold(<>)<>]], {
      d(1, get_visual),
      i(0),
    })
  ),
  asm(
    {
      trig = 'pdv',
      name = 'partial differential equation',
      dscr = 'pdv from the physica package (required)',
      wordTrig = false,
    },
    fmta([[pdv(<>)<>]], {
      d(1, get_visual),
      i(0),
    })
  ),

  -----------------
  --[[ Symbols ]]
  -----------------

  asm({ trig = 'iff', name = 'if and only if' }, t('<==>')),
  asm({ trig = 'imp', name = 'implies' }, t('==>')),
  asm({ trig = 'pmi', name = 'implied by' }, t('<==')),
  asm({ trig = 'xx' }, t('times')),
  asm({ trig = 'odot' }, t('dot.circle')),
  asm({ trig = 'Odot' }, t('dot.circle.big')),
  asm({ trig = 'oplus' }, t('plus.circle.big')),
  asm(
    { trig = '([hvdu])dot', regTrig = true, name = 'dots' },
    fmta('<><>', {
      f(function(_, snip)
        local map = { h = 'h.c', v = 'v', d = 'down', u = 'up' }
        return 'dots.' .. map[snip.captures[1]]
      end),
      i(0),
    })
  ),
  asm({ trig = 'px' }, t('approx')),
  asm({ trig = 'pm' }, t('plus.minus')),
  asm({ trig = 'mp' }, t('minus.plus')),
  asm({ trig = 'exi' }, t('exists')),
  asm({ trig = 'exin' }, t('exists.not')),
  asm({ trig = 'fal' }, t('forall')),
  asm({ trig = 'Inter' }, t('inter.big')),
  asm({ trig = 'Union' }, t('union.big')),
  asm({ trig = 'bset' }, t('subset')),
  asm({ trig = 'pset' }, t('supset')),
  asm({ trig = 'OO' }, t('emptyset')),
  asm({ trig = 'iint' }, t('integral')),
  asm({ trig = 'dint' }, t('integral.double')),
  asm({ trig = 'tint' }, t('integral.triple')),
  asm({ trig = 'qint' }, t('integral.quad')),
  asm({ trig = 'oint' }, t('integral.cont')),
  asm({ trig = 'sint' }, t('integral.surf')),
  asm({ trig = 'vint' }, t('integral.vol')),
  -- asm(
  --   { trig = '([idtosv])int', name = 'integrals', regTrig = true },
  --   fmta('<><>', {
  --     f(function(_, snip)
  --       local map = {
  --         i = '',
  --         d = '.double',
  --         t = '.triple',
  --         o = '.cont',
  --         s = '.surf',
  --         v = '.vol',
  --       }
  --       return 'integral' .. map[snip.captures[1]]
  --     end),
  --     i(0),
  --   })
  -- ),
  asm({ trig = 'spq' }, t('space.quad')),
  asm({ trig = 'spe' }, t('space.en')),
  asm({ trig = 'spt' }, t('space.thin')),
  asm({ trig = 'sph' }, t('space.hair')),
  asm({ trig = 'sp3' }, t('space.third')),
  asm({ trig = 'sp4' }, t('space.quarter')),
  asm({ trig = 'sp6' }, t('space.sixth')),
  asm({ trig = 'oo', wordTrig = false }, t('infinity')),

  -- Greek
  as({ trig = ';a', wordTrig = false }, {
    t('alpha'),
  }),
  as({ trig = ';b', wordTrig = false }, {
    t('beta'),
  }),
  as({ trig = ';g', wordTrig = false }, {
    t('gamma'),
  }),
  as({ trig = ';G', wordTrig = false }, {
    t('Gamma'),
  }),
  as({ trig = ';d', wordTrig = false }, {
    t('delta'),
  }),
  as({ trig = ';D', wordTrig = false }, {
    t('Delta'),
  }),
  as({ trig = ';e', wordTrig = false }, {
    t('epsilon'),
  }),
  as({ trig = ';ve', wordTrig = false }, {
    t('epsilon.alt'),
  }),
  as({ trig = ';z', wordTrig = false }, {
    t('zeta'),
  }),
  as({ trig = ';h', wordTrig = false }, {
    t('eta'),
  }),
  as({ trig = ';o', wordTrig = false }, {
    t('theta'),
  }),
  as({ trig = ';vo', wordTrig = false }, {
    t('theta.alt'),
  }),
  as({ trig = ';O', wordTrig = false }, {
    t('Theta'),
  }),
  as({ trig = ';k', wordTrig = false }, {
    t('kappa'),
  }),
  as({ trig = ';l', wordTrig = false }, {
    t('lambda'),
  }),
  as({ trig = ';L', wordTrig = false }, {
    t('Lambda'),
  }),
  as({ trig = ';m', wordTrig = false }, {
    t('mu'),
  }),
  as({ trig = ';n', wordTrig = false }, {
    t('nu'),
  }),
  as({ trig = ';x', wordTrig = false }, {
    t('xi'),
  }),
  as({ trig = ';X', wordTrig = false }, {
    t('Xi'),
  }),
  as({ trig = ';i', wordTrig = false }, {
    t('pi'),
  }),
  as({ trig = ';I', wordTrig = false }, {
    t('Pi'),
  }),
  as({ trig = ';r', wordTrig = false }, {
    t('rho'),
  }),
  as({ trig = ';s', wordTrig = false }, {
    t('sigma'),
  }),
  as({ trig = ';S', wordTrig = false }, {
    t('Sigma'),
  }),
  as({ trig = ';t', wordTrig = false }, {
    t('tau'),
  }),
  as({ trig = ';f', wordTrig = false }, {
    t('phi'),
  }),
  as({ trig = ';vf', wordTrig = false }, {
    t('phi.alt'),
  }),
  as({ trig = ';F', wordTrig = false }, {
    t('Phi'),
  }),
  as({ trig = ';c', wordTrig = false }, {
    t('chi'),
  }),
  as({ trig = ';p', wordTrig = false }, {
    t('psi'),
  }),
  as({ trig = ';P', wordTrig = false }, {
    t('Psi'),
  }),
  as({ trig = ';w', wordTrig = false }, {
    t('omega'),
  }),
  as({ trig = ';W', wordTrig = false }, {
    t('Omega'),
  }),
}

----------------
--[[ Postfix ]]
----------------

-- local postfix_text = {}
--
-- local postfix_text_snippets = {}
-- for i, j in pairs(postfix_text) do
--   table.insert(
--     postfix_text_snippets,
--     postfix_snippet(vim.tbl_deep_extend('keep', { trig = i, snippetType = 'autosnippet' }, j.context), j.command, { condition = in_mathzone })
--   )
-- end
-- vim.list_extend(M, postfix_text_snippets)

local postfix_math = {
  ['.,'] = {
    context = {
      name = 'arrow',
      dscr = 'arrow',
    },
    command = {
      pre = 'arrow(',
      post = ')',
    },
  },

  [',.'] = {
    context = {
      name = 'arrow',
      dscr = 'arrow',
    },
    command = {
      pre = 'arrow(',
      post = ')',
    },
  },

  bar = {
    context = {
      name = 'bar',
      dscr = 'overline',
    },
    command = {
      pre = 'overline(',
      post = ')',
    },
  },

  hat = {
    context = {
      name = 'hat',
      dscr = 'hat',
    },
    command = {
      pre = 'hat(',
      post = ')',
    },
  },

  -- ['~'] = {
  --   context = {
  --     name = 'tilde',
  --     dscr = 'tilde',
  --   },
  --   command = {
  --     pre = 'tilde(',
  --     post = ')',
  --   },
  -- },

  cal = {
    context = {
      name = 'cal',
      dscr = 'calligraphic',
    },
    command = {
      pre = 'cal(',
      post = ')',
    },
  },

  bb = {
    context = {
      name = 'blackboard',
      dscr = 'blackboard font',
    },
    command = {
      pre = 'bb(',
      post = ')',
    },
  },

  san = {
    context = {
      name = 'sans',
      dscr = 'sans font',
    },
    command = {
      pre = 'sans(',
      post = ')',
    },
  },

  frak = {
    context = {
      name = 'frak',
      dscr = 'fraktur font',
    },
    command = {
      pre = 'frak(',
      post = ')',
    },
  },
}

local postfix_math_snippets = {}
for i, j in pairs(postfix_math) do
  table.insert(
    postfix_math_snippets,
    postfix_snippet(
      vim.tbl_deep_extend('keep', { trig = i, snippetType = 'autosnippet' }, j.context),
      j.command,
      { condition = typst.in_mathzone }
    )
  )
end
vim.list_extend(M, postfix_math_snippets)

return M
