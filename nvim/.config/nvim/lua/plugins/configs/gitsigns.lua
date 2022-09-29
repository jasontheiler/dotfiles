local is_installed, gitsigns = pcall(require, "gitsigns")

if not is_installed then
  return
end

-- See: https://github.com/lewis6991/gitsigns.nvim#usage
gitsigns.setup({})
