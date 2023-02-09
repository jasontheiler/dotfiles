local gitsigns = require("gitsigns")
local utils = require("utils")

-- See: https://github.com/lewis6991/gitsigns.nvim#usage
gitsigns.setup({
    on_attach = function(buffer)
      local gs = package.loaded.gitsigns
      local opts = { buffer = buffer }

      utils.keymap("n", "[g", gs.prev_hunk, opts)
      utils.keymap("n", "]g", gs.next_hunk, opts)
      utils.keymap("n", "<Leader>gb", gs.blame_line, opts)
      utils.keymap("n", "<Leader>gp", gs.preview_hunk, opts)
      utils.keymap("n", "<Leader>gu", gs.reset_hunk, opts)
    end,
})
