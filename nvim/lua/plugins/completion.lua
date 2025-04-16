return {
  {
    'saghen/blink.cmp',
    version = '*',
    dependencies = {
      -- 'rafamadriz/friendly-snippets',
      'folke/lazydev.nvim',
      'L3MON4D3/LuaSnip',
    },
    opts = {
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer', 'lazydev' },
        providers = {
          lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
        },
      },
      snippets = { preset = 'luasnip' },
      keymap = { preset = 'default' },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono',
      },
      signature = { enabled = true },
    },
  },
}
