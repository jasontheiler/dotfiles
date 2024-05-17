-- See: https://github.com/lewis6991/satellite.nvim
return {
  "lewis6991/satellite.nvim",
  event = "VeryLazy",
  -- See: https://github.com/lewis6991/satellite.nvim#configuration
  opts = {
    winblend = 0,
    handlers = {
      cursor = { enable = false },
    },
  },
}
