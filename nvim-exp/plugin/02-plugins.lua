vim.pack.add({
  { src = 'https://github.com/rose-pine/neovim', name = 'rose-pine' },
  { src = 'https://github.com/vague2k/vague.nvim' },
  { src = 'https://github.com/stevearc/oil.nvim' },
  { src = 'https://github.com/nvim-mini/mini.nvim' },
  { src = 'https://github.com/chomosuke/typst-preview.nvim' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
  -- { src = 'https://github.com/L3MON4D3/LuaSnip' },

  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = 'https://github.com/mason-org/mason.nvim' },
  { src = 'https://github.com/mason-org/mason-lspconfig.nvim' },
  { src = 'https://github.com/stevearc/conform.nvim' },
})

-- vim.pack.add({ 'https://github.com/lumen-oss/lz.n' })
-- local plugins = {
--   {
--     src = 'https://github.com/L3MON4D3/LuaSnip',
-- 		ft = 'typst',
--     after = function()
--       local ls = require('luasnip')
--       ls.setup({ enable_autosnippets = true })
--     end,
--   },
-- }
-- vim.pack.add(plugins, { load = require('lz.n').load })

require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = {
    'lua_ls',
    'stylua',
    'tinymist',
    'basedpyright',
    'ruff',
    'bashls',
    'vtsls',
  },
})

vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT', path = vim.split(package.path, ';') },
      workspace = { library = { vim.env.VIMRUNTIME }, ignoreSubmodules = true },
    },
  },
})

vim.diagnostic.config({
  virtual_text = {
    current_line = true,
    source = 'if_many',
  },
  severity_sort = true,
  update_in_insert = false,
})

local formatters_by_ft = {
  lua = { 'stylua' },
  sh = { 'shfmt' },
  python = { 'ruff_format' },
  javascript = { 'biome' },
  c = { 'clang-format' },
  cpp = { 'clang-format' },
  typst = { 'typstyle' },
}
local prettier_fts = {
  'typescript',
  'css',
  'html',
  'markdown',
  'yaml',
  'toml',
  'json',
}
for _, ft in ipairs(prettier_fts) do
  formatters_by_ft[ft] = { 'prettier' }
end
require('conform').setup({
  lsp_format = 'fallback',
  formatters_by_ft = formatters_by_ft,
})

local mini_clue = require('mini.clue')
mini_clue.setup({
  triggers = {
    { mode = 'n', keys = '[' },
    { mode = 'n', keys = ']' },
    { mode = 'n', keys = '<leader>' },
    { mode = 'n', keys = '<C-w>' },
    { mode = 'n', keys = '<C-x>' },
  },
  clues = {
    mini_clue.gen_clues.g(),
    mini_clue.gen_clues.z(),
    mini_clue.gen_clues.windows(),
    mini_clue.gen_clues.builtin_completion(),
  },
})
require('mini.pick').setup({
  window = {
    config = function()
      local height = math.floor(0.618 * vim.o.lines)
      local width = math.floor(0.618 * vim.o.columns)
      return {
        anchor = 'NW',
        height = height,
        width = width,
        row = math.floor(0.5 * (vim.o.lines - height)),
        col = math.floor(0.5 * (vim.o.columns - width)),
      }
    end,
  },
})
require('mini.surround').setup()
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

-- local ls = require('luasnip')
-- ls.setup({ enable_autosnippets = true })
-- require('luasnip.loaders.from_lua').lazy_load({
--   paths = { vim.fn.expand('~/dotfiles/nvim/snippets/') },
-- })

-- require('rose-pine').setup({
--   styles = {
--     italic = false,
--     transparency = true,
--   },
-- })
-- require('vague').setup({ transparent = true })
vim.cmd.colorscheme('miniwinter')
vim.cmd(':hi statusline guibg=NONE')
