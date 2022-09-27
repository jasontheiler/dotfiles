require("lualine").setup({
  options = {
    theme = "horizon",
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
  }
})
