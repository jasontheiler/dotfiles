local isInstalled, gitsigns = pcall(require, "gitsigns")

if not isInstalled then
  return
end

gitsigns.setup({})
