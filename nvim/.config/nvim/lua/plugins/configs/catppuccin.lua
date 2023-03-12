local catppuccin = require("catppuccin")
local color_utils = require("catppuccin/utils/colors")

-- See: https://github.com/catppuccin/nvim#configuration
catppuccin.setup({
  flavour = "mocha",
  transparent_background = true,
  styles = {
    conditionals = {},
  },
  integrations = {
    underlines = {
      errors = { "undercurl" },
      hints = { "undercurl" },
      warnings = { "undercurl" },
      information = { "undercurl" },
    }
  },
  highlight_overrides = {
    mocha = function(palette)
      return {
        ["@namespace"] = { style = {} },
        ["@parameter"] = { style = {} },
        ["@tag.attribute"] = { style = {} },
        BufferLineBufferSelected = { fg = palette.text },
        BufferLineNumbersSelected = { fg = palette.text },
        CmpCompletionBorder = { fg = palette.lavender },
        CmpDocumentationBorder = { fg = palette.lavender },
        CmpItemAbbr = { fg = palette.text },
        CmpItemAbbrMatch = { fg = palette.blue },
        FidgetTitle = { fg = palette.teal },
        FloatBorder = { fg = palette.lavender },
        HeirlineWinbar = { fg = palette.text },
        HeirlineWinbarInactive = { fg = palette.surface2 },
        NormalFloat = { fg = palette.text, bg = palette.none },
        Pmenu = { fg = palette.text, bg = palette.base },
        PmenuSbar = { bg = palette.surface0 },
        PmenuSel = { fg = palette.base, bg = palette.lavender },
        PmenuThumb = { bg = palette.lavender },
        TelescopeBorder = { fg = palette.lavender },
        TelescopePromptTitle = { fg = palette.flamingo },
        TelescopeSelection = { fg = palette.text, bg = palette.surface0 },
        TelescopeSelectionCaret = { bg = palette.surface0 },
        TreesitterContext = { bg = palette.none },
        TreesitterContextLineNumber = { fg = palette.overlay0 },
        VirtColumn = { fg = palette.surface0 },
        YankHighlight = { bg = color_utils.darken(palette.rosewater, 0.33, palette.base) },
      }
    end,
  },
})

vim.cmd("colorscheme catppuccin")
