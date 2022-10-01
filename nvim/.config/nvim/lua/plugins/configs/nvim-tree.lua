local is_installed, nvim_tree = pcall(require, "nvim-tree")

if not is_installed then
  return
end

-- See: https://github.com/kyazdani42/nvim-tree.lua#setup
nvim_tree.setup({
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

local nvim_tree_api = require("nvim-tree/api")
local keymap = require("utils").keymap

keymap("n", "<C-b>", nvim_tree_api.tree.toggle)
