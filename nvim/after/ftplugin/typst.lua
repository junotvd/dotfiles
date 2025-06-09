local typst_watch = require('typst').watch
vim.keymap.set('n', '<leader>ll', typst_watch)
-- vim.keymap.set('n', '<leader>lc', ':!typst compile --font-path ~/fonts/cmbright/fonts/ %<CR>')
vim.keymap.set('n', '<leader>lc', ':!typst compile %<CR>')
