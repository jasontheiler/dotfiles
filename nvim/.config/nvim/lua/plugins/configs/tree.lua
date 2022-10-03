local tree = require("nvim-tree")
local tree_api = require("nvim-tree/api")
local keymap = require("utils").keymap

-- See: https://github.com/kyazdani42/nvim-tree.lua#setup
tree.setup({
  hijack_cursor = true,
  sync_root_with_cwd = true,
  update_focused_file = {
    enable = true,
  },
  view = {
    hide_root_folder = true,
  },
  actions = {
    change_dir = {
      restrict_above_cwd = true,
    },
  },
})

keymap("n", "<C-b>", tree_api.tree.toggle)
