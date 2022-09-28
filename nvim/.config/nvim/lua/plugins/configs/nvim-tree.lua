local api = vim.api

local isInstalled, nvim_tree = pcall(require, "nvim-tree")

if not isInstalled then
  return
end

nvim_tree.setup({
  disable_netrw = true,
  hijack_cursor = true,
  sync_root_with_cwd = true,
  update_focused_file = {
    enable = true,
  },
  view = {
    hide_root_folder = true,
  },
})

api.nvim_set_keymap("n", "<C-b>", ":NvimTreeToggle<CR>", { noremap = true })
