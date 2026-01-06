return {

  {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = 'markdown',
    opts = {
      pipe_table = {
        enabled = false,
      },
    },
  },

  {
    'toppair/peek.nvim',
    ft = 'markdown',
    build = 'deno task --quiet build:fast',
    opts = {
      app = 'browser',
    },
  },
}
