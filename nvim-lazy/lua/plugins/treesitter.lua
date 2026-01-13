return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  build = ':TSUpdate',
  config = function()
    local ensure_languages = {
      'lua',
      'python',
      'typst',
      'markdown',
      'markdown_inline',
    }
    local isnt_installed = function(lang) return #vim.api.nvim_get_runtime_file('parser/' .. lang .. '.*', false) == 0 end
    local to_install = vim.tbl_filter(isnt_installed, ensure_languages)
    if #to_install > 0 then require('nvim-treesitter').install(to_install) end

    local filetypes = vim.iter(ensure_languages):map(vim.treesitter.language.get_filetypes):flatten():totable()
    local ts_start = function(ev) vim.treesitter.start(ev.buf) end
    vim.api.nvim_create_autocmd('FileType', { pattern = filetypes, callback = ts_start })
  end,
}
