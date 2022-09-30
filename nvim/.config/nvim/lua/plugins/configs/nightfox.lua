local is_installed, nightfox = pcall(require, "nightfox")

if not is_installed then
  return
end

-- See: https://github.com/EdenEast/nightfox.nvim#configuration
nightfox.setup({})

vim.cmd("colorscheme nightfox")
