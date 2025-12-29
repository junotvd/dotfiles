-- based on https://www.youtube.com/@sylvanfranklin 's config
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

vim.g.mapleader = ' '
local map = vim.keymap.set

map('n', '<leader>o', ':update<CR> :source<CR>')

map({ 'n', 'v', 'x' }, '<leader>y', '"+y')
map({ 'n', 'v', 'x' }, '<leader>d', '"+d')

map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")

map('n', '<leader>pv', vim.cmd.Oil)
map('n', '<leader>f', ':Pick files<CR>')
map('n', '<leader>h', ':Pick help<CR>')
map('n', '<leader>lf', vim.lsp.buf.format)

-- testing
-- e: edit, #: alternate file, s: split, f: find (open file)
map({ 'n', 'v', 'x' }, '<leader>s', ':e #<CR>')
map({ 'n', 'v', 'x' }, '<leader>S', ':sf #<CR>')
map({ 'n', 'v', 'x' }, '<leader>v', ':e $MYVIMRC<CR>')
map('n', '<leader>r', ':update<CR> :make<CR>')

vim.pack.add {
	{ src = 'https://github.com/vague2k/vague.nvim' },
	{ src = 'https://github.com/y9nika/y9nika.nvim' },
	{ src = 'https://github.com/ricardoraposo/gruvbox-minor.nvim' },
	{ src = 'https://github.com/savq/melange-nvim' },
	{ src = 'https://github.com/RostislavArts/naysayer.nvim' },
	{ src = 'https://github.com/stevearc/oil.nvim' },
	{ src = 'https://github.com/echasnovski/mini.pick' },
	{ src = 'https://github.com/echasnovski/mini.surround' },
	{ src = 'https://github.com/chomosuke/typst-preview.nvim' },
	{
		src = 'https://github.com/nvim-treesitter/nvim-treesitter',
		data = {
			run = function(_)
				vim.cmd 'TSUpdate'
			end,
		},
	},
	{ src = 'https://github.com/mason-org/mason.nvim' },
	{ src = 'https://github.com/L3MON4D3/LuaSnip' },
	{ src = 'https://github.com/chentoast/marks.nvim' },
}

require 'marks'.setup {
	builtin_marks = { '<', '>', '^', '"', [[']], '`', '[', ']' },
}

require 'mason'.setup()
require 'mini.pick'.setup()
require 'mini.surround'.setup()
require 'oil'.setup {
	default_file_explorer = true,
	view_options = {
		show_hidden = true,
	},
	columns = {
		'permissions',
		'size',
	},
}


require 'luasnip'.setup { enable_autosnippets = true }
require 'luasnip.loaders.from_lua'.load {
	paths = '~/dotfiles/nvim-exp/snippets/',
}

local ls = require 'luasnip'
map('i', '<C-e>', function() ls.expand() end, { silent = true })
map({ 'i', 's' }, '<C-J>', function() ls.jump(1) end, { silent = true })
map({ 'i', 's' }, '<C-K>', function() ls.jump(-1) end, { silent = true })

vim.lsp.enable {
	'lua_ls',
	'tinymist',
	'basedpyright',
	'ruff',
	'html',
	'cssls',
	'bashls',
	'nil',
	'vtsls',
	'gopls',
	'rust_analyzer',
}


vim.diagnostic.config {
	virtual_text = { severity = vim.diagnostic.severity.ERROR },
	severity_sort = true
}

vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('my.lsp', {}),
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		if client:supports_method 'textDocument/completion' then
			-- Optional: trigger autocompletion on EVERY keypress. May be slow!
			local chars = {}
			for i = 32, 126 do
				table.insert(chars, string.char(i))
			end
			client.server_capabilities.completionProvider.triggerCharacters = chars
			vim.lsp.completion.enable(
				true,
				client.id,
				args.buf,
				{ autotrigger = true }
			)
		end
	end,
})
vim.cmd [[set completeopt+=menuone,noselect,popup]]

local function pack_clean()
	local active_plugins = {}
	local unused_plugins = {}

	for _, plugin in ipairs(vim.pack.get()) do
		active_plugins[plugin.spec.name] = plugin.active
	end

	for _, plugin in ipairs(vim.pack.get()) do
		if not active_plugins[plugin.spec.name] then
			table.insert(unused_plugins, plugin.spec.name)
		end
	end

	if #unused_plugins == 0 then
		print 'No unused plugins.'
		return
	end

	local choice = vim.fn.confirm('Remove unused plugins?', '&Yes\n&No', 2)
	if choice == 1 then
		vim.pack.del(unused_plugins)
	end
end

map('n', '<leader>pc', pack_clean)
map('n', '<leader>pu', '<cmd>lua vim.pack.update()<CR>')

vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function() vim.highlight.on_yank() end,
})

-- colors
require 'vague'.setup { transparent = true }
vim.cmd.colorscheme 'y9nika-solar'
vim.cmd ':hi statusline guibg=NONE'
