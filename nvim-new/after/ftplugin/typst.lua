vim.cmd('setlocal spell')

vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>o', '<Cmd>!typst c --open zathura %<CR>', { silent = true })

-- bekijk dit eens https://github.com/SylvanFranklin/.config/blob/main/nvim/after/ftplugin/typst.lua;
-- ziet er wel cool uit met die TS text objects, misschien handig, alsook snippets terugvinden.
