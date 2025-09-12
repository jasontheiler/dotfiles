local tmuxion = require("tmuxion")

tmuxion.session_selector({
  width = 48,
  height = 16,
  scrolloff = 4,
  inverted = false,
  paths = {
    truncate_home_dir = true,
    home_dir_symbol = "~",
    trailing_slash = true,
  },
  results = {
    style = nil,
    border = "rounded",
    border_style = nil,
    title = " Results ",
    title_alignment = "center",
    title_style = nil,
    item_style = nil,
    item_match_style = { fg = "blue" },
    selection_style = { bg = "brightblack", modifiers = { "bold" } },
    selection_prefix = "❯ ",
    selection_prefix_style = { fg = "blue" },
  },
  prompt = {
    style = nil,
    border = "rounded",
    border_style = nil,
    title = " Sessions ",
    title_alignment = "center",
    title_style = nil,
    pattern_style = nil,
    pattern_prefix = "❯ ",
    pattern_prefix_style = { fg = "green", modifiers = { "bold" } },
    stats_format = function(results, sessions)
      return string.format(" %d/%d ", results, sessions)
    end,
    stats_style = { fg = "brightblack" },
  },
})

tmuxion.keybinds({
  select_session = { "C-s" },
  last_session = { "w" },
})
