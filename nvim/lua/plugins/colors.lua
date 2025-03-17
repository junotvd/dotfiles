function ColorBackground()
  vim.api.nvim_set_hl(0, "Normal", { bg = "#1C1917" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1C1917" })
end

return {

  {
    "shaunsingh/nord.nvim",
    lazy = false,
    config = function()
      vim.g.nord_bold = false
      vim.cmd.colorscheme("rose-pine")
      ColorBackground()
    end,
  },

  {
    "rose-pine/neovim",
    config = function()
      require("rose-pine").setup({
        disable_background = false,
      })
    end
  },

  {
    "zenbones-theme/zenbones.nvim",
    dependencies = "rktjmp/lush.nvim",
  },

}
