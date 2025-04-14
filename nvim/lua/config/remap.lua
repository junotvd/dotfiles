vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('x', '<C-c>', '<Esc>')
vim.keymap.set('n', '<C-c>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>pv', vim.cmd.Oil, { desc = 'Open Oil' })

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selected line up' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selected line down' })

vim.keymap.set('v', '<leader>y', '"+y', { desc = 'Yank to system clipboard' })

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic quickfix list' })
vim.keymap.set('n', '<leader>cn', '<cmd>cnext<CR>', { desc = 'next quickfix ' })
vim.keymap.set('n', '<leader>cp', '<cmd>cprev<CR>', { desc = 'previous quickfix ' })
