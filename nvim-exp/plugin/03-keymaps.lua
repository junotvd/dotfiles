local function pack_clean()
  local active_plugins = {}
  local unused_plugins = {}

  for _, plugin in ipairs(vim.pack.get()) do
    active_plugins[plugin.spec.name] = plugin.active
  end

  for _, plugin in ipairs(vim.pack.get()) do
    if not active_plugins[plugin.spec.name] then table.insert(unused_plugins, plugin.spec.name) end
  end

  if #unused_plugins == 0 then
    print('No unused plugins.')
    return
  end

  local choice = vim.fn.confirm('Remove unused plugins?', '&Yes\n&No', 2)
  if choice == 1 then vim.pack.del(unused_plugins) end
end

local map = vim.keymap.set

map('n', '<leader>o', '<Cmd>update<CR> <Cmd>source<CR>')
map('n', '<leader>O', '<Cmd>source $MYVIMRC<CR>')

map({ 'n', 'v', 'x' }, '<leader>y', '"+y')
map({ 'n', 'v', 'x' }, '<leader>d', '"+d')

map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")

map('n', '<leader>pv', vim.cmd.Oil)

-- map('n', '<leader>lf', require('conform').format)

map({ 'n', 'v', 'x' }, '<leader>s', ':e #<CR>')
map({ 'n', 'v', 'x' }, '<leader>S', ':sf #<CR>')
map({ 'n', 'v', 'x' }, '<leader>v', ':e $MYVIMRC<CR>')
map('n', '<leader>r', ':update<CR> :make<CR>')

map('n', '<C-q>', ':copen<CR>', { silent = true })

map('n', '<leader>t', '<Cmd>tabnew<CR>')
map('n', '<leader>x', '<Cmd>tabclose<CR>')
for i = 1, 9 do
  map('n', '<leader>' .. i, '<Cmd>tabnext ' .. i .. '<CR>', { noremap = true, silent = true })
end

map('n', '<leader>pc', pack_clean)
map('n', '<leader>pu', '<cmd>lua vim.pack.update()<CR>')
