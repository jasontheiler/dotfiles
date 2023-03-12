local feline = require("feline")
local with_pad_seps = require("plugins/configs/feline/utils").with_pad_seps

-- See: https://github.com/feline-nvim/feline.nvim/blob/master/USAGE.md
feline.winbar.setup({
  components = {
    active = {
      -- left
      {},
      -- right
      {
        with_pad_seps({
          provider = {
            name = "file_info",
            opts = { type = "relative", file_readonly_icon = " " },
          },
          icon = "",
          hl = "FelineWBSeg0",
        }),
      },
    },
    inactive = {
      -- left
      {},
      -- right
      {
        with_pad_seps({
          provider = {
            name = "file_info",
            opts = { type = "relative", file_readonly_icon = " " },
          },
          icon = "",
          hl = "FelineWBISeg0",
        }),
      },
    },
  },
})
