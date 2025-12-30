local ensure_installed = {
	'lua',
	'luadoc',
	'javascript',
	'bash',
	'markdown',
	'markdown_inline',
	'editorconfig',
	'html',
	'toml',
	'vim',
	'vimdoc',
	'comment',
	'typst',
}

require('nvim-treesitter').install(ensure_installed)

local filetypes = vim.iter(ensure_installed)
		:map(vim.treesitter.language.get_filetypes)
		:flatten()
		:totable()

vim.api.nvim_create_autocmd('FileType', {
	pattern = filetypes,
	callback = function(ev)
		vim.treesitter.start(ev.buf)
	end,
})
