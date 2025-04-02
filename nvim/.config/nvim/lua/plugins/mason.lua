--- See: https://github.com/williamboman/mason.nvim
---
--- @type LazyPluginSpec
return {
  "williamboman/mason.nvim",
  event = "VeryLazy",
  --- See: https://github.com/williamboman/mason.nvim#configuration
  ---
  --- @type MasonSettings
  opts = {
    ui = { border = "rounded" },
  },
}
