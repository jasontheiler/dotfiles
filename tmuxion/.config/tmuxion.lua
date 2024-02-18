local tmuxion = require("tmuxion")

local config = {
  session_selector = {
    width = 64,
    height = 24,
    scrolloff = 4,
    inverted = false,
    results = {
      style = nil,
      border = { "┏", "┓", "┃", "┃", "┃", "┃", "━", " " },
      border_style = { fg = "#BDAEC3" },
      title = "",
      title_style = nil,
      item_style = nil,
      item_match_style = { fg = "blue" },
      selection_style = { bg = "#433737", modifiers = { "bold" } },
      selection_prefix = "❯ ",
      selection_prefix_style = { fg = "#DAA992" },
    },
    prompt = {
      style = nil,
      border = { "┃", "┃", "┗", "┛", "┃", "┃", " ", "━" },
      border_style = { fg = "#BDAEC3" },
      title = " Select Session ",
      title_style = { fg = "#DAA992" },
      pattern_style = nil,
      pattern_prefix = "   ",
      pattern_prefix_style = nil,
    },
  },
  keybinds = {
    session_selector = { "C-s", "M-s" },
    last_session = { "w" },
  },
}

return config
