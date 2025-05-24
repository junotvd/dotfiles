local postfix_snippet = require('luasnips.utils.scaffolding').postfix_snippet

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

local line_begin = require('luasnip.extras.expand_conditions').line_begin
local as = ls.extend_decorator.apply(s, { snippetType = 'autosnippet' })

local get_visual = function(args, parent)
  if #parent.snippet.env.LS_SELECT_RAW > 0 then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else -- If LS_SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end

local line_begin = require('luasnip.extras.expand_conditions').line_begin
-- NOTE: Not in use local line_end = require("luasnip.extras.expand_conditions").line_end
local cond_obj = require('luasnip.extras.conditions')

-----------------------
-- PRESET CONDITIONS --
-----------------------
--- The wordTrig flag will only expand the snippet if
--- the proceeding character is NOT %w or `_`.
--- This is quite useful. The only issue is that the characters
--- on which we negate on hard coded. See here for the actual implementation
--- https://github.com/L3MON4D3/LuaSnip/blob/c9b9a22904c97d0eb69ccb9bab76037838326817/lua/luasnip/nodes/snippet.lua#L827
---
---
--- @param pattern string valid lua pattern
local function make_trigger_does_not_follow_char(pattern)
  local condition = function(line_to_cursor, matched_trigger)
    local line_to_trigger_len = #line_to_cursor - #matched_trigger
    if line_to_trigger_len == 0 then
      return true
    end
    return not string.sub(line_to_cursor, line_to_trigger_len, line_to_trigger_len):match(pattern)
  end
  return cond_obj.make_condition(condition)
end

local trigger_does_not_follow_alpha_num_char = make_trigger_does_not_follow_char('%w')
local trigger_does_not_follow_alpha_char = make_trigger_does_not_follow_char('%a')

local MATH_NODES = {
  math = true,
  formula = true,
}
local TEXT_NODES = {
  text = true,
  content = true,
}
local CODE_NODES = {
  code = true,
}

local in_textzone = cond_obj.make_condition(function(check_parent)
  local node = vim.treesitter.get_node({ ignore_injections = false })
  while node do
    if node:type() == 'text' then
      if check_parent then
        -- For \text{}
        local parent = node:parent()
        if parent and MATH_NODES[parent:type()] then
          return false
        end
      end

      return true
    elseif MATH_NODES[node:type()] then
      return false
    end
    node = node:parent()
  end
  return true
end)

local in_codezone = cond_obj.make_condition(function()
  local node = vim.treesitter.get_node({ ignore_injections = false })
  while node do
    if CODE_NODES[node:type()] then
      return true
    elseif TEXT_NODES[node:type()] or MATH_NODES[node:type()] then
      return false
    end
    node = node:parent()
  end
  return false
end)

local in_mathzone = cond_obj.make_condition(function()
  local node = vim.treesitter.get_node({ ignore_injections = false })
  while node do
    if MATH_NODES[node:type()] then
      return true
    elseif TEXT_NODES[node:type()] or CODE_NODES[node:type()] then
      return false
    end
    node = node:parent()
  end
  return false
end)

local iv = function(i, ...)
  return d(i, get_visual, ...)
end

local asm = ls.extend_decorator.apply(s, { snippetType = 'autosnippet', condition = in_mathzone })

