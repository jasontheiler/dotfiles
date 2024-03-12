local gitsigns = require("gitsigns")
local utils = require("utils")

-- See: https://github.com/lewis6991/gitsigns.nvim#usage
gitsigns.setup({
  on_attach = function(buffer)
    local gs = package.loaded.gitsigns
    local opts = { buffer = buffer }

    utils.keymap("n", "[g", gs.prev_hunk, "Git hunk", opts)
    utils.keymap("n", "]g", gs.next_hunk, "Git hunk", opts)
    utils.keymap("n", "<leader>gb", gs.blame_line, "Blame", opts)
    utils.keymap("n", "<leader>gp", gs.preview_hunk, "Preview hunk", opts)
    utils.keymap("n", "<leader>gu", gs.reset_hunk, "Undo hunk", opts)
  end,
})
