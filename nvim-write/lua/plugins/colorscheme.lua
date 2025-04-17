return {

  {
    'shaunsingh/nord.nvim',
    config = function()
      vim.cmd.colorscheme('nord')
    end,
  },

  {
    'adisen99/apprentice.nvim',
    dependencies = { 'rktjmp/lush.nvim' },
  },
}
