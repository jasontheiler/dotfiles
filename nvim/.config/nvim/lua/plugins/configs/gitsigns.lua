local is_installed, gitsigns = pcall(require, "gitsigns")

if not is_installed then
  return
end

gitsigns.setup({})
