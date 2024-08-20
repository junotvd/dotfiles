return {
	{
		'nvim-tree/nvim-web-devicons',
		enabled = vim.g.have_nerd_font
	},

	{
		'nvim-telescope/telescope.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},

	{
		"echasnovski/mini.nvim",
		config = function()
			require("mini.surround").setup()
			require("mini.comment").setup()
			require("mini.icons").setup()
		end
	},
}
