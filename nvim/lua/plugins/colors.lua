return {
  {
    "rebelot/kanagawa.nvim",
    config = function()
      -- vim.cmd.colorscheme("kanagawa-dragon")
    end
  },
  {
    "ricardoraposo/gruvbox-minor.nvim",
    config = function()
      -- vim.cmd.colorscheme("gruvbox-minor")
    end
  },
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("solarized-osaka").setup({
        transparent = false
      })
      vim.cmd.colorscheme("solarized-osaka")
    end
  },
}
