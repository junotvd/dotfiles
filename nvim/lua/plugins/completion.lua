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

  -- {
  --   "github/copilot.vim",
  -- },

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          hide_during_completion = false,
          debounce = 25,
          keymap = {
            accept = "<Tab>",
            accept_word = false,
            -- accept_line = "<Tab>",
            next = false,
            prev = false,
            dismiss = false,
          },
        },
      })
    end,
  },

}
