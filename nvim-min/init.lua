vim.pack.add {
	{ src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' },
	'https://github.com/neovim/nvim-lspconfig',
	'https://github.com/stevearc/oil.nvim',
	'https://github.com/y9san9/y9nika.nvim',
	'https://github.com/vague2k/vague.nvim',
	'https://github.com/p00f/alabaster.nvim',
}

vim.g.mapleader = ' '
vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.smartindent = true
vim.o.cursorcolumn = false
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = 'yes'
vim.o.swapfile = false
vim.o.termguicolors = true
vim.o.undofile = true
vim.o.incsearch = true
vim.o.hlsearch = false
vim.o.guicursor = ''
vim.o.mouse = ''
vim.o.scrolloff = 100
vim.o.completeopt = 'menu,menuone,fuzzy,noinsert'


require 'vague'.setup({ transparent = true })
vim.cmd.colorscheme('vague')
vim.cmd ':hi statusline guibg=NONE'
vim.cmd('syntax off')

require('oil').setup({
	default_file_explorer = true,
	view_options = {
		show_hidden = true,
	},
	columns = {
		'permissions',
		'size',
	},
})


local map = vim.keymap.set
map('n', '<leader>pv', ':Oil<CR>', { silent = true })
map('n', '<leader>w', ':update<CR> :source<CR>')
map({ 'n', 'v', 'x' }, '<leader>y', '"+y')
map({ 'n', 'v', 'x' }, '<leader>d', '"+d')
map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")
map('n', '<leader>f', ':Pick files<CR>')
map('n', '<leader>h', ':Pick help<CR>')
map('n', '<leader>lf', vim.lsp.buf.format)
map({ 'n', 'v', 'x' }, '<leader>s', ':e #<CR>')
map({ 'n', 'v', 'x' }, '<leader>S', ':sf #<CR>')
map({ 'n', 'v', 'x' }, '<leader>v', ':e $MYVIMRC<CR>')
map('n', '<leader>r', ':update<CR> :make<CR>')


vim.lsp.enable({
	'lua_ls', 'tinymist', 'basedpyright', 'ruff',
	'html', 'cssls', 'bashls', 'nil',
	'vtsls', 'gopls', 'rust_analyzer', 'marksman',
})


vim.diagnostic.config({
	virtual_text = { severity = vim.diagnostic.severity.ERROR },
	severity_sort = true
})


-- Autocommands
vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		vim.o.signcolumn = 'yes:1'
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		if client:supports_method('textDocument/completion') then
			vim.o.complete = 'o,.,w,b,u'
			vim.o.completeopt = 'menu,menuone,popup,noinsert'
			vim.lsp.completion.enable(true, client.id, args.buf)
		end
	end
})

vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function() vim.highlight.on_yank() end,
})
