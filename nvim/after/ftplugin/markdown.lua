local function TogglePeak()
  local peek = require('peek')
  if peek.is_open() then
    peek.close()
  else
    peek.open()
  end
end

vim.keymap.set('n', '<leader>ll', TogglePeak, { desc = 'Toggle Peek', buffer = true })
