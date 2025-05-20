local active_colorscheme = 'gruvbox-minor'
local use_custom_background = true
local disable_statusline = true

local function ColorBackground(use_bg, disable_sl)
  if use_bg then
    -- vim.api.nvim_set_hl(0, 'Normal', { bg = '#1C1917' })
    -- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = '#1C1917' })
    vim.api.nvim_set_hl(0, 'Normal', { bg = '#181818' })
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = '#181818' })
  end
  if disable_sl then
    vim.cmd('hi statusline guibg=NONE')
    vim.cmd('hi statusline guifg=#ebdbb2')
  end
end

local function SetColors()
  vim.cmd.colorscheme(active_colorscheme)
  if use_custom_background or disable_statusline then
    ColorBackground(use_custom_background, disable_statusline)
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

  {
    'ricardoraposo/gruvbox-minor.nvim',
    config = function()
      vim.api.nvim_set_hl(0, 'BlinkCmpMenu', { bg = '#181818' })
    end,
  },

  {
    'vague2k/vague.nvim',
  },
}
