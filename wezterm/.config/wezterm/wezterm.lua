-- See: https://wezfurlong.org/wezterm/config/files.html

local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.front_end = "WebGpu"
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.9
config.window_close_confirmation = "NeverPrompt"
config.enable_tab_bar = false
config.max_fps = 120
config.default_cursor_style = "SteadyBlock"
config.cursor_blink_rate = 0
config.font = wezterm.font_with_fallback({
  { family = "CommitMono Nerd Font", scale = 1.07 },
  "MonoLisa Nerd Font",
})
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

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
  config.webgpu_power_preference = "HighPerformance"
  config.default_prog = { "wsl", "--cd", "~" }
end

if wezterm.target_triple == "x86_64-apple-darwin" then
  config.font_size = 16
end

return config
