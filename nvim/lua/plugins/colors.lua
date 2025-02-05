local nord = {
  "shaunsingh/nord.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.nord_bold = false
    vim.cmd.colorscheme("nord")
  end,
}

local rose_pine = {
  "rose-pine/neovim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  end,
}

local slugbyte = {
  "slugbyte/lackluster.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("slugbyte")
  end
}
local no_clown_fiesta = {
  "aktersnurra/no-clown-fiesta.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("slugbyte")
  end
}

local solarized = {
  "maxmx03/solarized.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    -- vim.o.background = 'light'
    require("solarized").setup({
      variant = "spring",
    })
    vim.cmd.colorscheme("solarized")
  end,
}


local colorizer = {
  "norcalli/nvim-colorizer.lua",
  opts = {
    "css"
  }
}

return {nord, colorizer}
