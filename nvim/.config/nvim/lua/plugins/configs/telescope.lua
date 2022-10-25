local telescope = require("telescope")
local telescope_actions = require("telescope/actions")
local telescope_builtin = require("telescope/builtin")
local keymap = require("utils").keymap

-- See: https://github.com/nvim-telescope/telescope.nvim#customization
telescope.setup({
  defaults = {
    prompt_prefix = " ",
    selection_caret = "❯ ",
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

keymap("n", "<Leader>kb", telescope_builtin.buffers)
keymap("n", "<Leader>ko", function() telescope_builtin.oldfiles({ cwd_only = true }) end)
keymap("n", "<Leader>kd", telescope_builtin.diagnostics)
keymap("n", "<Leader>kD", function() telescope_builtin.diagnostics({ bufnr = 0 }) end)
keymap("n", "<Leader>kgc", telescope_builtin.git_commits)
keymap("n", "<Leader>kgC", telescope_builtin.git_bcommits)
keymap("n", "<Leader>kgb", telescope_builtin.git_branches)

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

local live_grep = function()
  telescope_builtin.live_grep({
    additional_args = function() return { "--hidden" } end,
    glob_pattern = {
      "!*/.git/*",
      "!.git/*",
      "!*.lock",
      "!*/package-lock.json",
      "!*/pnpm-lock.yaml",
    },
  })
end

keymap("n", "<Leader>k/", live_grep)
