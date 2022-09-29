local is_installed, lualine = pcall(require, "lualine")

if not is_installed then
  return
end

-- See: https://github.com/nvim-lualine/lualine.nvim#usage-and-customization
lualine.setup({
  options = {
    theme = "tokyonight",
    component_separators = '',
    section_separators = ' ',
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = {},
    lualine_c = {
      'branch',
      'diff',
      {
        'filename',
        symbols = {
          modified = "●",
          readonly = "(readonly)",
          unnamed = "unnamed file",
        },
      },
      'diagnostics',
    },
    lualine_x = { 'encoding', 'filetype' },
    lualine_y = {},
    lualine_z = {},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      {
        'filename',
        symbols = {
          modified = "●",
          readonly = "(readonly)",
          unnamed = "unnamed file",
        },
      },
      'diagnostics',
    },
    lualine_x = { 'encoding', 'filetype' },
    lualine_y = {},
    lualine_z = {},
  },
})
