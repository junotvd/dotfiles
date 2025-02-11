function NoBackground()
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
  {
    "shaunsingh/nord.nvim",
    lazy = false,
    config = function()
      vim.g.nord_bold = false
      vim.cmd.colorscheme("rose-pine")
      NoBackground()
    end,
  },
  "rose-pine/neovim",
  "maxmx03/solarized.nvim",
  "rebelot/kanagawa.nvim",
  "slugbyte/lackluster.nvim",
  "aktersnurra/no-clown-fiesta.nvim",
  "ellisonleao/gruvbox.nvim",
  "loctvl842/monokai-pro.nvim",
  "rmehri01/onenord.nvim",
  "nanotech/jellybeans.vim",
}
