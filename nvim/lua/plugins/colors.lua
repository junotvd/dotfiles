return {
  {
    "rebelot/kanagawa.nvim",
    config = function()
      require("kanagawa").setup({
        transparent = false
      })
      -- vim.cmd.colorscheme("kanagawa-dragon")
    end
  },
  { "phha/zenburn.nvim",
    config = function()
      vim.cmd.colorscheme("zenburn")
    end
  },
  {
    "shaunsingh/nord.nvim",
    config = function()
      -- vim.cmd.colorscheme("nord")
    end
  },
}
