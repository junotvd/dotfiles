local M = {}

local function on_err(_, data, _)
  local items = {}
  for _, line in ipairs(data) do
    local fn, lnum, col, msg = line:match('^([^:]+):(%d+):(%d+):%s*(.+)$')
    if fn then
      table.insert(items, {
        filename = fn,
        lnum = tonumber(lnum),
        col = tonumber(col),
        text = msg,
      })
    end
  end

  vim.fn.setqflist({}, 'r', {
    title = 'Typst Diagnostics',
    items = items,
  })

  if vim.g.typst_auto_open_quickfix then
    if #items == 0 then
      vim.cmd('cclose')
    else
      vim.cmd('copen')
      vim.cmd('wincmd p')
    end
  end
end

function M.watch(...)
  local buf = vim.api.nvim_get_current_buf()
  local b = vim.b

  if b.typst_watcher then
    vim.fn.jobstop(b.typst_watcher)
    b.typst_watcher = nil
    -- b.typst_viewer_opened = false
    vim.notify('Stopped Typst watch', vim.log.levels.INFO)
    return
  end

  local args = { ... }
  local cmd = {}
  local base = vim.g.typst_cmd or 'typst'
  table.insert(cmd, base)
  table.insert(cmd, 'watch')
  vim.list_extend(cmd, args)
  table.insert(cmd, '--diagnostic-format')
  table.insert(cmd, 'short')
  table.insert(cmd, vim.fn.expand('%:p'))

  if not b.typst_viewer_opened then
    table.insert(cmd, '--open')
    if vim.g.typst_pdf_viewer and #vim.g.typst_pdf_viewer > 0 then
      table.insert(cmd, vim.g.typst_pdf_viewer)
    end
    b.typst_viewer_opened = true
  end

  b.typst_watcher = vim.fn.jobstart(cmd, {
    on_stderr = on_err,
  })

  vim.notify('Started Typst watch: ' .. table.concat(cmd, ' '), vim.log.levels.INFO)
end

vim.api.nvim_create_user_command('TypstWatch', function(opts)
  M.watch(unpack(opts.fargs))
end, {
  nargs = '*',
  complete = function()
    return { '--release', '--example=foo' }
  end,
})

return M
