return {

  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },

    config = function()
      local harpoon = require('harpoon')
      harpoon:setup()
      vim.keymap.set('n', '<leader>a', function()
        harpoon:list():add()
      end)
      vim.keymap.set('n', '<C-e>', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end)
      vim.keymap.set('n', '<C-p>', function()
        harpoon:list():prev()
      end)
      vim.keymap.set('n', '<C-n>', function()
        harpoon:list():next()
      end)
      vim.keymap.set('n', '<leader>1', function()
        harpoon:list():select(1)
      end)
      vim.keymap.set('n', '<leader>2', function()
        harpoon:list():select(2)
      end)
      vim.keymap.set('n', '<leader>3', function()
        harpoon:list():select(3)
      end)
      vim.keymap.set('n', '<leader>4', function()
        harpoon:list():select(4)
      end)
    end,
  },

  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      { 'nvim-tree/nvim-web-devicons', enabled = true },
    },
    config = function()
      require('telescope').setup({
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown({}),
          },
        },
      })

      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>sf', builtin.find_files, {})
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>sb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, {})
      vim.keymap.set('n', '<leader>/', function()
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
          previewer = false,
        }))
      end)
      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep({
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        })
      end)
    end,
  },

  {
    'stevearc/oil.nvim',
    dependencies = { { 'nvim-tree/nvim-web-devicons', opts = {} } },
    lazy = false,
    config = function()
      require('oil').setup({
        default_file_explorer = true,
        view_options = {
          show_hidden = true,
        },
      })
      vim.keymap.set('n', '<leader>pv', vim.cmd.Oil, { desc = 'Open Oil' })
    end,
  },
}
