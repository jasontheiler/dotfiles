local feline = require("feline")

-- See: https://github.com/feline-nvim/feline.nvim/blob/master/USAGE.md
feline.winbar.setup({
  components = {
    active = {
      -- left
      {},
      -- right
      {
        {
          provider = {
            name = "file_info",
            opts = { type = "relative" },
          },
          icon = "",
          hl = "FelineWBSeg0",
        },
      },
    },
    inactive = {
      -- left
      {},
      -- right
      {
        {
          provider = {
            name = "file_info",
            opts = { type = "relative" },
          },
          icon = "",
          hl = "FelineWBISeg0",
        },
      },
    },
  },
})
