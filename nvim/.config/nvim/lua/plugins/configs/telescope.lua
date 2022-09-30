local is_installed, telescope = pcall(require, "telescope")

if not is_installed then
  return
end

-- See: https://github.com/nvim-telescope/telescope.nvim#customization
telescope.setup({})

local telescope_builtin = require("telescope/builtin")
local keymap = require("utils").keymap

keymap("n", { "<C-k><C-k>", "<C-k>k" }, telescope_builtin.find_files)
