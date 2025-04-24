return {

  {
    'MeanderingProgrammer/render-markdown.nvim',
    opts = {
      pipe_table = {
        enabled = false,
      },
    },
  },

  {
    'toppair/peek.nvim',
    event = { 'VeryLazy' },
    build = 'deno task --quiet build:fast',
    opts = {
      app = 'browser',
    },
  },
}
