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

      keymap = { preset = 'default' },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
      },
      signature = { enabled = true }
    },
  },

}
