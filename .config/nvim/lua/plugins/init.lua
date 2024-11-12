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
		'MeanderingProgrammer/markdown.nvim',
		main = "render-markdown",
		opts = {},
		dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
	},

    {
        "mbbill/undotree",
        config = function()
            vim.keymap.set('n', '<leader><u>', vim.cmd.UndotreeToggle)
        end
    },

    {
    "L3MON4D3/LuaSnip",
    config = function()
        require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/lua/plugins/LuaSnip/"})
    end
    },

}
