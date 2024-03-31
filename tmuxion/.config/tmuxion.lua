local tmuxion = require("tmuxion")

tmuxion.config({
  paths = {
    truncate_home_dir = true,
    home_dir_symbol = "~",
    trailing_slash = true,
  },
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
      stats_template = " {results}/{sessions} ",
      stats_style = { fg = "#75615B" },
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

  local win_2 = session:new_window()
  win_2:select_layout("even_horizontal")

  local paths = session:globs({ "**/Cargo.toml" })
  for _, path in ipairs(paths) do
    local path_dir = path:match("(.*[/\\])")
    local pane = win_1:new_pane()
    pane:run_command(" cd " .. path_dir)
    pane:run_command(" cargo watch -x \"test\"")
  end

  -- win_1:current_pane():toggle_zoom()
end)
