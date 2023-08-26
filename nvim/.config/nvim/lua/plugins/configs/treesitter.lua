local treesitter = require("nvim-treesitter.configs")

-- See: https://github.com/nvim-treesitter/nvim-treesitter#modules
treesitter.setup({
  auto_install = true,
  highlight = { enable = true },
  indent = { enable = true },
})
