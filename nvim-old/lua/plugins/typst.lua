return {

  {
    'kaarmu/typst.vim',
    ft = 'typst',
    lazy = false,
    config = function()
      -- vim.g.typst_syntax_highlight = 1
      vim.g.typst_conceal = 0
      vim.g.pdf = 'zathura'
    end,
  },

  {
    'chomosuke/typst-preview.nvim',
    lazy = false,
    version = '1.*',
    opts = {},
  },
}
