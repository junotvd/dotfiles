local wezterm = require('wezterm')
local config = {

  colors = {
    foreground = '#d8d8d8',
    background = '#181818',

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
    dim = {
      '#0f0f0f', -- dim black
      '#712b2b', -- dim red
      '#5f6f3a', -- dim green
      '#a17e4d', -- dim yellow
      '#456877', -- dim blue
      '#704d68', -- dim magenta
      '#4d7770', -- dim cyan
      '#8e8e8e', -- dim white
    },
  },
  font = wezterm.font('JuliaMono'),
  font_size = 15.0,

  enable_tab_bar = false,

  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
}

return config
