vim.cmd('setlocal spell')

local map = vim.keymap.set
map('n', '<Leader>c', '<Cmd>!typst c %<CR>', { buffer = true, silent = true })
map('n', '<Leader>O', '<Cmd>!typst c --open zathura %<CR>', { buffer = true, silent = true })
map('n', '<leader>o', function()
  local pdf = vim.fn.expand('%:r') .. '.pdf'
  vim.fn.jobstart({ 'xdg-open', pdf }, { detach = true })
end, { buffer = true })
local watch_job = nil
map('n', '<leader>w', function()
  if watch_job then
    vim.fn.jobstop(watch_job)
    watch_job = nil
    vim.notify('Stopped typst watch')
  else
    watch_job = vim.fn.jobstart({ 'typst', 'watch', vim.fn.expand('%s') })
    vim.notify('Started typst watch')
  end
end, { buffer = true })
map('n', '<leader>v', '<Cmd>TypstPreviewToggle<CR>', { buffer = true, silent = true })

-- bekijk dit eens https://github.com/SylvanFranklin/.config/blob/main/nvim/after/ftplugin/typst.lua;
-- ziet er wel cool uit met die TS text objects, misschien handig, alsook snippets terugvinden.
