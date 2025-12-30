-- list of treesitter language identifiers
-- NOT vim filetypes, these are grammar names known to TS
local ensure_installed = {
	'lua',
	'luadoc',
	'python',
	'javascript',
	'bash',
	'markdown',
	'markdown_inline',
	'editorconfig',
	'html',
	'css',
	'toml',
	'vimdoc',
	'comment',
	'vim',
	'typst'
}

-- garandeert dat parses eenmalig geinstalleerd worden, no runtime guessing, no silent failures
require('nvim-treesitter').install(ensure_installed)

--[[
vim.iter() iterate over grammars:
this creates an iteration over 'lua', 'luadoc', 'python', ...

:map(vim.treesitter.language...) for each TS language, nvim answers
"Which Vim filetypes should use this grammar?"
Example vim.treesitter.language.get_filetypes('bashls') -> { 'sh', 'bash' }

so after :map() we conceptually have:
{ { 'lua' }, { 'luadoc' }, { 'python' }, { 'javascript' }, { 'sh', 'bash' }, ... }

:flatten() flattens the nested list, turns above into
{ 'lua', 'python', 'sh', 'bash', ... }

:totable() turns iterator into normal table, so filetypes becomes
filetypes = { 'lua', 'luadoc', 'python', ... }

--]]
local filetypes = vim.iter(ensure_installed):map(vim.treesitter.language.get_filetypes):flatten():totable()

--[[
when a buffer's filetype becomes one of these known, supported filetypes,
start TS for that buffer
Properties:
- FileType fires when &filetype is set
- pattern = filetypes is a whitelist
(- no pcall needed)
- no guessing and no errors hidden

vim.treesitter.start(ev.buf):
- attaches to the correct parser
- enables TS highlighting for that buffer
- uses the parser that is already guaranteed to exist
- this would error if no parser existed, but that can't happen because of ...(ensure_installed)
--]]


vim.api.nvim_create_autocmd('FileType', {
	pattern = filetypes,
	callback = function(ev) -- ev is convention for "event"
		vim.treesitter.start(ev.buf)
	end,
})
