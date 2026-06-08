vim.cmd('highlight clear')
if vim.g.syntax_on then vim.cmd('syntax reset') end

vim.g.colors_name = 'test'
vim.o.background = 'light'

-- red, green, yellow, blue, magenta, cyan, white, bblack (gray), bred, bgreen, byellow, bblue, bmagenta, bcyan, bwhite, orange, borange, 4 shades of black/grey
local c = {
  red = '#e14232',
  green = '#14a16a',
  yellow = '#cba26a',
  blue = '#18457c',
  magenta = '#9f6ccc',
  cyan = '#3cc1c1',
  white = '#fef7ea',
  gray = '#515151',

  bright_red = '#d95f3c',
  bright_green = '#0f9a29',
  bright_yellow = '#e14232',
  bright_blue = '#6da6cc',
  bright_magenta = '#d1a2f9',
  bright_cyan = '#61e8e8',
  bright_white = '#f6ead0',
	bright_grey = '#717171',

  wit1 = '#fef7ea',
  wit2 = '#f4eee2',
  wit3 = '#f6ead0',
  gray1 = '#d0d3d4',
  gray2 = '#717171',
  gray3 = '#515151',
  gray4 = '#8A7F6B',
  red1 = '#d95d39',
  red2 = '#e14232',
  red3 = '#ff0000',
  green1 = '#0f9a29',
  green2 = '#3A7A5E',
  yellow1 = '#ecb77c',
  yellow2 = '#cba26a',
  yellow3 = '#9a6b2e',
  blue1 = '#18457c',
  blue2 = '#001f42',
  blue4 = '#1ca9d6',
  blue5 = '#6da6cc',
  blue6 = '#82cfe2',
  blue7 = '#263f5e',
  purple1 = '#cba6f7',
  purple2 = '#901a9e',
  pink1 = '#fc64e8',
  pink2 = '#f794ea',
  cyan1 = '#94e2d5',
}

local function hi(group, opts) vim.api.nvim_set_hl(0, group, opts) end

hi('NormalFloat', { fg = c.gray3, bg = c.wit2 })
hi('Normal', { fg = c.gray3, bg = c.wit1 })
hi('Comment', { fg = c.gray2, italic = true })
hi('Constant', { fg = c.purple1 })
hi('String', { fg = c.yellow3 })
-- hi('Character', { fg = c.red }) -- @character and @character.special
hi('Number', { fg = c.green1 })
hi('Float', { fg = c.green1 })
hi('Boolean', { fg = c.purple1 })
hi('Identifier', { fg = c.blue5 })
hi('Function', { fg = c.blue1 })
hi('Statement', { fg = c.green2 })
hi('Conditional', { fg = c.gray3 }) -- doet niks
hi('Repeat', { fg = c.purple1 }) -- for, while, do loop etc
-- hi('Label', { fg = c.green2 })
hi('PreProc', { fg = c.blue4 })
hi('Include', { fg = c.red2 })
hi('Define', { fg = c.red2 })
-- hi('Title', { fg = c.red2 })
-- hi('Macro', { fg = c.red2 })
-- hi('PreCondit', { fg = c.red2 })
-- hi('Type', { fg = c.red2 })
-- hi('StorageClass', { fg = c.red2 })
-- hi('Structure', { fg = c.red2 })
-- hi('Typedef', { fg = c.red2 })
-- hi('Special', { fg = c.red2 })
-- hi('SpecialComment', { fg = c.red2 })
-- hi('MoreMsg', { fg = c.red2 })
hi('Error', { fg = c.red2, bold = true })
-- hi('Todo', { fg = c.red2, style = 'bold' })
hi('LineNr', { fg = c.gray2 })
hi('CursorLine', { bg = c.red2 })
hi('CursorLineNr', { fg = c.yellow1 })
-- hi('debugPc', { fg = c.red2 })
-- hi('Conceal', { fg = c.red2 })
-- hi('Directory', { fg = c.red2 })
hi('Visual', { bg = c.wit3 })
hi('StatusLine', { fg = c.gray3, bg = c.wit1 })

-- Treesitter
hi('@variable', { fg = c.gray3 })
hi('@variable.parameter', { fg = c.purple2 })
hi('@variable.member', { fg = c.blue5 })
hi('@variable.builtin', { fg = c.green2 })
hi('@boolean', { fg = c.green1 })
hi('@error', { fg = c.red3 })
hi('@punctuation.delimiter', { fg = c.gray3 })
hi('@punctuation.bracket', { fg = c.gray3 })
hi('@punctuation.special', { fg = c.gray3 })
-- hi('@markup.list', { fg = c.red3 })
hi('@constant', { fg = c.pink2, bold = true })
hi('@definition.constant', { fg = c.pink2, bold = true })
hi('@constant.builtin', { fg = c.pink2 })
hi('@string', { fg = c.yellow3 })
hi('@character', { fg = c.yellow3 })
hi('@number', { fg = c.yellow1 })
hi('@namespace', { fg = c.gray3 })
hi('@module', { fg = c.gray3 })
hi('@func.builtin', { fg = c.red3 })
hi('@function', { fg = c.blue1, bold = true })
hi('@function.call', { fg = c.blue1 })
hi('@function.builtin', { fg = c.blue1 })
hi('@function.macro', { fg = c.blue1 })
hi('@parameter', { fg = c.blue5 })
hi('@variable.parameter', { fg = c.purple2 })
hi('@variable.reference', { fg = c.gray3 })
hi('@method', { fg = c.blue1 })
hi('@function.method', { fg = c.blue1, bold = true })
hi('@method.call', { fg = c.blue1, bold = true })
hi('@function.method.call', { fg = c.blue1, bold = true })
hi('@field', { link = '@variable.member' })
hi('@property', { link = '@variable.member' })
hi('@constructor', { fg = c.pink2, bold = true })
hi('@conditional', { fg = c.green2, italic = true })
hi('@keyword.conditional', { fg = c.green2, italic = true })
hi('@repeat', { fg = c.green2 })
hi('@keyword.repeat', { link = '@repeat' })
hi('@keyword', { fg = c.green2, italic = true })
hi('@keyword.return', { link = '@keyword' })
hi('@keyword.function', { link = '@keyword' })
hi('@keyword.operator', { link = '@keyword' })
hi('@label', { fg = c.blue5 })
hi('@operator', { fg = c.blue2 })
hi('@exeption', { fg = c.red2 })

hi('@variable.python', { fg = c.gray3 })
hi('@attribute.python', { fg = c.red2, bold = true })
