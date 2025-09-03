-- See: https://wezfurlong.org/wezterm/config/files.html

local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.window_decorations = "RESIZE"
config.window_background_opacity = 1
config.window_close_confirmation = "NeverPrompt"
config.window_padding = {
  top = 0,
  right = "0.5cell",
  bottom = 0,
  left = "0.5cell",
}
config.max_fps = 200
config.enable_tab_bar = false
config.default_cursor_style = "SteadyBlock"
config.cursor_blink_rate = 0
config.font = wezterm.font_with_fallback({
  "Iosevka Term",
  "JetBrainsMono NF",
})
config.font_size = 16
config.underline_thickness = "200%"
config.bold_brightens_ansi_colors = "No"
config.allow_square_glyphs_to_overflow_width = "Always"

config.disable_default_key_bindings = true
config.keys = {
  { mods = "CTRL",       key = "0", action = wezterm.action.ResetFontSize },
  { mods = "CTRL",       key = "-", action = wezterm.action.DecreaseFontSize },
  { mods = "CTRL",       key = "=", action = wezterm.action.IncreaseFontSize },
  { mods = "CTRL|SHIFT", key = "C", action = wezterm.action.CopyTo("Clipboard") },
  { mods = "CTRL|SHIFT", key = "V", action = wezterm.action.PasteFrom("Clipboard") },
}

config.color_scheme = "Catppuccin Ocean Foam"
config.color_schemes = {
  ["Catppuccin Ocean Foam"] = {
    foreground = "#CDD6F4",
    background = "#1E1E2E",
    cursor_border = "#F5E0DC",
    cursor_bg = "#F5E0DC",
    cursor_fg = "#1E1E2E",
    ansi = {
      "#45475A", -- black
      "#F38BA8", -- red
      "#73E9CD", -- green
      "#F9E2AF", -- yellow
      "#89B4FA", -- blue
      "#F5C2E7", -- magenta
      "#94E2D5", -- cyan
      "#CDD6F4", -- white
    },
    brights = {
      "#45475A", -- black
      "#F38BA8", -- red
      "#73E9CD", -- green
      "#F9E2AF", -- yellow
      "#89B4FA", -- blue
      "#F5C2E7", -- magenta
      "#94E2D5", -- cyan
      "#CDD6F4", -- white
    },
  },
  ["Catppuccin Cocoa"] = {
    foreground = "#E4CEA8",
    background = "#211D1D",
    cursor_border = "#89B482",
    cursor_bg = "#89B482",
    cursor_fg = "#211D1D",
    ansi = {
      "#534747", -- black
      "#EA6962", -- red
      "#A9B665", -- green
      "#E8C677", -- yellow
      "#7DAEB3", -- blue
      "#C386BB", -- magenta
      "#89B482", -- cyan
      "#E4CEA8", -- white
    },
    brights = {
      "#534747", -- black
      "#EA6962", -- red
      "#A9B665", -- green
      "#E8C677", -- yellow
      "#7DAEB3", -- blue
      "#C386BB", -- magenta
      "#89B482", -- cyan
      "#E4CEA8", -- white
    },
  },
  ["Catppuccin Neo"] = {
    foreground = "#E0E2EA",
    background = "#14161B",
    cursor_border = "#B3F6C0",
    cursor_bg = "#B3F6C0",
    cursor_fg = "#14161B",
    ansi = {
      "#45475D", -- black
      "#FF87BC", -- red
      "#B3F6C0", -- green
      "#F9E6C0", -- yellow
      "#A6DBFF", -- blue
      "#E3AAFF", -- magenta
      "#8CF8F7", -- cyan
      "#E0E2EA", -- white
    },
    brights = {
      "#45475D", -- black
      "#FF87BC", -- red
      "#B3F6C0", -- green
      "#F9E6C0", -- yellow
      "#A6DBFF", -- blue
      "#E3AAFF", -- magenta
      "#8CF8F7", -- cyan
      "#E0E2EA", -- white
    },
  },
}

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
  config.default_prog = { "wsl", "--cd", "~" }
end

return config
