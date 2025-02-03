local wezterm = require "wezterm" 
local config = {
  color_scheme = 'nord',

  font = wezterm.font("Iosevka Nerd Font"),
  font_size = 11.0,

  enable_tab_bar = false,

  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
}

return config
