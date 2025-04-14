return {

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim", opts = {} },
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      "saghen/blink.cmp",
      "folke/lazydev.nvim",
      { "j-hui/fidget.nvim", opts = {} },
    },

    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      local servers = {
        lua_ls = {
          settings = {
            Lua = {
              completion = {
                callSnippet = "Replace",
              },
              diagnostics = { disable = { "missing-fields" } },
            },
          },
        },
      }

      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        "stylua",
      })
      require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
      require("mason-lspconfig").setup({
        ensure_installed = { "pyright", "tinymist", "texlab", "bashls" },
        automatic_installation = false,
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend("force", {}, server.capabilities or {})
            require("lspconfig")[server_name].setup(server)
          end
        },
      })
    end,
  },

  {
    "stevearc/conform.nvim",
    opts = {},
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },
          tex = { "tex-fmt" },
        },
      })
    end,
  },

  {
    "saghen/blink.cmp",
    version = "*",
    dependencies = {
      -- 'rafamadriz/friendly-snippets',
      {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        config = function()
          require("luasnip").config.set_config({
            history = true,
            enable_autosnippets = true,
            require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets/" }),
          })
        end,
      },
    },
    opts = {
      sources = {
        default = { "lsp", "path", "snippets", "buffer", "lazydev" },
        providers = {
          lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
        },
      },
      snippets = { preset = "luasnip" },
      keymap = { preset = "default" },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
      },
      signature = { enabled = true },
    },
  },

  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },

}
