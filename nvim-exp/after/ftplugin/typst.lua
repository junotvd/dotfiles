vim.bo.makeprg= 'typst compile %'

vim.cmd.packadd('typst-preview')
vim.keymap.set('n', '<leader>p', ':TypstPreview<CR>', { buffer = 0 })
