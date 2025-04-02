--- See: https://github.com/folke/which-key.nvim
---
--- @type LazyPluginSpec
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local which_key = require("which-key")

    -- See: https://github.com/folke/which-key.nvim#%EF%B8%8F-configuration
    which_key.setup({
      preset = "helix",
      win = {
        row = math.huge,
        padding = { 1, 3 },
      },
      sort = { "group", "alphanum" },
      replace = {
        key = {
          { "<Space>",     "Leader" },
          { "<LeftMouse>", "<LMB>" },
        },
      },
      icons = {
        group = "",
        rules = false,
      },
      show_help = false,
    })

    -- See: https://github.com/folke/which-key.nvim#%EF%B8%8F-setup
    which_key.add({
      { "<Leader>b", group = "Buffer" },
      { "<Leader>g", group = "Git" },
      { "<Leader>l", group = "LSP" },
      { "<Leader>s", group = "Search" },
      { "<Leader>w", group = "Window" },
    })
  end,
}
