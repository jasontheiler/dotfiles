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
config.font = wezterm.font_with_fallback({
  "Iosevka Term",
  "JetBrainsMono NF",
})
config.font_size = 15
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

config.color_scheme = "Gruvbox Material"
config.color_schemes = {
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
  ["Gruvbox Material"] = {
    foreground = "#D4BE98",
    background = "#282828",
    cursor_border = "#D4BE98",
    cursor_bg = "#D4BE98",
    cursor_fg = "#282828",
    ansi = {
      "#5A524C", -- black
      "#EA6962", -- red
      "#A9B665", -- green
      "#D8A657", -- yellow
      "#7DAEA3", -- blue
      "#D3869B", -- magenta
      "#89B482", -- cyan
      "#D4BE98", -- white
    },
    brights = {
      "#5A524C", -- black
      "#EA6962", -- red
      "#A9B665", -- green
      "#D8A657", -- yellow
      "#7DAEA3", -- blue
      "#D3869B", -- magenta
      "#89B482", -- cyan
      "#D4BE98", -- white
    },
  },
}

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
  config.default_prog = { "wsl", "--cd", "~" }
end

return config
