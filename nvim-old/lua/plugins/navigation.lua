return {

  {
    'stevearc/oil.nvim',
    dependencies = { { 'nvim-mini/mini.icons' } },
    lazy = false,
    config = function()
      require('oil').setup({
        default_file_explorer = true,
        view_options = {
          show_hidden = true,
        },
        columns = { 'permissions', 'size' },
      })
      vim.keymap.set('n', '<leader>pv', vim.cmd.Oil, { desc = 'Open Oil' })
    end,
  },
}
