return {

  {
    'L3MON4D3/LuaSnip',
    version = 'v2.*',
    build = 'make install_jsregexp',
    config = function()
      require('luasnip.loaders.from_lua').lazy_load({
        paths = '~/.config/nvim/lua/luasnippets/snippets/',
      })

      local ls = require('luasnip')
      vim.keymap.set({ 'i' }, '<Tab>', function()
        ls.expand()
      end, { silent = true })
      vim.keymap.set({ 'i', 's' }, '<Tab>', function()
        ls.jump(1)
      end, { silent = true })
      vim.keymap.set({ 'i', 's' }, '<S-Tab>', function()
        ls.jump(-1)
      end, { silent = true })

      vim.keymap.set({ 'i', 's' }, '<C-E>', function()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end, { silent = true })

      ls.config.set_config({
        history = true,
        enable_autosnippets = true,
        store_selection_keys = '<Tab>',
      })
    end,
  },

  -- {
  --   dir = '~/repos/luasnip-latex-snippets.nvim',
  --   -- vimtex isn't required if using treesitter
  --   dependencies = { 'L3MON4D3/LuaSnip', 'lervag/vimtex' },
  --   config = function()
  --     require('luasnip-latex-snippets').setup({
  --       -- or setup({ use_treesitter = true })
  --       allow_on_markdown = true,
  --     })
  --   end,
  -- },
}
