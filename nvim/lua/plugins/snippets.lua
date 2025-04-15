return {

  {
    'L3MON4D3/LuaSnip',
    dependencies = {},
    version = 'v2.*',
    config = function()
      require('luasnip').config.set_config({
        history = true,
        enable_autosnippets = true,
        -- require('luasnip.loaders.from_lua').load({ paths = '~/.config/nvim/lua/snippets/' }),
      })
    end,
  },

  {
    -- url = 'https://gitlab.com/repetitivesin/madol.nvim.git',
    dir = '~/repos/madol.nvim/',
    dependencies = {
      'L3M0N4D3/LuaSnip',
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      local ls = require('luasnip')
      ls.config.setup({
        enable_autosnippets = true,
        store_selection_keys = '<Tab>',
      })

      vim.keymap.set({ 's', 'i' }, 'C-j', function()
        if ls.choice_active() then
          ls.change_choice(1)
        else
          return '<C-j>'
        end
      end, { silent = true })
      vim.keymap.set({ 's', 'i' }, '<C-k>', function()
        if ls.choice_active() then
          ls.change_choice(-1)
        else
          return '<C-k>'
        end
      end, { silent = true })
      vim.keymap.set({ 'i', 's' }, '<Tab>', function()
        ls.jump(1)
      end, { silent = true })
      vim.keymap.set({ 'i', 's' }, '<S-Tab>', function()
        ls.jump(-1)
      end, { silent = true })

      require('madol').setup()
    end,
  },
}
