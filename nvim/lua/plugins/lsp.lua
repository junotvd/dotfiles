return {

  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim', opts = {}, version = '1.9' },
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      'saghen/blink.cmp',
      'folke/lazydev.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
    },

    config = function()
      vim.diagnostic.config({
        severity_sort = true,
        float = {
          border = 'rounded',
          source = 'if_many',
        },
        underline = { severity = vim.diagnostic.severity.ERROR },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = 'E',
            [vim.diagnostic.severity.WARN] = 'W',
            [vim.diagnostic.severity.INFO] = 'I',
            [vim.diagnostic.severity.HINT] = 'H',
          },
        },
        virtual_text = {
          source = 'if_many',
          spacing = 2,
          format = function(diagnostic)
            local diagnostic_message = {
              [vim.diagnostic.severity.ERROR] = diagnostic.message,
              [vim.diagnostic.severity.WARN] = diagnostic.message,
              [vim.diagnostic.severity.INFO] = diagnostic.message,
              [vim.diagnostic.severity.HINT] = diagnostic.message,
            }
            return diagnostic_message[diagnostic.severity]
          end,
        },
      })

      local capabilities = require('blink.cmp').get_lsp_capabilities()
      local servers = {
        lua_ls = {
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
              diagnostics = { disable = { 'missing-fields' } },
            },
          },
        },
        pyright = {},
        bashls = {},
        digestif = {},
        texlab = {},
        ['nil'] = {},
        tinymist = {},
        hls = {},
        matlab_ls = {},
      }

      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'stylua',

        'pyright',
        'ruff',

        'shfmt',

        'latexindent',
        'bibtex-tidy',

        'nixfmt',

        'prettier',
        'vale',
        'yamllint',

        'typstyle',

        'fourmolu',
        'hlint',

        'matlab-language-server',
      })
      require('mason-tool-installer').setup({ ensure_installed = ensure_installed })

      require('mason-lspconfig').setup({
        ensure_installed = {},
        automatic_installation = false,
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      })
      -- require('lspconfig').digestif.setup({capabilities = capabilities })
      -- vim.lsp.enable('hls')
      require('lspconfig').r_language_server.setup({ capabilities = capabilities })
    end,
  },

  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format({ async = true, lsp_format = 'fallback' })
        end,
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
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require('lint').linters_by_ft = {
        -- lua = { 'luacheck' },
        tex = { 'chktex' },
        python = { 'ruff' },
        markdown = { 'vale' },
        yaml = { 'yamllint' },
        haskell = { 'hlint' },
        nix = { 'statix' },
      }

      vim.api.nvim_create_autocmd({ 'BufWritePost', 'BufEnter', 'InsertLeave' }, {
        callback = function()
          local ft = vim.bo.filetype
          if require('lint').linters_by_ft[ft] then
            require('lint').try_lint()
          end
        end,
      })
    end,
  },
}
