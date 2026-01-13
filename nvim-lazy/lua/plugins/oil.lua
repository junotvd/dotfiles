return {
  {
    'stevearc/oil.nvim',
    config = function()
      require('oil').setup({
        view_options = {
          show_hidden = true,
        },
        columns = {
          'permissions',
          'size',
        },
      })
      vim.keymap.set('n', '<Leader>pv', vim.cmd.Oil)
    end,
  },
}
