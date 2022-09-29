local is_installed, tokyonight = pcall(require, "tokyonight")

if not is_installed then
  return
end

-- See: https://github.com/folke/tokyonight.nvim#%EF%B8%8F-configuration
tokyonight.setup({
  style = "night",
})

vim.cmd([[colorscheme tokyonight]])
