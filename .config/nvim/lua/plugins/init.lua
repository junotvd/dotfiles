return {
	{
		'nvim-tree/nvim-web-devicons',
		enabled = vim.g.have_nerd_font
	},

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
}
