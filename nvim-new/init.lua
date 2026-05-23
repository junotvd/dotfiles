vim.g.mapleader = ' '
vim.o.signcolumn = 'yes:1'
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.smartindent = true
vim.o.breakindent = true
vim.o.linebreak = true
vim.o.smartcase = true
vim.o.infercase = true
vim.o.hlsearch = false
vim.o.number = true
vim.o.relativenumber = true
vim.o.guicursor = ''
vim.o.smartindent = true
vim.o.undofile = true
vim.o.scrolloff = 20
vim.o.spelllang = 'en,nl'
vim.o.spelloptions = 'camel'
vim.opt.spellfile = vim.fn.stdpath('config') .. '/spell/nl.utf-8.add'

vim.pack.add({
  -- core things
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/nvim-treesitter/nvim-treesitter',
  'https://github.com/stevearc/oil.nvim',
  'https://github.com/stevearc/conform.nvim',
  'https://github.com/mason-org/mason.nvim',
  'https://github.com/mason-org/mason-lspconfig.nvim',
  'https://github.com/j-hui/fidget.nvim',
  -- mini suite
  'https://github.com/nvim-mini/mini.nvim',
  -- term
  'https://github.com/akinsho/toggleterm.nvim',
  -- colors
  'https://github.com/vague-theme/vague.nvim',
  'https://github.com/rose-pine/neovim',
  'https://github.com/gbprod/nord.nvim',
})

vim.pack.add({
  'https://github.com/MeanderingProgrammer/render-markdown.nvim',
  'https://github.com/chomosuke/typst-preview.nvim',
}, { load = function() end })

local function lazy_ft(ft, plugin, setup)
  vim.api.nvim_create_autocmd('FileType', {
    pattern = ft,
    once = true,
    callback = function()
      vim.cmd.packadd(plugin)
      if setup then setup() end
      vim.cmd('doautocmd FileType')
    end,
  })
end

lazy_ft('markdown', 'render-markdown.nvim')
lazy_ft('typst', 'typst-preview.nvim')

require('vague').setup({
  on_highlights = function(hl, colors) hl.SpellBad = { fg = colors.error, undercurl = false, underline = false } end,
})
vim.cmd('syntax off')
vim.cmd.colorscheme('vague')

require('toggleterm').setup()

require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = {
    'lua_ls',
    'basedpyright',
    'tinymist',
    'ts_ls',
    'emmet_ls',
    'html',
    'cssls',
    'bashls',
    'stylua',
    'jdtls',
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

require('oil').setup({
  view_options = {
    show_hidden = true,
  },
  columns = {
		{'mtime', format = '%d%m%y %T' },
    'permissions',
		'size',
  },
})

require('fidget').setup()

require('mini.surround').setup()
require('mini.tabline').setup()
require('mini.bufremove').setup()
require('mini.pick').setup()
require('mini.extra').setup()


vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    if ev.data.spec.name == 'LuaSnip' and ev.data.kind ~= 'delete' then
      vim.system({ 'make', 'install_jsregexp' }, { cwd = ev.data.path }):wait()
    end
  end,
})
vim.pack.add({ { src = 'https://github.com/L3MON4D3/LuaSnip', version = vim.version.range('2.*') } })
local ls = require('luasnip')
ls.setup({ enable_autosnippets = true })
require('luasnip.loaders.from_lua').lazy_load({
  paths = { vim.fn.expand('~/dotfiles/nvim-new/lua/luasnippets/snippets/') },
})
vim.keymap.set('i', '<C-e>', function() ls.expand() end, { silent = true })
vim.keymap.set({ 'i', 's' }, '<C-l>', function() ls.jump(1) end, { silent = true })
vim.keymap.set({ 'i', 's' }, '<C-h>', function() ls.jump(-1) end, { silent = true })

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    vim.o.signcolumn = 'yes:1'
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    if client:supports_method('textDocument/completion') then
      local chars = {}
      for i = 33, 126 do
        local c = string.char(i)
        if not c:match('[%,:%)%]%}]') then table.insert(chars, string.char(i)) end
      end
      client.server_capabilities.completionProvider.triggerCharacters = chars
      vim.o.complete = 'o,.,w,b,u'
      vim.o.completeopt = 'menu,menuone,popup,noinsert,noselect,fuzzy'
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end
  end,
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
  'java',
  'regex',
  'javascript',
  'toml',
  'json',
  'yaml',
  'html',
  'sql',
  'latex',
  'bash',
}

local isnt_installed = function(lang) return #vim.api.nvim_get_runtime_file('parser/' .. lang .. '.*', false) == 0 end
local to_install = vim.tbl_filter(isnt_installed, ensure_languages)
if #to_install > 0 then require('nvim-treesitter').install(to_install) end

local filetypes = vim.iter(ensure_languages):map(vim.treesitter.language.get_filetypes):flatten():totable()
local ts_start = function(ev) vim.treesitter.start(ev.buf) end
vim.api.nvim_create_autocmd('FileType', { pattern = filetypes, callback = ts_start })

-- don't insert -- after hitting 'o'
vim.api.nvim_create_autocmd('FileType', {
  desc = "Proper 'formatoptions'",
  callback = function() vim.cmd('setlocal formatoptions-=c formatoptions-=o') end,
})

local map = vim.keymap.set

-- navigation
map('n', '<leader>pv', vim.cmd.Oil, { silent = true })
map('n', '<leader>fb', '<Cmd>Pick buffers<CR>')
map('n', '<leader>ff', '<Cmd>Pick files<CR>')
map('n', '<leader>fd', '<Cmd>Pick diagnostic scope="all"<CR>')
map('n', '<leader>fD', '<Cmd>Pick diagnostic scope="current"<CR>')
map('n', '<leader>fh', '<Cmd>Pick help<CR>')
map('n', '<leader>fH', '<Cmd>Pick history<CR>')
map('n', '<leader>fg', '<Cmd>Pick grep_live<CR>')
map('n', '<leader>fG', '<Cmd>Pick grep pattern="<cword>"<CR>')

-- format
map('n', '<Leader>lf', '<Cmd>lua require("conform").format({lsp_fallback = true})<CR>')

-- term
map({ 'n' }, '<leader>tt', '<Cmd>ToggleTerm<CR>')

-- buffer
map('n', '<leader>bd', '<Cmd>lua MiniBufremove.delete()<CR>')

-- misc
map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")
map({ 'n', 'v', 'x' }, '<Leader>y', '"+y')
map({ 'n', 'v', 'x' }, '<Leader>d', '"+d')
