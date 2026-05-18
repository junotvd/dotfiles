vim.g.mapleader = ' '
vim.o.signcolumn = 'yes:1'
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.smartindent = true
vim.o.hlsearch = false
vim.o.number = true
vim.o.relativenumber = true
vim.o.guicursor = ''
vim.o.smartindent = true
vim.o.incsearch = true
vim.o.hlsearch = false
vim.o.undofile = true
vim.o.scrolloff = 20

vim.pack.add({
	'https://github.com/neovim/nvim-lspconfig',
	'https://github.com/nvim-treesitter/nvim-treesitter',
	'https://github.com/stevearc/oil.nvim',
	'https://github.com/stevearc/conform.nvim',
	'https://github.com/mason-org/mason.nvim',
	'https://github.com/mason-org/mason-lspconfig.nvim',
	'https://github.com/vague-theme/vague.nvim',
	'https://github.com/j-hui/fidget.nvim',
	'https://github.com/chomosuke/typst-preview.nvim',
	'https://github.com/nvim-mini/mini.nvim',
	'https://github.com/MeanderingProgrammer/render-markdown.nvim',
	'https://github.com/akinsho/toggleterm.nvim',
})


vim.cmd('syntax off')
vim.cmd.colorscheme('vague')

require('toggleterm').setup()

require('mason').setup()
require('mason-lspconfig').setup({
	ensure_installed = {
		'lua_ls', 'basedpyright', 'tinymist', 'ts_ls', 'emmet_ls', 'html', 'cssls', 'bashls',
	}
})

require('oil').setup({
	view_options = {
		show_hidden = true,
	},
	columns = {
		'permissions',
		'size',
	},
})
require('conform').setup({
	formatters_by_ft = {
		javascript = { 'prettier' },
		html = { 'prettier' },
		css = { 'prettier' },
		json = { 'prettier' },
		markdown = { 'prettier' },
		lua = { 'stylua' },
		python = { 'black' },
		typst = { 'typstyle' },
		sh = { 'shfmt' },
		bash = { 'shfmt' },
		sql = { 'pg_format' },

	},
})

require('fidget').setup()

require('typst-preview').setup()

require('mini.surround').setup()
require('mini.tabline').setup()

vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		if ev.data.spec.name == "LuaSnip" and ev.data.kind ~= "delete" then
			vim.system({ "make", "install_jsregexp" }, { cwd = ev.data.path }):wait()
		end
	end,
})
vim.pack.add({ { src = "https://github.com/L3MON4D3/LuaSnip", version = vim.version.range("2.*") } })
local ls = require('luasnip')
ls.setup({ enable_autosnippets = true })
require('luasnip.loaders.from_lua').lazy_load({
	paths = { vim.fn.expand('~/dotfiles/nvim/snippets/') },
})
vim.keymap.set('i', '<C-e>', function() ls.expand() end, { silent = true })
vim.keymap.set({ 'i', 's' }, '<C-l>', function() ls.jump(1) end, { silent = true })
vim.keymap.set({ 'i', 's' }, '<C-h>', function() ls.jump(-1) end, { silent = true })


vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		vim.o.signcolumn = 'yes:1'
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		if client:supports_method('textDocument/completion') then
			vim.o.complete = 'o,.,w,b,u'
			vim.o.completeopt = 'menu,menuone,popup,noinsert'
			vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
		end
	end
})
vim.diagnostic.config({
	virtual_lines = false,
	virtual_text = {
		current_line = true,
	},
	update_in_insert = false,
})


vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function() vim.hl.hl_op() end,
})

local ensure_languages = {
	'lua',
	'python',
	'typst',
	'markdown',
	'markdown_inline',
	'javascript',
}

local isnt_installed = function(lang) return #vim.api.nvim_get_runtime_file('parser/' .. lang .. '.*', false) == 0 end
local to_install = vim.tbl_filter(isnt_installed, ensure_languages)
if #to_install > 0 then require('nvim-treesitter').install(to_install) end

local filetypes = vim.iter(ensure_languages):map(vim.treesitter.language.get_filetypes):flatten():totable()
local ts_start = function(ev) vim.treesitter.start(ev.buf) end
vim.api.nvim_create_autocmd('FileType', { pattern = filetypes, callback = ts_start })


local map = vim.keymap.set
map('n', '<leader>pv', vim.cmd.Oil, { silent = true })
map('n', '<Leader>lf', '<Cmd>lua require("conform").format({lsp_fallback = true})<CR>')

map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")
map({ 'n', 'v', 'x' }, '<Leader>y', '"+y')
map({ 'n', 'v', 'x' }, '<Leader>d', '"+d')

map({'n'}, '<leader>tt', '<Cmd>ToggleTerm<CR>')
