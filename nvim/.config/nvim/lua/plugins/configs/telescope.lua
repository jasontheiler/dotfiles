local is_installed, telescope = pcall(require, "telescope")

if not is_installed then
  return
end

-- See: https://github.com/nvim-telescope/telescope.nvim#customization
telescope.setup({})
