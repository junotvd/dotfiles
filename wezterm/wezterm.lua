local wezterm = require "wezterm" 
local config = {

  color_scheme = 'Monokai (terminal.sexy)',

  font = wezterm.font("JuliaMono"),
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
