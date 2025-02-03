return {
  -- Colorscheme(s)
  {
    "shaunsingh/nord.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("rose-pine")
      vim.cmd("highlight Normal guibg=black")
      vim.cmd("highlight NonText guibg=black")
    end,
  },
  "rose-pine/neovim",
  {
    -- "projekt0n/github-nvim-theme",
    -- config = function()
    --   vim.cmd.colorscheme("github_dark")
    -- end
  },

  -- Colorizer
  {
    "norcalli/nvim-colorizer.lua",
    opts = {
      "css"
    }
  },
}
