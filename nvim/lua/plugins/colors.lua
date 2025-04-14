local active_colorscheme = 'gruvbox-minor'
local use_custom_background = false

local function ColorBackground()
  vim.api.nvim_set_hl(0, 'Normal', { bg = '#1C1917' })
  vim.api.nvim_set_hl(0, 'NormalFloat', { bg = '#1C1917' })
  vim.cmd('hi statusline guibg=NONE')
end

local function SetColors()
  vim.cmd.colorscheme(active_colorscheme)
  if use_custom_background then
    ColorBackground()
  end
end

vim.api.nvim_create_autocmd('User', {
  pattern = 'VeryLazy',
  callback = SetColors,
})

return {

  {
    'shaunsingh/nord.nvim',
    lazy = false,
    config = function()
      if vim.g.colors_name == 'nord' then
        vim.api.nvim_create_autocmd('FileType', {
          pattern = 'tex',
          callback = function()
            vim.g.nord_bold = false
          end,
        })
      end
    end,
  },

  {
    'rose-pine/neovim',
    config = function()
      require('rose-pine').setup({
        disable_background = false,
      })
    end,
  },

  {
    'zenbones-theme/zenbones.nvim',
    lazy = false,
    dependencies = 'rktjmp/lush.nvim',
  },

  'ellisonleao/gruvbox.nvim',
  'ricardoraposo/gruvbox-minor.nvim',
}
