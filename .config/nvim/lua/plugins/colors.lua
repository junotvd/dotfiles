-- return {
-- 	"ellisonleao/gruvbox.nvim",
-- 	config = function()
-- 		require("gruvbox").setup({})
-- 		vim.cmd("colorscheme gruvbox")
-- 	end
-- }

-- return {
-- 	'rose-pine/neovim',
-- 	name = 'rose-pine',
-- 	config = function()
-- 		-- disable_background = true
-- 		vim.cmd('colorscheme rose-pine')
-- 		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- 		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- 	end,
-- }

return {
	'rebelot/kanagawa.nvim',
	config = function()
		require('kanagawa').setup({
			theme = 'dragon',
		})
		vim.cmd('colorscheme kanagawa-dragon')
	end
}
