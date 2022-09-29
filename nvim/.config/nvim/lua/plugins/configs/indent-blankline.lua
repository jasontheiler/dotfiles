local is_installed, indent_blankline = pcall(require, "indent_blankline")

if not is_installed then
  return
end

-- See: https://github.com/lukas-reineke/indent-blankline.nvim#setup
indent_blankline.setup({})
