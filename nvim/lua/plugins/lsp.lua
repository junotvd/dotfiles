return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "saghen/blink.cmp",
    {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = {
        library = {
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
  },
  config = function()

    local lspconfig = require("lspconfig")
    local capabilities = require('blink.cmp').get_lsp_capabilities()

    local function default_on_attach(client, bufnr)
      local opts = { buffer = bufnr, noremap = true, silent = true, desc = "LSP: Rename" }
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    end

    local setup_servers = function(servers)
      for _, server in ipairs(servers) do
        local server_name
        local opts = {
          capabilities = capabilities,
          on_attach = default_on_attach,
        }
        if type(server) == "string" then
          server_name = server
        elseif type(server) == "table" then
          server_name = server.name
          for key, value in pairs(server) do
            if key ~= "name" then
              opts[key] = value
            end
          end
        end

        lspconfig[server_name].setup(opts)
      end
    end

    local servers = {
      "lua_ls",
      "texlab",
      "pyright",
      "bashls",
      {
        name = "tinymist",
        settings = {
          formatterMode = "typstyle"
        },
      },
    }

    setup_servers(servers)

    vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end)

  end

}
