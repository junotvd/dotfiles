return {
  {
    'nvim-mini/mini.nvim',
    config = function()
      require('mini.surround').setup()
      require('mini.files').setup()
    end,
  },

  {
    'barrett-ruth/live-server.nvim',
    build = 'pnpm add -g live-server',
    cmd = { 'LiveServerStart', 'LiveServerStop' },
    config = true,
  },
}
