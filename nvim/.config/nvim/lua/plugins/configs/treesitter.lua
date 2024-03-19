local treesitter = require("nvim-treesitter.configs")

-- See: https://github.com/nvim-treesitter/nvim-treesitter#modules
treesitter.setup({
  auto_install = true,
  highlight = { enable = true },
  indent = { enable = true },
  ensure_installed = {
    "bash",
    "css",
    "dockerfile",
    "fish",
    "go",
    "html",
    "javascript",
    "json",
    "lua",
    "markdown",
    "markdown_inline",
    "regex",
    "rust",
    "scss",
    "sql",
    "toml",
    "typescript",
    "vim",
    "vue",
    "yaml",
  },
})
