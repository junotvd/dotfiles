vim.cmd('setlocal spell')

vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>o', ':!typst c --open zathura %<CR>', { silent = true })
