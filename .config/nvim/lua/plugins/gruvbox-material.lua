return {
	"sainnhe/gruvbox-material",
	priority = 1000, -- Make sure to load this before all the other start plugins.
	lazy = false,
	config = function()
		vim.g.gruvbox_material_enable_italic = true
		vim.cmd.colorscheme("gruvbox-material")
	end,
}
