local tex = require("snippets.tex.utils").conditions

local M =  {
  s({ trig = '([%a\\]+)(%d)', snippetType = 'autosnippet', regTrig = true, name = 'auto subscript', dscr = 'hi' },
    fmta([[<>_<>]],
      { f(function(_, snip) return snip.captures[1] end),
        f(function(_, snip) return snip.captures[2] end) }),
    { condition = tex.in_math }),

  s(
    { trig = '([%a\\]+)_(%d%d)', snippetType = 'autosnippet', regTrig = true, name = 'auto subscript 2', dscr =
    'auto subscript for 2+ digits' },
    fmta([[<>_{<>}]],
      { f(function(_, snip) return snip.captures[1] end),
        f(function(_, snip) return snip.captures[2] end) }),
    { condition = tex.in_math }),

  s({ trig = 'hat', snippetType = 'autosnippet', name = 'hat', dscr = 'hat' },
    fmta([[\hat{<>}<>]],
      { i(1), i(0) }),
    { condition = tex.in_math }),

  s({ trig = 'bar', snippetType = 'autosnippet', name = 'bar', dscr = 'bar' },
    fmta([[\overline{<>}<>]],
      { i(1), i(0) }),
    { condition = tex.in_math }),
}


-- postfixes
local postfix_snippet = require("snippets.tex.utils").scaffolding.postfix_snippet

local postfix_text = {
}

local postfix_text_snippets = {}
for i, j in pairs(postfix_text) do
  table.insert( postfix_text_snippets,
    postfix_snippet(
      vim.tbl_deep_extend('keep', { trig = i, snippetType = 'autosnippet' }, j.context),
      j.command,
      { condition = tex.in_text }
    )
  )
end
vim.list_extend(M, postfix_text_snippets)


local postfix_math = {
  [',.'] = {
    context = {
      name = 'vec',
      dscr = 'vector'
    },
    command = {
      pre = [[\vec{]],
      post = [[}]]
    }
  },

  ['bar'] = {
    context = {
      name = 'bar',
      dscr = 'overline'
    },
    command = {
      pre = [[\overline{]],
      post = [[}]]
    }
  },
  ['hat'] = {
    context = {
      name = 'hat',
      dscr = 'hat'
    },
    command = {
      pre = [[\hat{]],
      post = [[}]]
    }
  },
}

local postfix_math_snippets = {}
for i, j in pairs(postfix_math) do
  table.insert(
    postfix_math_snippets,
      postfix_snippet(
      vim.tbl_deep_extend('keep', { trig = i, snippetType = 'autosnippet' }, j.context),
      j.command,
      { condition = tex.in_math }
    )
  )
end
vim.list_extend(M, postfix_math_snippets)

return M
