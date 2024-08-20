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
}
