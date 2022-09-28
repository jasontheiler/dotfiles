local isInstalled, telescope = pcall(require, "telescope")

if not isInstalled then
  return
end

telescope.setup({})
