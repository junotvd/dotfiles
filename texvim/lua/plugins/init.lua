return {
    {
        "echasnovski/mini.nvim",
        config = function()
            require("mini.surround").setup()
            require("mini.comment").setup()
            require("mini.icons").setup()
        end
    },
    {
        "shaunsingh/nord.nvim",
        config = function()
            vim.cmd.colorscheme("nord")
        end
    },
    {
        "lervag/vimtex",
        lazy = false,
        init = function()
            vim.g.vimtex_view_method = "zathura"
        end
    },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>sf', builtin.find_files, {})
            vim.keymap.set('n', '<leader>sg', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>sb', builtin.buffers, {})
            vim.keymap.set('n', '<leader>sh', builtin.help_tags, {})
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "bash", "c", "lua", "markdown", "matlab", "python", "rust",
                },
                sync_install = false,
                auto_install = true,
                ignore_install = {"latex"},
                indent = {
                    enable = true
                },
                highlight = {
                    enable = true,
                    disable = { "latex" },
                    additional_vim_regex_highlighting = { "markdown" },
                },
                modules = {},
            })
            local treesitter_parser_config = require("nvim-treesitter.parsers").get_parser_configs()
            treesitter_parser_config.templ = {
                install_info = {
                    url = "https://github.com/vrischmann/tree-sitter-templ.git",
                    files = {"src/parser.c", "src/scanner.c"},
                    branch = "master",
                },
            }

            vim.treesitter.language.register("templ", "templ")
        end
    },
    {
        "folke/trouble.nvim",
        config = function ()
            require("trouble").setup({
                icons = false,
            })

            vim.keymap.set("n", "<leader>tt", function()
                require("trouble").toggle()
            end)

            vim.keymap.set("n", "<leader>tn", function()
                require("trouble").next({skip_groups = true, jump = true});
            end)

            vim.keymap.set("n", "<leader>tp", function()
                require("trouble").previous({skip_groups = true, jump = true});
            end)

        end
    },
}
