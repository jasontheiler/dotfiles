local gitsigns = require("gitsigns")
local keymap = require("utils").keymap

-- See: https://github.com/lewis6991/gitsigns.nvim#usage
gitsigns.setup({
  on_attach = function(buffer)
    local gs = package.loaded.gitsigns
    local opts = { buffer = buffer }

    keymap("n", "[g", gs.prev_hunk, opts)
    keymap("n", "]g", gs.next_hunk, opts)
    keymap("n", "<Leader>gb", gs.blame_line, opts)
    keymap("n", "<Leader>gp", gs.preview_hunk, opts)
    keymap("n", "<Leader>gu", gs.reset_hunk, opts)
  end,
})
