local telescope = require("telescope")
local telescope_actions = require("telescope/actions")
local telescope_builtin = require("telescope/builtin")
local utils = require("utils")

-- See: https://github.com/nvim-telescope/telescope.nvim#customization
telescope.setup({
  defaults = {
    prompt_prefix = "  ",
    selection_caret = "❯ ",
    get_status_text = function(picker)
      local stat_processed = picker.stats.processed or 0
      local stat_filtered = picker.stats.filtered or 0
      return (stat_processed - stat_filtered) .. "/" .. stat_processed .. " "
    end,
    preview = { filesize_limit = 0.1 },
    borderchars = {
      prompt = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
      results = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
      preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
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
  pickers = {
    find_files = {
      find_command = {
        "rg",
        "--files",
        "--hidden",
        "--glob", "!*/.git/*",
        "--glob", "!.git/*",
        "--glob", "!*.lock",
        "--glob", "!*/package-lock.json",
        "--glob", "!*/pnpm-lock.yaml",
      },
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
    oldfiles = { cwd_only = true },
  },
})

local keymap_picker = function(lhs, picker, desc, opts)
  local default_opts = { prompt_title = desc, results_title = "Results", preview_title = "Preview" }
  opts = vim.tbl_extend("force", default_opts, opts or {})
  utils.keymap("n", lhs, function() picker(opts) end, desc)
end

keymap_picker("<leader>sh", telescope_builtin.help_tags, "Help")
keymap_picker("<leader>sf", telescope_builtin.find_files, "Files")
keymap_picker("<leader>sa", telescope_builtin.find_files, "All files", { no_ignore = true })
keymap_picker("<leader>so", telescope_builtin.oldfiles, "Oldfiles")
keymap_picker("<leader>sb", telescope_builtin.buffers, "Buffers")
keymap_picker("<leader>s/", telescope_builtin.live_grep, "Search")
keymap_picker("<leader>sd", telescope_builtin.diagnostics, "Diagnostics")
keymap_picker("<leader>gc", telescope_builtin.git_bcommits, "Buffer commits")
keymap_picker("<leader>ls", telescope_builtin.lsp_document_symbols, "Symbols")
keymap_picker("<leader>ld", telescope_builtin.lsp_definitions, "Definitions")
keymap_picker("<leader>lt", telescope_builtin.lsp_type_definitions, "Type definitions")
keymap_picker("<leader>li", telescope_builtin.lsp_implementations, "Implementations")
keymap_picker("<leader>lR", telescope_builtin.lsp_references, "References")
keymap_picker("<leader>gc", telescope_builtin.git_bcommits, "Buffer commits")
