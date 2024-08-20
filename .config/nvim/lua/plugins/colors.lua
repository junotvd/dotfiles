-- Copy of ThePrimeagen

function ColorMyPencils(color)
	color = color or 'rose-pine'
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
	{
		'rose-pine/neovim',
		name = 'rose-pine',
		config = function()
			require("rose-pine").setup({
				variant = "main",
				disable_background = true,
			})

			ColorMyPencils()
		end,
	},

	{
		'folke/tokyonight.nvim',
		config = function()
			require('tokyonight').setup({
				style = 'storm',
				transparent = true,
				terminal_colors = true,
				styles = {
					comments = { italic = false},
					keywords = { italic = false},
					sidebars = 'dark',
					floats = 'dark',
				},
			})
		end,
	},
}
