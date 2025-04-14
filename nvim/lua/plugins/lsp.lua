return {

  {
    "neovim/nvim-lspconfig",
    dependencies = {

      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },

      { "j-hui/fidget.nvim", opts = {} },

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

    },
    opts = {
      servers = {
        lua_ls = {},
        texlab = {},
        pyright = {},
        bashls = {},
        tinymist = {
          settings = {
            formatterMode = "typstyle",
          },
        },
      },
    },

    config = function(_, opts)
      local lspconfig = require("lspconfig")
      for server, config in pairs(opts.servers) do
        config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
        lspconfig[server].setup(config)
      end
    end,
    -- vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end)
  },

  {
    "stevearc/conform.nvim",
    opts = {},
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },
        },
      })
    end,
  },

}
