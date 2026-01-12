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
      'permissions',
      'size',
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
      html = { 'prettier' },
      css = { 'prettier' },
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
    'emmet_ls',
    -- 'emmet_language_server',
  })

  -- local completion = function(args)
  --   local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
  --   -- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
  --   if client:supports_method('textDocument/completion') then
  --     -- Optional: trigger autocompletion on EVERY keypress. May be slow!
  --     local chars = {}
  --     for i = 32, 126 do
  --       table.insert(chars, string.char(i))
  --     end
  --     client.server_capabilities.completionProvider.triggerCharacters = chars
  --
  --     vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
  --   end
  -- end
  -- _G.Config.new_autocmd('LspAttach', '*', completion, 'Auto completion')
end)
later(function()
  -- Don't show 'Text' suggestions
  local process_items_opts = { kind_priority = { Text = -1, Snippet = 99 } }
  local process_items = function(items, base)
    return MiniCompletion.default_process_items(items, base, process_items_opts)
  end
  require('mini.completion').setup({
    lsp_completion = { source_func = 'omnifunc', auto_setup = false, process_items = process_items },
  })

  -- Set up LSP part of completion
  local on_attach = function(args) vim.bo[args.buf].omnifunc = 'v:lua.MiniCompletion.completefunc_lsp' end
  _G.Config.new_autocmd('LspAttach', '*', on_attach, 'Custom `on_attach`')
  if vim.fn.has('nvim-0.11') == 1 then vim.lsp.config('*', { capabilities = MiniCompletion.get_lsp_capabilities() }) end
end)

-- Terminal
later(function()
  add({ 'https://github.com/akinsho/toggleterm.nvim' })
  require('toggleterm').setup()
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
  local build = function(args) vim.system({ 'make', 'install_jsregexp' }, { cwd = args.path }) end
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
