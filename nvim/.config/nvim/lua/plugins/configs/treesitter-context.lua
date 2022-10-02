local is_installed, treesitter_context = pcall(require, "treesitter-context")

if not is_installed then
  return
end

-- See: https://github.com/nvim-treesitter/nvim-treesitter-context#configuration
treesitter_context.setup({})
