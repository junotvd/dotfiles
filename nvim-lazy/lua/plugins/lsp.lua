return {
  {
    'neovim/nvim-lspconfig',
  },
  {
    'mason-org/mason.nvim',
    opts = {},
  },
  {
    'stevearc/conform.nvim',
    config = function()
      require('conform').setup({
        formatters_by_ft = {
          lua = { 'stylua' },
        },
      })
      vim.keymap.set('n', '<Leader>lf', '<Cmd>lua require("conform").format({lsp_fallback = true})<CR>')
    end,
  },
  {
    'j-hui/fidget.nvim',
    opts = {},
  },
}
