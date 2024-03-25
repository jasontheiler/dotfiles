local tmuxion = require("tmuxion")

tmuxion.config({
  session_selector = {
    width = 48,
    height = 16,
    scrolloff = 4,
    inverted = false,
    results = {
      style = nil,
      border = "plain",
      border_style = { fg = "#BDAEC3" },
      title = " Results ",
      title_style = nil,
      item_style = nil,
      item_match_style = { fg = "blue" },
      selection_style = { bg = "#433737", modifiers = { "bold" } },
      selection_prefix = "❯ ",
      selection_prefix_style = { fg = "#DAA992" },
    },
    prompt = {
      style = nil,
      border = "plain",
      border_style = { fg = "#BDAEC3" },
      title = " Sessions ",
      title_style = nil,
      pattern_style = nil,
      pattern_prefix = "  ",
      pattern_prefix_style = { fg = "#DAA992" },
    },
  },
  keybinds = {
    session_selector = { "C-s", "M-s" },
    last_session = { "w" },
  },
})

tmuxion.on_session_created(function(session)
  local win_1 = session:current_window()
  win_1:select_layout("main_vertical")
  win_1:current_pane():run_command(" nvim")

  session:new_window()
end)
