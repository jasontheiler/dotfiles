local isInstalled, treesitter = pcall(require, "nvim-treesitter.configs")

if not isInstalled then
  return
end

treesitter.setup({
  ensure_installed = {
    "css",
    "dockerfile",
    "fish",
    "gitignore",
    "html",
    "javascript",
    "json",
    "json5",
    "jsonc",
    "lua",
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
