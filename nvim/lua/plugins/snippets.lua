return {

  {
    'L3MON4D3/LuaSnip',
    version = 'v2.*',
    build = 'make install_jsregexp',
    dependencies = {},
    config = function()
      require('luasnip').config.set_config({
        history = true,
        enable_autosnippets = true,
        -- require('luasnip.loaders.from_lua').load({ paths = '~/.config/nvim/lua/snippets/' }),
      })
    end,
  },

  {
    dir = '~/repos/luasnip-latex-snippets.nvim',
    -- vimtex isn't required if using treesitter
    dependencies = { 'L3MON4D3/LuaSnip', 'lervag/vimtex' },
    config = function()
      require('luasnip-latex-snippets').setup({
        -- or setup({ use_treesitter = true })
        allow_on_markdown = true,
      })
    end,
  },
}
