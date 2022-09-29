local is_installed, nvim_treesitter = pcall(require, "nvim-treesitter.configs")

if not is_installed then
  return
end

-- See: https://github.com/nvim-treesitter/nvim-treesitter#modules
nvim_treesitter.setup({
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
