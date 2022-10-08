local telescope = require("telescope")
local telescope_actions = require("telescope/actions")
local telescope_builtin = require("telescope/builtin")
local keymap = require("utils").keymap

-- See: https://github.com/nvim-telescope/telescope.nvim#customization
telescope.setup({
  defaults = {
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

local find_files = function(no_ignore)
  if vim.fn.executable("rg") == 0 then
    vim.notify("You need to install ripgrep", vim.log.levels.ERROR)
    return
  end

  telescope_builtin.find_files({
    find_command = { "rg", "--files", "--hidden", "--glob", "!*/.git/*", "--glob", "!.git/*" },
    no_ignore = no_ignore,
  })
end

keymap("n", "<Leader>kk", function() find_files(false) end)
keymap("n", "<Leader>ka", function() find_files(true) end)
keymap("n", "<Leader>kb", telescope_builtin.buffers)
