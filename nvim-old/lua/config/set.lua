-- stylua: ignore start
local opt = vim.opt

opt.guicursor      = ''
opt.undofile       = true
opt.number         = true
opt.relativenumber = true
opt.tabstop        = 2
opt.softtabstop    = 2
opt.shiftwidth     = 2
opt.expandtab      = true
opt.smartindent    = true
opt.ignorecase     = true
opt.smartcase      = true
opt.incsearch      = true
opt.scrolloff      = 20
opt.spell          = true
opt.spelllang      = { 'nl', 'en_gb' }
opt.signcolumn     = 'yes'
opt.inccommand     = 'split'

opt.formatoptions:remove({ 'o', 'O' })

-- stylua: ignore stop

      vim.diagnostic.config({
        severity_sort = true,
        float = {
          border = 'rounded',
          source = 'if_many',
          wrap = true,
          max_width = 80,
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
