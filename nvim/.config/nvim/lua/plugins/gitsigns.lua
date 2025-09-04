--- See: https://github.com/lewis6991/gitsigns.nvim
---
--- @type LazyPluginSpec
return {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",
  -- See: https://github.com/lewis6991/gitsigns.nvim#usage
  opts = {
    on_attach = function(buffer)
      local gitsigns = package.loaded.gitsigns

      vim.keymap.set("n", "[g", gitsigns.prev_hunk, { desc = "Previous Git hunk", buffer = buffer })
      vim.keymap.set("n", "]g", gitsigns.next_hunk, { desc = "Next Git hunk", buffer = buffer })
      vim.keymap.set("n", "<Leader>gu", gitsigns.reset_hunk, { desc = "Undo hunk", buffer = buffer })
      vim.keymap.set("n", "<Leader>gb", gitsigns.blame_line, { desc = "Blame", buffer = buffer })
      vim.keymap.set("n", "<Leader>gp", gitsigns.preview_hunk, { desc = "Preview hunk", buffer = buffer })
    end,
  },
}
