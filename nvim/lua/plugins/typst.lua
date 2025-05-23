return {

  {
    'kaarmu/typst.vim',
    ft = 'typst',
    lazy = false,
    config = function()
      vim.g.typst_conceal = 1
      -- vim.g.typst_conceal_math = 1
    end,
  },

  {
    'chomosuke/typst-preview.nvim',
    lazy = false,
    version = '1.*',
    opts = {},
  },
}
