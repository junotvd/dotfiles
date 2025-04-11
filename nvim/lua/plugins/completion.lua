return {

  {
    'saghen/blink.cmp',
    version = '*',
    dependencies = {
      -- 'rafamadriz/friendly-snippets',
      {
        'L3MON4D3/LuaSnip',
        version = 'v2.*',
        config = function()
          require("luasnip").config.set_config({
            history = true,
            enable_autosnippets = true,
            require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets/" }),
          })
        end
      },
    },
    opts = {
      snippets = { preset = 'luasnip' },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' }
      },

      keymap = {
        ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
        ['<C-e>'] = { 'hide' },
        ['<C-y>'] = { 'select_and_accept' },

        ['<Up>'] = { 'select_prev', 'fallback' },
        ['<Down>'] = { 'select_next', 'fallback' },
        ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
        ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },

        ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

        ['<Tab>'] = { 'snippet_forward', 'fallback' },
        ['<S-Tab>'] = { 'snippet_backward', 'fallback' },

        ['<C-K>'] = { 'show_signature', 'hide_signature', 'fallback' },
      },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
      },
      signature = { enabled = true }
    },
  },

}
