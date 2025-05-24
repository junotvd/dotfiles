-- https://github.com/evesdropper/dotfiles/blob/main/nvim/lua/snippets/tex/utils/scaffolding.lua
local M = {}

-- LuaSnip
local ls = require('luasnip')
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local extras = require('luasnip.extras')
local l = extras.lambda
local rep = extras.rep
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local autosnippet = ls.extend_decorator.apply(s, { snippetType = 'autosnippet' })
local postfix = require('luasnip.extras.postfix').postfix

-- brackets
local brackets = {
  b = { '[', ']' },
  c = { '{', '}' },
  m = { '|', '|' },
  p = { '(', ')' },
}

-- postfix helper function - generates dynamic node
local generate_postfix_dynamicnode = function(_, parent, _, user_arg1, user_arg2)
  local capture = parent.snippet.env.POSTFIX_MATCH
  if #capture > 0 then
    return sn(
      nil,
      fmta(
        [[
        <><><><>
        ]],
        { t(user_arg1), t(capture), t(user_arg2), i(0) }
      )
    )
  else
    local visual_placeholder = parent.snippet.env.SELECT_RAW
    return sn(
      nil,
      fmta(
        [[
        <><><><>
        ]],
        { t(user_arg1), i(1, visual_placeholder), t(user_arg2), i(0) }
      )
    )
  end
end

M.postfix_snippet = function(context, command, opts)
  opts = opts or {}
  if not context.trig then
    error("context doesn't include a `trig` key which is mandatory", 2)
  end
  if not context.trig then
    error("context doesn't include a `trig` key which is mandatory", 2)
  end
  context.dscr = context.dscr
  context.name = context.name or context.dscr
  context.docstring = command.pre .. [[(POSTFIX_MATCH|VISUAL|<1>)]] .. command.post
  context.match_pattern = [[[%w%.%_%-%"%']*$]]
  j, _ = string.find(command.pre, context.trig)
  if j == 2 then -- command always starts with backslash
    context.trigEngine = 'ecma'
    context.trig = '(?<!\\\\)' .. '(' .. context.trig .. ')'
    context.hidden = true
  end
  return postfix(context, { d(1, generate_postfix_dynamicnode, {}, { user_args = { command.pre, command.post } }) }, opts)
end

return M
