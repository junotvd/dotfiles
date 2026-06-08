vim.cmd('highlight clear')
if vim.g.syntax_on then vim.cmd('syntax reset') end
vim.cmd('syntax on')
vim.treesitter.stop(0)

vim.g.colors_name = 'test2'
vim.o.background = 'light'

-- red, green, yellow, blue, magenta, cyan, white, bblack (gray), bred, bgreen, byellow, bblue, bmagenta, bcyan, bwhite, orange, borange, 4 shades of black/grey
local c = {
  red = '#e14232',
  green = '#14a16a',
  yellow = '#cba26a',
  blue = '#18457c',
	test_blue = '#20609f',
  magenta = '#9f6ccc',
  cyan = '#3cc1c1',
  white = '#fef7ea',
  gray = '#515151',

  bright_red = '#d95f3c',
  bright_green = '#0f9a29',
  bright_yellow = '#ecb77c',
  bright_blue = '#6da6cc',
  bright_magenta = '#d1a2f9',
  bright_cyan = '#61e8e8',
  bright_white = '#f6ead0',
  bright_gray = '#717171',
}

local function hi(group, opts) vim.api.nvim_set_hl(0, group, opts) end

hi('NormalFloat', { fg = c.gray, bg = c.bright_white })
hi('Normal', { fg = c.gray, bg = c.white })
hi('Comment', { fg = c.bright_gray, italic = true })
hi('Constant', { fg = c.magenta })
hi('@variable', { fg = c.gray })
hi('String', { fg = c.yellow })
hi('Number', { fg = c.green })
hi('Float', { fg = c.green })
hi('Boolean', { fg = c.bright_magenta })
hi('Identifier', { fg = c.bright_blue })
hi('Function', { fg = c.blue, bold = true })
hi('Statement', { fg = c.red, italic = true })
hi('Conditional', { link = 'Statement' }) -- doet niks
-- hi('Repeat', { fg = c.purple1 }) -- for, while, do loop etc
-- hi('Label', { fg = c.green2 })
-- hi('PreProc', { fg = c.blue4 })
-- hi('Include', { fg = c.red2 })
-- hi('Define', { fg = c.red2 })
-- hi('Title', { fg = c.red2 })
-- hi('Macro', { fg = c.red2 })
-- hi('PreCondit', { fg = c.red2 })
hi('Type', { fg = c.gray })
-- hi('StorageClass', { fg = c.red2 })
-- hi('Structure', { fg = c.red2 })
-- hi('Typedef', { fg = c.red2 })
-- hi('Special', { fg = c.red2 })
-- hi('SpecialComment', { fg = c.red2 })
-- hi('MoreMsg', { fg = c.red2 })
hi('Error', { fg = c.bright_red, bold = true })
-- hi('Todo', { fg = c.red2, style = 'bold' })
hi('LineNr', { fg = c.bright_gray })
-- hi('CursorLine', { bg = c.red })
-- hi('CursorLineNr', { fg = c.yellow })
-- hi('debugPc', { fg = c.red2 })
-- hi('Conceal', { fg = c.red2 })
-- hi('Directory', { fg = c.red2 })
hi('Visual', { bg = c.bright_white })
hi('StatusLine', { fg = c.gray, bg = c.bright_white })
