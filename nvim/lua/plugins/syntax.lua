return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs',
    opts = {
      ensure_installed = {
        'bash',
        'c',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'latex',
        'matlab',
        'python',
        'typst',
        'vim',
        'vimdoc',
      },
      sync_install = false,
      auto_install = true,
      ignore_install = { 'latex' },
      highlight = {
        enable = true,
        disable = {
          'latex',
          -- 'typst',
        },
        additional_vim_regex_highlighting = { 'markdown' },
      },
      indent = { enable = true },
    },
  },
}
