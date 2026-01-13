return {
  {
    'L3MON4D3/LuaSnip',
    version = 'v2.*',
    build = 'make install_jsregexp',
    config = function()
      local ls = require('luasnip')
			ls.setup({ enable_autosnippets = true })
			vim.keymap.set('i', '<C-e>', function() ls.expand() end, { silent = true })
			vim.keymap.set({ 'i', 's' }, '<C-j>', function() ls.jump(1) end, { silent = true })
			vim.keymap.set({ 'i', 's' }, '<C-k>', function() ls.jump(-1) end, { silent = true })
      require('luasnip.loaders.from_lua').load({
        paths = { vim.fn.expand('~/dotfiles/nvim-lazy/lua/snippets') },
      })
    end,
  },
}
