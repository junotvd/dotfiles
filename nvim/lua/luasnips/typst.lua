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

local M = {
  --------------
  --[[ Math ]]
  --------------

  as({ trig = 'mk' }, fmta('$<>$<>', { i(1), i(0) })),
  as({ trig = 'dmk' }, fmta('$display(<>)$<>', { i(1), i(0) })),
  as(
    { trig = 'md', wordTrig = false, regTrig = false },
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
  as({ trig = 'sr', wordTrig = false }, { t('^2') }, { condition = in_mathzone }),
  as({ trig = 'cb', wordTrig = false }, { t('^3') }, { condition = in_mathzone }),
  as({ trig = 'td' }, fmta('^(<>)', { i(1) }), { condition = in_mathzone }),
  as({ trig = 'inv', wordTrig = false }, fmt('^(-1)', {}), { condition = in_mathzone }),
  -- TODO: originele subscripts zoals bij tex
  as(
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
    }),
    { condition = in_mathzone }
  ),
  as({ trig = 'int', wordTrig = false }, fmta('integral', {}), { condition = in_mathzone }),
  as({ trig = 'dint', wordTrig = false }, fmta('integral.double', {}), { condition = in_mathzone }),
  as({ trig = 'tint', wordTrig = false }, fmta('integral.double', {}), { condition = in_mathzone }),
  as({ trig = '//', wordTrig = false }, fmta('(<>)/(<>) <>', { i(1), i(2), i(0) }), { condition = in_mathzone }),
  as(
    { trig = 'Int', wordTrig = false },
    fmta('integral_(<>)^(<>)<>', {
      i(1),
      i(2),
      i(0),
    }),
    { condition = in_mathzone }
  ),
  as(
    { trig = 'dInt', wordTrig = false },
    fmta('integral.double_(<>)^(<>)<>', {
      i(1),
      i(2),
      i(0),
    }),
    { condition = in_mathzone }
  ),
  as(
    { trig = 'tInt', wordTrig = false },
    fmta('integral.triple_(<>)^(<>)<>', {
      i(1),
      i(2),
      i(0),
    }),
    { condition = in_mathzone }
  ),

  --------------
  --[[ Text ]]
  --------------

  as(
    { trig = 'tt', wordTrig = false },
    fmta([["<>"<>]], {
      d(1, get_visual),
      i(0),
    }),
    { condition = trigger_does_not_follow_alpha_char * in_mathzone }
  ),
  as(
    { trig = 'tii', wordTrig = false },
    fmta([[italic(<>)<>]], {
      d(1, get_visual),
      i(0),
    }),
    { condition = trigger_does_not_follow_alpha_char * in_mathzone }
  ),
  as(
    { trig = 'tbb', wordTrig = false },
    fmta([[bold(<>)<>]], {
      d(1, get_visual),
      i(0),
    }),
    { condition = trigger_does_not_follow_alpha_char * in_mathzone }
  ),
  as(
    { trig = 'tbb', wordTrig = false },
    fmta([[*<>*<>]], {
      d(1, get_visual),
      i(0),
    }),
    { condition = trigger_does_not_follow_alpha_char * in_textzone }
  ),

  -----------------
  --[[ Symbols ]]
  -----------------

  as({ trig = 'iff' }, fmt('<==>', {}), { condition = in_mathzone }),
  as({ trig = 'imp' }, fmt('==>', {}), { condition = in_mathzone }),
  as({ trig = 'pmi' }, fmt('<==', {}), { condition = in_mathzone }),
  as({ trig = 'xx' }, fmt('times', {}), { condition = in_mathzone }),

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