local M = {
  --------------
  --[[ Math ]]
  --------------

  as({ trig = 'mk', name = 'inline math' }, fmta('$<>$<>', { i(1), i(0) })),
  as({ trig = 'dmk', name = 'display math inline' }, fmta('$display(<>)$<>', { i(1), i(0) })),
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
  asm({ trig = 'td', name = 'tot de ...', wordTrig = false }, fmta('^(<>)<>', { i(1), i(0) })),
  asm({ trig = 'inv', name = 'inverse', wordTrig = false }, t('^(-1)')),
  -- TODO: originele subscripts zoals bij tex
  asm(
    {
      trig = '([%w%)%]%}|])jj',
      desc = 'Subscript(no ambiguity)',
      wordTrig = false,
      regTrig = true,
    },
    fmta('<>_(<>)', {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
    })
  ),
  asm({ trig = 'bnd', name = 'boundaries', wordTrig = false }, fmta('_(<>)^(<>)<>', { i(1), i(2), i(0) })),

  -------------------
  --[[ Functions ]]
  -------------------

  asm({ trig = '//', name = 'fraction', wordTrig = false }, fmta('frac(<>, <>)<>', { i(1), i(2), i(0) })),

  asm(
    { trig = 'cases', wordTrig = false },
    fmta(
      [[cases(
    <>
    )<>]],
      { i(1), i(0) }
    )
  ),
  asm(
    { trig = 'attach', wordTrig = false },
    fmta(
      [[attach(
    <>, t: , b: ,
    tl: , tr: , bl: , br: ,
    )<>]],
      { i(1), i(0) }
    )
  ),

  -- TODO
  asm({ trig = 'ubre' }, fmta('underbrace(<>, )<>', { i(1), i(0) })),
  asm({ trig = 'obre' }, fmta('overbrace(<>, )<>', { i(1), i(0) })),
  asm({ trig = 'ubrk' }, fmta('underbracket(<>, )<>', { i(1), i(0) })),
  asm({ trig = 'obrk' }, fmta('overbracket(<>, )<>', { i(1), i(0) })),
  asm({ trig = 'ubrk' }, fmta('underparen(<>, )<>', { i(1), i(0) })),
  asm({ trig = 'obrk' }, fmta('overparen(<>, )<>', { i(1), i(0) })),
  asm({ trig = 'ubrk' }, fmta('undershell(<>, )<>', { i(1), i(0) })),
  asm({ trig = 'obrk' }, fmta('overshell(<>, )<>', { i(1), i(0) })),

  asm({ trig = 'stretch' }, fmta('stretch(<>)^"<>"<>', { i(1), i(2), i(0) })),

  asm({ trig = 'cnl' }, fmta('cancel(<>)<>', { i(1), i(0) })),

  asm({ trig = 'sq', name = 'square root' }, fmta('sqrt(<>)<>', { i(1), i(0) })),

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
    { condition = in_textzone }
  ),

  --------------
  --[[ Text ]]
  --------------

  as(
    { trig = 'tii', name = 'italic', dscr = 'italic text', wordTrig = false },
    fmta([[italic(<>)<>]], {
      d(1, get_visual),
      i(0),
    }),
    { condition = trigger_does_not_follow_alpha_char * in_mathzone }
  ),
  as(
    { trig = 'bld', name = 'bold', dscr = 'bold text', wordTrig = false },
    fmta([[bold(<>)<>]], {
      d(1, get_visual),
      i(0),
    }),
    { condition = trigger_does_not_follow_alpha_char * in_mathzone }
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
  asm({ trig = 'hdot', name = 'horizontal dots' }, t('dots.h.c')),
  asm({ trig = 'vdot', name = 'vertical dots' }, t('dots.v')),
  asm({ trig = 'ddot', name = 'downwards dots' }, t('dots.d')),
  asm({ trig = 'udot', name = 'upwards dots' }, t('dots.u')),
  asm({ trig = 'px' }, t('approx')),
  asm({ trig = 'pm' }, t('plus.minus')),
  asm({ trig = 'mp' }, t('minus.plus')),
  asm({ trig = 'exi' }, t('exists')),
  asm({ trig = 'exin' }, t('exists.not')),
  asm({ trig = 'fal' }, t('forall')),
  asm({ trig = 'int' }, t('integral')),
  asm({ trig = 'Inter' }, t('inter.big')),
  asm({ trig = 'Union' }, t('union.big')),
  asm({ trig = 'subs' }, t('subset')),
  asm({ trig = 'sups' }, t('supset')),
  asm({ trig = 'dint' }, t('integral.double')),
  asm({ trig = 'tint' }, t('integral.double')),
  asm({ trig = 'oint' }, t('integral.cont')),
  asm({ trig = 'sint' }, t('integral.surf')),
  asm({ trig = 'vint' }, t('integral.vol')),
  asm({ trig = 'quad' }, t('space.quad')),

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

  ['~'] = {
    context = {
      name = 'tilde',
      dscr = 'tilde',
    },
    command = {
      pre = 'tilde(',
      post = ')',
    },
  },

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

  mon = {
    context = {
      name = 'mono',
      dscr = 'monosize font',
    },
    command = {
      pre = 'mono(',
      post = ')',
    },
  },
}

local postfix_math_snippets = {}
for i, j in pairs(postfix_math) do
  table.insert(
    postfix_math_snippets,
    postfix_snippet(vim.tbl_deep_extend('keep', { trig = i, snippetType = 'autosnippet' }, j.context), j.command, { condition = in_mathzone })
  )
end
vim.list_extend(M, postfix_math_snippets)

return M
