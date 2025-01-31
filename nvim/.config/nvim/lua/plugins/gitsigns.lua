local utils = require("utils")

-- See: https://github.com/lewis6991/gitsigns.nvim
return {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",
  -- See: https://github.com/lewis6991/gitsigns.nvim#usage
  opts = {
    preview_config = { border = "rounded" },
    on_attach = function(buffer)
      local gs = package.loaded.gitsigns
      local opts = { buffer = buffer }

      utils.keymap("n", "[g", gs.prev_hunk, "Previous Git hunk", opts)
      utils.keymap("n", "]g", gs.next_hunk, "Next Git hunk", opts)
      utils.keymap("n", "<leader>gb", gs.blame_line, "Blame", opts)
      utils.keymap("n", "<leader>gp", gs.preview_hunk, "Preview hunk", opts)
      utils.keymap("n", "<leader>gu", gs.reset_hunk, "Undo hunk", opts)
    end,
  },
}
