return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'saghen/blink.cmp',
    {
      'folke/lazydev.nvim',
      ft = 'lua',
      opts = {
        library = {
          { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
        },
      },
    },
  },
  config = function()
    local lspconfig = require('lspconfig')
    local capabilities = require('blink.cmp').get_lsp_capabilities()
    local setup_servers = function(servers)
      for _, server in ipairs(servers) do
        lspconfig[server].setup({
          capabilities = capabilities,
        })
      end
    end

    local servers = {
      -- "texlab",
      'digestif',
      'tinymist',
    }

    setup_servers(servers)
  end,
}
