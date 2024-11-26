return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        lazy = false,
        priority = 1000,
        config = function()
            require("rose-pine").setup({
                variant = "main",
                disable_background = true,
                disable_float_background = false,
                styles = {
                    italic = false,
                    transparent = false,
                },
                highlight_groups = {
                    TreesitterContext = { bg = "NONE" },
                    TreesitterContextLineNumber = { bg = "NONE" },

                }
            })
            vim.api.nvim_set_hl(0, "Float", { bg = "none" })
            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
            vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
            -- vim.cmd.colorscheme("rose-pine")
        end,
    },
    {
        "rebelot/kanagawa.nvim",
        config = function()
            -- vim.cmd.colorscheme("kanagawa-dragon")
        end
    },
    {
        "shausingh/nord.nvim",
        config = function()
            vim.cmd.colorscheme("nord")
        end
    },
}
