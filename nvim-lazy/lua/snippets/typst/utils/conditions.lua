-- https://github.com/evesdropper/dotfiles/blob/main/nvim/lua/snippets/tex/utils/conditions.lua
-- https://forum.typst.app/t/giles-castel-like-snippets-for-typst-in-neovim/3961

local M = {}

local d = require('luasnip').dynamic_node
local cond_obj = require('luasnip.extras.conditions')

M.get_visual = function(args, parent)
  if #parent.snippet.env.LS_SELECT_RAW > 0 then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else -- If LS_SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end

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

M.in_textzone = cond_obj.make_condition(function(check_parent)
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

M.in_codezone = cond_obj.make_condition(function()
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

M.in_mathzone = cond_obj.make_condition(function()
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

-- local iv = function(i, ...)
--   return d(i, get_visual, ...)
-- end

return M
