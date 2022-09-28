local is_installed, indent_blankline = pcall(require, "indent_blankline")

if not is_installed then
  return
end

indent_blankline.setup({})
