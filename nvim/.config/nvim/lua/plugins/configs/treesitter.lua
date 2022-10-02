local is_installed, treesitter = pcall(require, "nvim-treesitter.configs")

if not is_installed then
  return
end

-- See: https://github.com/nvim-treesitter/nvim-treesitter#modules
treesitter.setup({
  -- See: https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
  ensure_installed = {
    "css",
    "dockerfile",
    "fish",
    "gitignore",
    "html",
    "javascript",
    "jsdoc",
    "json",
    "json5",
    "jsonc",
    "lua",
    "markdown",
    "markdown_inline",
    "rust",
    "toml",
    "typescript",
    "vue",
    "yaml",
  },
  auto_install = true,
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
})
