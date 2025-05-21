--- See: https://github.com/mason-org/mason.nvim
---
--- @type LazyPluginSpec
return {
  "mason-org/mason.nvim",
  event = "VeryLazy",
  --- See: https://github.com/mason-org/mason.nvim#configuration
  ---
  --- @type MasonSettings
  opts = {
    ui = { border = "rounded" },
  },
}
