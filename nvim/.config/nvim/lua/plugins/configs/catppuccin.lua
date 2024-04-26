local catppuccin = require("catppuccin")
local color_utils = require("catppuccin/utils/colors")

-- See: https://github.com/catppuccin/nvim#configuration
catppuccin.setup({
  flavour = "mocha",
  transparent_background = false,
  styles = {
    conditionals = {},
  },
  integrations = {
    native_lsp = {
      enabled = true,
      underlines = {
        errors = { "undercurl" },
        warnings = { "undercurl" },
        information = { "undercurl" },
        hints = { "undercurl" },
      },
    },
  },
  color_overrides = {
    mocha = {
      rosewater = "#DAA992",
      flamingo = "#DAA992",
      pink = "#C386BB", -- terminal magenta, terminal bright magenta
      mauve = "#C386BB",
      red = "#EA6962",  -- terminal red, terminal bright red
      maroon = "#D3869B",
      peach = "#DD7F4E",
      yellow = "#E8C677", -- terminal yellow, terminal bright yellow
      green = "#A9B665",  -- terminal green, terminal bright green
      teal = "#89B482",   -- terminal cyan, terminal bright cyan
      sky = "#89B482",
      sapphire = "#89B482",
      blue = "#7DAEB3", -- terminal blue, terminal bright blue
      lavender = "#BDAEC3",
      text = "#E4CEA8", -- terminal white, terminal bright white, terminal foreground, terminal cursor
      subtext1 = "#DCC6A0",
      subtext0 = "#D4BE98",
      overlay2 = "#877360", -- punctuation, brackets
      overlay1 = "#7D6C60",
      overlay0 = "#75615B", -- comments
      surface2 = "#615556",
      surface1 = "#534747", -- line numbers, selection, terminal black, terminal bright black
      surface0 = "#433737",
      base = "#211D1D",     -- terminal background
      mantle = "#191414",
      crust = "#110D0D",
    },
  },
  highlight_overrides = {
    mocha = function(palette)
      return {
        ["@module"] = { style = {} },
        ["@namespace"] = { style = {} },
        ["@parameter"] = { style = {} },
        ["@tag.attribute"] = { style = {} },
        CmpCompletionBorder = { fg = palette.lavender },
        CmpDocumentationBorder = { fg = palette.lavender },
        CmpItemAbbr = { fg = palette.text },
        CmpItemAbbrMatch = { fg = palette.blue },
        CursorLineNrNormal = { fg = palette.blue },
        CursorLineNrVisual = { fg = palette.pink },
        CursorLineNrInsert = { fg = palette.green },
        CursorLineNrReplace = { fg = palette.red },
        CursorLineNrCommand = { fg = palette.peach },
        FidgetAnnoteDebug = { fg = palette.blue },
        FidgetAnnoteError = { fg = palette.red },
        FidgetAnnoteInfo = { fg = palette.green },
        FidgetAnnoteWarn = { fg = palette.yellow },
        FidgetBase = { fg = palette.overlay0 },
        FidgetDone = { fg = palette.text },
        FidgetGroup = { fg = palette.teal },
        FidgetIcon = { fg = palette.teal },
        FloatBorder = { fg = palette.lavender },
        HeirlineBuflineBuf = { fg = palette.text },
        HeirlineBuflineBufInactive = { fg = palette.surface2 },
        HeirlineWinbar = { fg = palette.text },
        HeirlineWinbarInactive = { fg = palette.surface2 },
        LspReferenceRead = { bg = color_utils.darken(palette.rosewater, 0.125, palette.base) },
        LspReferenceText = { bg = color_utils.darken(palette.rosewater, 0.125, palette.base) },
        LspReferenceWrite = { bg = color_utils.darken(palette.rosewater, 0.125, palette.base) },
        NormalFloat = { fg = palette.text, bg = palette.none },
        Pmenu = { fg = palette.text, bg = palette.none },
        PmenuSbar = { bg = palette.surface0 },
        PmenuSel = { bg = palette.surface0 },
        PmenuThumb = { bg = palette.lavender },
        TelescopeSelection = { fg = palette.text, bg = palette.surface0 },
        TelescopeSelectionCaret = { bg = palette.surface0 },
        TreesitterContextBottom = { style = {} },
        TreesitterContextLineNumber = { fg = palette.surface1, bg = palette.base },
        TreesitterContextSeparator = { fg = palette.surface0 },
        VertSplit = { fg = palette.crust },
        VirtColumn = { fg = palette.surface0 },
        YankHighlight = { bg = color_utils.darken(palette.rosewater, 0.5, palette.base) },
      }
    end,
  },
})

vim.cmd("colorscheme catppuccin")
