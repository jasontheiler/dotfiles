local is_installed, tree = pcall(require, "nvim-tree")

if not is_installed then
  return
end

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

local tree_api = require("nvim-tree/api")
local keymap = require("utils").keymap

keymap("n", "<C-b>", tree_api.tree.toggle)
