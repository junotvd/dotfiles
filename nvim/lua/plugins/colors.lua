return {
  -- Colorscheme(s)
  {
    "shaunsingh/nord.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("nord")
    end,
  },
  -- Colorizer
  {
    "norcalli/nvim-colorizer.lua",
    opts = {
      "css"
    }
  },
}
