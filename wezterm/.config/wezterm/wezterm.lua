local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.front_end = "WebGpu"
config.webgpu_power_preference = "HighPerformance"
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.90
config.window_close_confirmation = "NeverPrompt"
config.enable_tab_bar = false
config.max_fps = 120
config.font = wezterm.font("MonoLisa Nerd Font")
config.font_size = 14
config.underline_position = -5
config.allow_square_glyphs_to_overflow_width = "Always"

config.disable_default_key_bindings = true

config.color_scheme = "Catppuccin Mocha Warm"
config.color_schemes = {
  ["Catppuccin Mocha Warm"] = {
    foreground = "#E4CEA8",
    background = "#231F1F",
    cursor_border = "#89B482",
    cursor_bg = "#89B482",
    cursor_fg = "#231F1F",
    ansi = {
      "#534747", -- black
      "#EA6962", -- red
      "#A9B665", -- green
      "#E8C677", -- yellow
      "#7DAEB3", -- blue
      "#C386BB", -- magenta
      "#89B482", -- cyan
      "#BAC2DE", -- white
    },
    brights = {
      "#534747", -- black
      "#EA6962", -- red
      "#A9B665", -- green
      "#E8C677", -- yellow
      "#7DAEB3", -- blue
      "#C386BB", -- magenta
      "#89B482", -- cyan
      "#BAC2DE", -- white
    },
  },
}

return config
