return {
  'saghen/blink.cmp',
  version = '*',
  dependencies = {
    'rafamadriz/friendly-snippets',
    { 'L3MON4D3/LuaSnip', version = 'v2.*' },
  },
  opts = {
    -- snippets = { preset = 'luasnip' },
    snippets = { preset = 'default' },
    sources = {
      default = {'lsp', 'path', 'snippets', 'buffer'}
    },
    keymap = { preset = 'default' },

    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'mono'
    },
    signature = { enabled = true }
  },
}
