function NoBackground()
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
  {
    "shaunsingh/nord.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.nord_bold = false
      vim.cmd.colorscheme("kanagawa-dragon")
    end,
  },
  {
    "rose-pine/neovim",
    config = function()
      -- NoBackground()
    end,
  },
  {
    "maxmx03/solarized.nvim",
    config = function()
      -- vim.o.background = 'light'
      require("solarized").setup({
        variant = "spring",
      })
    end,
  },
  {
    "rebelot/kanagawa.nvim"
  },
  { "slugbyte/lackluster.nvim" },
  { "aktersnurra/no-clown-fiesta.nvim" },


  {
    "norcalli/nvim-colorizer.lua",
    opts = {
      "css"
    }
  },
}
