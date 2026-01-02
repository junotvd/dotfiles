vim.cmd('filetype plugin indent on')
if vim.fn.exists('syntax_on') ~= 1 then vim.cmd('syntax enable') end

local opt = vim.opt
vim.g.mapleader = ' '
opt.number = true
opt.relativenumber = true
opt.wrap = false
opt.tabstop = 2
opt.shiftwidth = 2
opt.smartindent = true
opt.cursorcolumn = false
opt.ignorecase = true
opt.smartcase = true
opt.signcolumn = 'yes'
opt.swapfile = false
opt.termguicolors = true
opt.undofile = true
opt.incsearch = true
opt.hlsearch = false
opt.guicursor = ''
opt.mouse = ''
opt.scrolloff = 100
opt.spell = true
opt.spelllang = { 'nl', 'en_gb' }
opt.statusline = '[%n] %<%f %h%w%m%r%=%-14.(%l,%c%V%) %P'
vim.o.spelloptions = 'camel'
