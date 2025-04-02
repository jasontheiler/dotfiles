--- See: https://github.com/lukas-reineke/virt-column.nvim
---
--- @type LazyPluginSpec
return {
  "lukas-reineke/virt-column.nvim",
  event = "VeryLazy",
  --- See: https://github.com/lukas-reineke/virt-column.nvim#setup
  ---
  --- @type virtcolumn.config
  opts = {
    char = "│",
  },
}
