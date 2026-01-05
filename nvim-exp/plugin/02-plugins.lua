vim.pack.add({
  { src = 'https://github.com/stevearc/oil.nvim' },
  { src = 'https://github.com/nvim-mini/mini.nvim' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  'https://github.com/mason-org/mason.nvim',
  'https://github.com/mason-org/mason-lspconfig.nvim',
  'https://github.com/lumen-oss/lz.n',
})

local plugins = {
  {
    src = 'https://github.com/L3MON4D3/LuaSnip',
    data = {
      event = 'InsertEnter',
      after = function()
        local ls = require('luasnip')
        ls.setup({ enable_autosnippets = true })
        require('luasnip.loaders.from_lua').lazy_load({
          paths = { vim.fn.expand('~/dotfiles/nvim/snippets/') },
        })
      end,
    },
  },
  {
    src = 'https://github.com/chomosuke/typst-preview.nvim',
    data = {
      ft = 'typst',
    },
  },
  {
    src = 'https://github.com/rose-pine/neovim',
    name = 'rose-pine',
    data = {
      colorscheme = 'rose-pine',
      after = function()
        require('rose-pine').setup({
          styles = {
            italic = false,
            transparency = true,
          },
        })
      end,
    },
  },
  {
    src = 'https://github.com/vague2k/vague.nvim',
    data = {
      colorscheme = 'vague',
      after = function() require('vague').setup({ transparent = true }) end,
    },
  },
  {
    src = 'https://github.com/stevearc/conform.nvim',
    data = {
      event = { 'BufWritePre' },
      cmd = { 'ConformInfo' },
      keys = {
        { '<leader>lf', function() require('conform').format({ async = true }) end },
      },
      after = function()
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
      end,
    },
  },
}
vim.pack.add(plugins, { load = require('lz.n').load })

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

vim.keymap.set('n',  '<leader>f', ':Pick files<CR>')
vim.keymap.set('n','<leader>h', ':Pick help<CR>')
vim.keymap.set('n','<leader>b', ':Pick buffers<CR>')
vim.keymap.set('n','<leader>g', ':Pick grep<CR>')

require('mini.surround').setup()
require('mini.notify').setup()

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

vim.cmd.colorscheme('miniwinter')
vim.cmd(':hi statusline guibg=NONE')
