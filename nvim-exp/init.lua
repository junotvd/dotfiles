-- based on https://www.youtube.com/@sylvanfranklin 's config
vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.smartindent = true
vim.o.cursorcolumn = false
vim.o.ignorecase = true
vim.o.signcolumn = 'yes'
vim.o.swapfile = false
vim.o.termguicolors = true
vim.o.undofile = true
vim.o.incsearch = true
vim.o.winborder = "rounded"

local map = vim.keymap.set

vim.g.mapleader = ' '
map('n', '<leader>o', ':update<CR> :source<CR>')

map({ 'n', 'v', 'x' }, '<leader>y', '":+y<CR>')
map({ 'n', 'v', 'x' }, '<leader>d', '":+d<CR>')

map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")

map('n', '<leader>pv', vim.cmd.Oil)
map('n', '<leader>f', ':Pick files<CR>')
map('n', '<leader>h', ':Pick help<CR>')
map('n', '<leader>lf', vim.lsp.buf.format)

-- testing
-- e: edit, #: alternate file, s: split, f: find (open file)
map({ 'n', 'v', 'x' }, '<leader> s', ':e #<CR>')
map({ 'n', 'v', 'x' }, '<leader> S', ':sf #<CR>')


vim.pack.add({
	{ src = 'https://github.com/vague2k/vague.nvim' },
	{ src = 'https://github.com/stevearc/oil.nvim' },
	{ src = 'https://github.com/echasnovski/mini.pick' },
	{ src = 'https://github.com/chomosuke/typst-preview.nvim' },
	{ src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
	{ src = 'https://github.com/mason-org/mason.nvim' },
})

require 'mason'.setup()
require 'mini.pick'.setup()
require 'oil'.setup()

-- require 'nvim-treesitter.configs'.setup({
-- 	ensure_installed = { 'javascript' },
-- 	highlight = { enable = true }
-- })

vim.lsp.enable({ 'lua_ls', 'tinymist' })


-- colors
require 'vague'.setup({
	transparant = true
})
vim.cmd.colorscheme('vague')
vim.cmd(":hi statusline guibg=NONE")
