local api = vim.api

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

api.nvim_set_keymap("n", "<C-b>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
