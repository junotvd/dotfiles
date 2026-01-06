--stylua: ignore start
-- General ====================================================================
vim.g.mapleader = ' '

vim.o.guicursor = ''

vim.o.switchbuf = 'usetab'
vim.o.undofile = true
vim.o.shada = "'100,<50,s10,:1000,/100,@100,h" -- Limit ShaDa file (for startup)

vim.cmd('filetype plugin indent on')
if vim.fn.exists('syntax on') ~= 1 then vim.cmd('syntax enable') end

-- UI =========================================================================
vim.o.breakindent    = true
vim.o.breakindentopt = 'list:-1'
vim.o.colorcolumn    = '+1'
vim.o.cursorline     = true
vim.o.linebreak      = true
vim.o.list           = false
vim.o.number         = true
vim.o.relativenumber = true
vim.o.shortmess      = 'CFOSWaco'
vim.o.signcolumn     = 'yes'
vim.o.splitbelow     = true
vim.o.splitkeep      = 'screen'
vim.o.splitright     = true

vim.o.cursorlineopt  = 'screenline,number'

if vim.fn.has('nvim-0.12') == 1 then
  vim.o.pummaxwidth = 100
  vim.o.completetimeout = 100
  require('vim._extui').enable({ enable = true })
end


-- Editing ====================================================================
vim.o.autoindent    = true
vim.o.smartindent   = true
vim.o.expandtab     = true
vim.o.formatoptions = 'rqnl1j'
vim.o.ignorecase    = true
vim.o.smartcase     = true
vim.o.incsearch     = true
vim.o.hlsearch      = false
vim.o.infercase     = true
vim.o.shiftwidth    = 2
vim.o.spelllang     = 'en,nl'
vim.o.spelloptions  = 'camel'
vim.o.tabstop       = 2
vim.o.virtualedit   = 'block'

vim.o.iskeyword     = '@,48-57,_,192-255,-'

-- Pattern for a start of 'numbered' list (used in `gw`). This reads as
-- "Start of list item is: at least one special character (digit, -, +, *)
-- possibly followed by punctuation (. or `)`) followed by at least one space".
vim.o.formatlistpat = [[^\s*[0-9\-\+\*]\+[\.\)]*\s\+]]

-- Built-in completion
vim.o.complete      = '.,w,b,kspell'
vim.o.completeopt   = 'menuone,noselect,fuzzy,nosort'

-- Autocommands ===============================================================
-- Don't auto-wrap comments and don't insert comment leader after hitting 'o'.
-- Do on `FileType` to always override these changes from filetype plugins.
local f             = function() vim.cmd('setlocal formatoptions-=c formatoptions-=o') end
_G.Config.new_autocmd('FileType', nil, f, "Proper 'formatoptions'")

-- Diagnostics ================================================================
local diagnostic_opts = {
  signs = { priority = 9999, severity = { min = 'WARN', max = 'ERROR' } },
  virtual_lines = false,
  virtual_text = {
    current_line = true,
  },
  update_in_insert = false,
}
MiniDeps.later(function() vim.diagnostic.config(diagnostic_opts) end)
--stylua: ignore end
