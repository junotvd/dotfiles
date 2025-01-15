return {
  {
    "zenbones-theme/zenbones.nvim",
    dependencies = "rktjmp/lush.nvim",
    lazy = false,
    config = function()
      vim.o.background = "dark"
      vim.g.zenwritten_lightness = bright
      -- vim.cmd.colorscheme("nordbones")
    end
  },
  {
    "shaunsingh/nord.nvim",
    config = function()
      vim.cmd.colorscheme("nord")
    end
  },
}
