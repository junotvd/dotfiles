return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          'bash',
          'c',
          'lua',
          'markdown',
          'markdown_inline',
          'latex',
          'matlab',
          'python',
          'typst',
          'vimdoc',
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
            'latex',
          },
          additional_vim_regex_highlighting = { 'markdown' },
        },
        modules = {},
      })
      local treesitter_parser_config = require('nvim-treesitter.parsers').get_parser_configs()
      treesitter_parser_config.templ = {
        install_info = {
          url = 'https://github.com/vrischmann/tree-sitter-templ.git',
          files = { 'src/parser.c', 'src/scanner.c' },
          branch = 'master',
        },
      }

      vim.treesitter.language.register('templ', 'templ')
    end,
  },
}
