local typst_watch = require('typst').watch
vim.keymap.set('n', '<leader>ll', typst_watch)
-- vim.keymap.set('n', '<leader>lc', ':!typst compile --font-path ~/fonts/cmbright/fonts/ %<CR>')
vim.keymap.set('n', '<leader>lc', ':!typst compile %<CR>')

-- local export_picker = require('export').export_picker
-- vim.keymap.set('n', '<leader>le', export_picker)
