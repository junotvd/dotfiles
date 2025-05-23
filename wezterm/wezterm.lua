local wezterm = require('wezterm')
local config = {

  font = wezterm.font('JuliaMono'),
  font_size = 15.0,

  enable_tab_bar = false,

  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },

  color_scheme = 'Alacritty',
  color_schemes = {
    ['Alacritty'] = {
      foreground = '#d8d8d8',
      background = '#181818',
      -- background = '#1C1917',

      cursor_bg = '#d8d8d8',
      cursor_border = '#d8d8d8',
      cursor_fg = '#181818',

      selection_fg = '#181818',
      selection_bg = '#d8d8d8',

      ansi = {
        '#181818', -- black
        '#ac4242', -- red
        '#90a959', -- green
        '#f4bf75', -- yellow
        '#6a9fb5', -- blue
        '#aa759f', -- magenta
        '#75b5aa', -- cyan
        '#d8d8d8', -- white
      },
      brights = {
        '#6b6b6b', -- bright black
        '#c55555', -- bright red
        '#aac474', -- bright green
        '#feca88', -- bright yellow
        '#82b8c8', -- bright blue
        '#c28cb8', -- bright magenta
        '#93d3c3', -- bright cyan
        '#f8f8f8', -- bright white
      },
    },
  },
}

return config
