-- See: https://github.com/nvim-treesitter/nvim-treesitter
return {
  "nvim-treesitter/nvim-treesitter",
  event = "VeryLazy",
  main = "nvim-treesitter.configs",
  -- See: https://github.com/nvim-treesitter/nvim-treesitter#modules
  opts = {
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
  },
}
