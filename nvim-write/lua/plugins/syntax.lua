return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          'markdown',
          'latex',
          'markdown_inline',
          'typst',
        },
        sync_install = false,
        auto_install = true,
        ignore_install = {
          -- "latex"
        },
        indent = {
          enable = true,
        },
        highlight = {
          enable = true,
          disable = {
            -- "latex"
          },
          additional_vim_regex_highlighting = { 'markdown' },
        },
      })
    end,
  },
}
