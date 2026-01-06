return {

  {
    'neovim/nvim-lspconfig',
    config = function()
      require('mason').setup()
      vim.lsp.enable({
        'lua_ls',
      })
    end,
  },
  { 'mason-org/mason.nvim', cmd = 'Mason' },
  { 'j-hui/fidget.nvim', opts = { 'BufWritePre' } },

  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>lf',
        function() require('conform').format({ async = true, lsp_format = 'fallback' }) end,
        mode = '',
        desc = 'Format buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        local disable_filetypes = { c = true, cpp = true }
        if disable_filetypes[vim.bo[bufnr].filetype] then
          return nil
        else
          return {
            timeout_ms = 500,
            lsp_format = 'fallback',
          }
        end
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'ruff' },
        tex = { 'latexindent' },
        bib = { 'bibtex-tidy' },
        markdown = { 'prettier' },
        yaml = { 'prettier' },
        html = { 'prettier' },
        sh = { 'shfmt' },
        nix = { 'nixfmt' },
        typst = { 'typstyle' },
        haskell = { 'fourmolu' },
        json = { 'prettier' },
        jsonc = { 'prettier' },
        toml = { 'prettier' },
        css = { 'prettier' },
        javascript = { 'prettier' },
      },
    },
  },

  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
        { path = vim.fn.stdpath('config') .. '/lua/snippets/' },
      },
    },
  },

  {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre' },
    config = function()
      require('lint').linters_by_ft = {
        -- lua = { 'luacheck' },
        tex = { 'chktex' },
        python = { 'ruff' },
        markdown = { 'vale' },
        yaml = { 'yamllint' },
        haskell = { 'hlint' },
        nix = { 'statix' },
        html = { 'markuplint' },
      }

      vim.api.nvim_create_autocmd({ 'BufWritePost', 'BufEnter', 'InsertLeave' }, {
        callback = function()
          local ft = vim.bo.filetype
          if require('lint').linters_by_ft[ft] then require('lint').try_lint() end
        end,
      })
    end,
  },
}
