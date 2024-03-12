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
        ["<Esc>"] = telescope_actions.close,
        ["<C-j>"] = telescope_actions.move_selection_next,
        ["<C-k>"] = telescope_actions.move_selection_previous,
      },
    },
  },
  pickers = with_default_opts({
    find_files = {
      find_command = { "rg", "--files", "--hidden", "--glob", "!*/.git/*", "--glob", "!.git/*" },
      prompt_title = "Files",
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
    diagnostics = { prompt_title = "Diagnostics" },
    lsp_document_symbols = {},
    lsp_definitions = {},
    lsp_type_definitions = {},
    lsp_implementations = {},
    lsp_references = {},
    git_bcommits = {},
  }),
})

utils.keymap("n", "<leader>sf", telescope_builtin.find_files, "Files")
utils.keymap("n", "<leader>sa", function()
  telescope_builtin.find_files({ prompt_title = "All files", no_ignore = true })
end, "All files")
utils.keymap("n", "<leader>so", function()
  telescope_builtin.oldfiles({ cwd_only = true })
end, "Oldfiles")
utils.keymap("n", "<leader>sb", telescope_builtin.buffers, "Buffers")
utils.keymap("n", "<leader>s/", function()
  telescope_builtin.live_grep({ prompt_title = "Search" })
end)
utils.keymap("n", "<leader>sd", telescope_builtin.diagnostics, "Diagnostics")
utils.keymap("n", "<leader>ls", telescope_builtin.lsp_document_symbols, "Symbols")
utils.keymap("n", "<leader>ld", telescope_builtin.lsp_definitions, "Definitions")
utils.keymap("n", "<leader>lt", telescope_builtin.lsp_type_definitions, "Type definitions")
utils.keymap("n", "<leader>li", telescope_builtin.lsp_implementations, "Implementations")
utils.keymap("n", "<leader>lR", telescope_builtin.lsp_references, "References")
utils.keymap("n", "<leader>gc", telescope_builtin.git_bcommits, "Buffer commits")
