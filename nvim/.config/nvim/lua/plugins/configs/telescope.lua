local telescope = require("telescope")
local telescope_actions = require("telescope/actions")
local telescope_builtin = require("telescope/builtin")
local keymap = require("utils").keymap

local with_default_opts = function(pickers)
  for picker, opts in pairs(pickers) do
    pickers[picker] = vim.tbl_extend("force", { preview_title = "" }, opts)
  end
  return pickers
end

-- See: https://github.com/nvim-telescope/telescope.nvim#customization
telescope.setup({
  defaults = {
    results_title = "",
    selection_caret = "❯ ",
    prompt_prefix = "   ",
    get_status_text = function() return "" end,
    borderchars = {
      prompt = { " ", "┃", "━", "┃", "┃", "┃", "┛", "┗" },
      results = { "━", "┃", " ", "┃", "┏", "┓", "┃", "┃" },
      preview = { "━", "┃", "━", "┃", "┏", "┓", "┛", "┗" },
    },
    layout_strategy = "flex",
    layout_config = {
      flex = {
        flip_columns = 120,
      },
      horizontal = {
        preview_cutoff = 0,
      },
      vertical = {
        preview_height = 0.33,
        preview_cutoff = 0,
      },
    },
    mappings = {
      i = {
        ["<C-h>"] = { type = "command", "<Left>" },
        ["<C-j>"] = telescope_actions.move_selection_next,
        ["<C-k>"] = telescope_actions.move_selection_previous,
        ["<C-l>"] = { type = "command", "<Right>" },
      },
    },
  },
  pickers = with_default_opts({
    find_files = {
      find_command = { "rg", "--files", "--hidden", "--glob", "!*/.git/*", "--glob", "!.git/*" },
    },
    live_grep = {
      additional_args = function() return { "--hidden" } end,
      glob_pattern = {
        "!*/.git/*",
        "!.git/*",
        "!*.lock",
        "!*/package-lock.json",
        "!*/pnpm-lock.yaml",
      },
    },
    buffers = {},
    oldfiles = {},
    diagnostics = {},
    git_commits = {},
    git_bcommits = {},
    git_branches = {},
  }),
})

keymap("n", "<Leader>kk", telescope_builtin.find_files)
keymap("n", "<Leader>ka", function() telescope_builtin.find_files({ no_ignore = true }) end)
keymap("n", "<Leader>k/", telescope_builtin.live_grep)
keymap("n", "<Leader>kb", telescope_builtin.buffers)
keymap("n", "<Leader>ko", function() telescope_builtin.oldfiles({ cwd_only = true }) end)
keymap("n", "<Leader>kd", telescope_builtin.diagnostics)
keymap("n", "<Leader>kD", function() telescope_builtin.diagnostics({ bufnr = 0 }) end)
keymap("n", "<Leader>kgc", telescope_builtin.git_commits)
keymap("n", "<Leader>kgC", telescope_builtin.git_bcommits)
keymap("n", "<Leader>kgb", telescope_builtin.git_branches)
