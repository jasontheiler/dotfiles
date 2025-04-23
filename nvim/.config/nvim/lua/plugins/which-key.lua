--- See: https://github.com/folke/which-key.nvim
---
--- @type LazyPluginSpec
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  -- See: https://github.com/folke/which-key.nvim#%EF%B8%8F-configuration
  opts = {
    preset = "helix",
    delay = 0,
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
      breadcrumb = "➜",
      group = "",
      mappings = false,
    },
    show_help = false,
    spec = {
      { "<Leader>b", group = "Buffer" },
      { "<Leader>g", group = "Git" },
      { "<Leader>l", group = "LSP" },
      { "<Leader>s", group = "Search" },
      { "<Leader>w", group = "Window" },
    }
  },
}
