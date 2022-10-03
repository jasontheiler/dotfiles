local indent_blankline = require("indent_blankline")

-- See: https://github.com/lukas-reineke/indent-blankline.nvim#setup
indent_blankline.setup({
  use_treesitter = true,
  show_trailing_blankline_indent = false,
})
