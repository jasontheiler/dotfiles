local is_installed, telescope = pcall(require, "telescope")

if not is_installed then
  return
end

local telescope_actions = require("telescope/actions")

-- See: https://github.com/nvim-telescope/telescope.nvim#customization
telescope.setup({
  defaults = {
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
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
})

local telescope_builtin = require("telescope/builtin")
local keymap = require("utils").keymap

keymap("n", { "<C-k><C-k>", "<C-k>k" }, telescope_builtin.find_files)
keymap("n", { "<C-k><C-a>", "<C-k>a" }, telescope_builtin.find_files)
