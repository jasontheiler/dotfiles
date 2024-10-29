-- See: https://wezfurlong.org/wezterm/config/files.html

local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.window_decorations = "RESIZE"
config.window_background_opacity = 1
config.window_close_confirmation = "NeverPrompt"
config.window_padding = {
  top = 0,
  right = 8,
  bottom = 0,
  left = 8,
}
config.max_fps = 200
config.enable_tab_bar = false
config.default_cursor_style = "SteadyBlock"
config.cursor_blink_rate = 0
config.font = wezterm.font_with_fallback({
  "CommitMono Nerd Font",
  "MonoLisa Nerd Font",
})
config.font_size = 20
config.bold_brightens_ansi_colors = "No"
config.allow_square_glyphs_to_overflow_width = "Always"

config.disable_default_key_bindings = true
config.keys = {
  { mods = "CTRL|SHIFT", key = "C", action = wezterm.action.CopyTo("Clipboard") },
  { mods = "CTRL|SHIFT", key = "V", action = wezterm.action.PasteFrom("Clipboard") },
}

config.color_scheme = "Catppuccin Mocha Neo"
config.color_schemes = {
  ["Catppuccin Mocha Warm"] = {
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
  ["Catppuccin Mocha Neo"] = {
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

if os.getenv("XDG_CURRENT_DESKTOP") == "Hyprland" then
  config.enable_wayland = false
end

return config
