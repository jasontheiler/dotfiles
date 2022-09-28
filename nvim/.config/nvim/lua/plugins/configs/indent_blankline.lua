local isInstalled, indent_blankline = pcall(require, "indent_blankline")

if not isInstalled then
  return
end

indent_blankline.setup({})
