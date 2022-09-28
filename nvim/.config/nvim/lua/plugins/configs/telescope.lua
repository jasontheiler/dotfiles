local is_installed, telescope = pcall(require, "telescope")

if not is_installed then
  return
end

telescope.setup({})
