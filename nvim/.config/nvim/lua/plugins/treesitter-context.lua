--- See: https://github.com/nvim-treesitter/nvim-treesitter-context
---
--- @type LazyPluginSpec
return {
  "nvim-treesitter/nvim-treesitter-context",
  dependencies = {
    -- See: https://github.com/nvim-treesitter/nvim-treesitter
    "nvim-treesitter/nvim-treesitter",
  },
  event = "VeryLazy",
  -- See: https://github.com/nvim-treesitter/nvim-treesitter-context#configuration
  opts = {
    multiline_threshold = 1,
    separator = "─",
  },
}
