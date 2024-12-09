return {
  {
    "rebelot/kanagawa.nvim",
    config = function()
      require("kanagawa").setup({
        transparent = false
      })
      vim.cmd.colorscheme("kanagawa-dragon")
    end
  },
  {
    "ricardoraposo/gruvbox-minor.nvim",
    config = function()
      -- vim.cmd.colorscheme("gruvbox-minor")
    end
  },
}
