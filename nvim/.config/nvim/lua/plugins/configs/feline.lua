local feline = require("feline")

local vi_mode = {
  provider = "vi_mode",
  icon = "",
}

-- See: https://github.com/feline-nvim/feline.nvim/blob/master/USAGE.md
feline.setup({
  components = {
    active = {
      -- left
      {
        vi_mode,
      },
      -- right
      {

      }
    },
    inactive = {},
  },
})
