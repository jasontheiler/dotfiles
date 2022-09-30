local is_installed, nvim_treesitter_context = pcall(require, "treesitter-context")

if not is_installed then
  return
end

-- See: https://github.com/nvim-treesitter/nvim-treesitter-context#configuration
nvim_treesitter_context.setup({})
