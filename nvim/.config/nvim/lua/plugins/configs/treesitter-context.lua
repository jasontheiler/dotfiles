local treesitter_context = require("treesitter-context")

-- See: https://github.com/nvim-treesitter/nvim-treesitter-context#configuration
treesitter_context.setup({
  multiline_threshold = 1,
  separator = "─"
})
