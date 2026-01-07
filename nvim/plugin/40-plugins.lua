local add = vim.pack.add
local now, later = MiniDeps.now, MiniDeps.later
local now_if_args = _G.Config.now_if_args

now_if_args(function()
  local ts_update = function() vim.cmd('TSUpdate') end
  _G.Config.on_packchanged('nvim-treesitter', { 'update' }, ts_update, 'Update trees-itter parsers')
  add({
    'https://github.com/nvim-treesitter/nvim-treesitter',
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects', version = 'main' },
  })
  -- stylua: ignore
  local ensure_languages = {
    'bash', 'c', 'cpp', 'css', 'diff', 'go',
    'html', 'javascript', 'json', 'python',
    'regex', 'rust', 'toml', 'typescript', 'yaml',
    'typst', 'vimdoc'
  }
  local isnt_installed = function(lang) return #vim.api.nvim_get_runtime_file('parser/' .. lang .. '.*', false) == 0 end
  local to_install = vim.tbl_filter(isnt_installed, ensure_languages)
  if #to_install > 0 then require('nvim-treesitter').install(to_install) end

  local filetypes = vim.iter(ensure_languages):map(vim.treesitter.language.get_filetypes):flatten():totable()
  local ts_start = function(ev) vim.treesitter.start(ev.buf) end
  _G.Config.new_autocmd('FileType', filetypes, ts_start, 'Ensure enabled tree-sitter')
end)

now_if_args(function()
  add({ 'https://github.com/stevearc/oil.nvim' })
  require('oil').setup({
    view_options = { show_hidden = true },
    default_file_explorer = true,
    columns = {
      'permissions', 'size',
    },
  })
  vim.keymap.set('n', '<leader>pv', vim.cmd.Oil)
end)

later(function()
  add({ 'https://github.com/chomosuke/typst-preview.nvim' })
  require('typst-preview').setup()
end)

later(function()
  add({ 'https://github.com/mason-org/mason.nvim' })
  require('mason').setup()
end)

later(function()
  add({ 'https://github.com/stevearc/conform.nvim' })
  require('conform').setup({
    formatters_by_ft = {
      javascript = { 'prettier' },
      json = { 'prettier' },
      lua = { 'stylua' },
      python = { 'black' },
      typst = { 'typstyle' },
    },
  })
end)

later(function()
  add({ 'https://github.com/neovim/nvim-lspconfig' })
  vim.lsp.enable({
    'lua_ls',
    'html',
    'cssls',
    'bashls',
    'nil',
    'clangd',
    'lua_ls',
    'basedpyright',
    'ts_ls',
    'tinymist',
  })
end)

-- Better built-in terminal ===================================================
later(function()
  add({ 'https://github.com/kassio/neoterm' })

  -- Enable bracketed paste
  vim.g.neoterm_bracketed_paste = 1

  -- Default python REPL
  vim.g.neoterm_repl_python = 'ipython'

  -- Default R REPL
  vim.g.neoterm_repl_r = 'radian'

  -- Don't add extra call to REPL when sending
  vim.g.neoterm_direct_open_repl = 1

  -- Open terminal to the right by default
  vim.g.neoterm_default_mod = 'vertical'

  -- Go into insert mode when terminal is opened
  vim.g.neoterm_autoinsert = 1

  -- Scroll to recent command when it is executed
  vim.g.neoterm_autoscroll = 1

  -- Don't automap keys
  pcall(vim.keymap.del, 'n', ',tt')

  -- Change default shell to zsh (if it is installed)
  vim.g.neoterm_shell = vim.fn.executable('nu') == 1 and 'nu' or (vim.fn.executable('zsh') == 1 and 'zsh' or 'bash')
end)

-- Filetype: markdown =========================================================
later(function()
  local build = function() vim.fn['mkdp#util#install']() end
  _G.Config.on_packchanged('markdown-preview.nvim', { 'install', 'update' }, build, 'Build markdown-preview')
  add({ 'https://github.com/iamcco/markdown-preview.nvim' })

  -- Do not close the preview tab when switching to other buffers
  vim.g.mkdp_auto_close = 0
end)

later(function()
  local build = function(args)
    vim.system({ 'make', 'install_jsregexp' }, { cwd = args.path })
  end
  MiniDeps.add({
    source = 'https://github.com/L3MON4D3/LuaSnip',
    hooks = { post_install = build, post_checkout = build },
  })
  local ls = require('luasnip')
  ls.setup({ enable_autosnippets = true })
  require('luasnip.loaders.from_lua').lazy_load({
    paths = { vim.fn.expand('~/dotfiles/nvim-old/lua/luasnippets/snippets/') },
  })
  vim.keymap.set('i', '<C-e>', function() ls.expand() end, { silent = true })
  vim.keymap.set({ 'i', 's' }, '<C-j>', function() ls.jump(1) end, { silent = true })
  vim.keymap.set({ 'i', 's' }, '<C-k>', function() ls.jump(-1) end, { silent = true })
end)
