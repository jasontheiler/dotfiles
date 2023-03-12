local telescope = require("telescope")
local telescope_actions = require("telescope/actions")
local telescope_builtin = require("telescope/builtin")
local utils = require("utils")

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
        ["<C-j>"] = telescope_actions.move_selection_next,
        ["<C-k>"] = telescope_actions.move_selection_previous,
      },
    },
  },
  pickers = with_default_opts({
    find_files = {
      find_command = { "rg", "--files", "--hidden", "--glob", "!*/.git/*", "--glob", "!.git/*" },
    },
    oldfiles = {},
    buffers = {},
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
    diagnostics = {},
  }),
})

utils.keymap("n", "<Leader>kk", telescope_builtin.find_files)
utils.keymap("n", "<Leader>ka", function()
  telescope_builtin.find_files({
    prompt_title = "Find All Files",
    no_ignore = true,
  })
end)
utils.keymap("n", "<Leader>ko", function() telescope_builtin.oldfiles({ cwd_only = true }) end)
utils.keymap("n", "<Leader>kb", telescope_builtin.buffers)
utils.keymap("n", "<Leader>k/", telescope_builtin.live_grep)
utils.keymap("n", "<Leader>kd", telescope_builtin.diagnostics)
