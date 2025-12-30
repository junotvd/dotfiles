vim.bo.makeprg= 'typst compile %'

vim.keymap.set('n', '<leader>p', ':TypstPreview<CR>', { buffer = 0 })
