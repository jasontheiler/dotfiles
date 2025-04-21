--- See: https://github.com/catppuccin/nvim
---
--- @type LazyPluginSpec
return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = math.huge,
  config = function()
    local catppuccin = require("catppuccin")
    local catppuccin_utils_colors = require("catppuccin.utils.colors")

    -- See: https://github.com/catppuccin/nvim#configuration
    catppuccin.setup({
      flavour = "mocha",
      transparent_background = false,
      styles = { conditionals = {} },
      integrations = {
        native_lsp = {
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
          rosewater = os.getenv("CATPPUCCIN_ROSEWATER"), --
          flamingo = os.getenv("CATPPUCCIN_FLAMINGO"),   --
          pink = os.getenv("CATPPUCCIN_PINK"),           -- terminal magenta, terminal bright magenta
          mauve = os.getenv("CATPPUCCIN_MAUVE"),         --
          red = os.getenv("CATPPUCCIN_RED"),             -- terminal red, terminal bright red
          maroon = os.getenv("CATPPUCCIN_MAROON"),       --
          peach = os.getenv("CATPPUCCIN_PEACH"),         --
          yellow = os.getenv("CATPPUCCIN_YELLOW"),       -- terminal yellow, terminal bright yellow
          green = os.getenv("CATPPUCCIN_GREEN"),         -- terminal green, terminal bright green
          teal = os.getenv("CATPPUCCIN_TEAL"),           -- terminal cyan, terminal bright cyan
          sky = os.getenv("CATPPUCCIN_SKY"),             --
          sapphire = os.getenv("CATPPUCCIN_SAPPHIRE"),   --
          blue = os.getenv("CATPPUCCIN_BLUE"),           -- terminal blue, terminal bright blue
          lavender = os.getenv("CATPPUCCIN_LAVENDER"),   --
          text = os.getenv("CATPPUCCIN_TEXT"),           -- terminal white, terminal bright white, terminal foreground, terminal cursor
          subtext1 = os.getenv("CATPPUCCIN_SUBTEXT1"),   --
          subtext0 = os.getenv("CATPPUCCIN_SUBTEXT0"),   --
          overlay2 = os.getenv("CATPPUCCIN_OVERLAY2"),   -- punctuation, brackets
          overlay1 = os.getenv("CATPPUCCIN_OVERLAY1"),   --
          overlay0 = os.getenv("CATPPUCCIN_OVERLAY0"),   -- comments
          surface2 = os.getenv("CATPPUCCIN_SURFACE2"),   --
          surface1 = os.getenv("CATPPUCCIN_SURFACE1"),   -- line numbers, selection, terminal black, terminal bright black
          surface0 = os.getenv("CATPPUCCIN_SURFACE0"),   --
          base = os.getenv("CATPPUCCIN_BASE"),           -- terminal background
          mantle = os.getenv("CATPPUCCIN_MANTLE"),       --
          crust = os.getenv("CATPPUCCIN_CRUST"),         --
        },
      },
      highlight_overrides = {
        mocha = function(palette)
          return {
            ["@module"] = { style = {} },
            ["@namespace"] = { style = {} },
            ["@parameter"] = { style = {} },
            ["@tag.attribute"] = { style = {} },
            BlinkCmpDocBorder = { fg = palette.peach },
            BlinkCmpDocSeparator = { fg = palette.surface0 },
            BlinkCmpGhostText = { fg = palette.surface1 },
            BlinkCmpLabel = { fg = palette.text },
            BlinkCmpLabelMatch = { fg = palette.blue },
            BlinkCmpMenuBorder = { fg = palette.peach },
            CursorLineNrNormal = { fg = palette.blue, style = { "bold" } },
            CursorLineNrVisual = { fg = palette.pink, style = { "bold" } },
            CursorLineNrInsert = { fg = palette.green, style = { "bold" } },
            CursorLineNrReplace = { fg = palette.red, style = { "bold" } },
            CursorLineNrCommand = { fg = palette.peach, style = { "bold" } },
            FidgetNormal = { fg = palette.overlay0 },
            FidgetNotificationAnnoteDebug = { fg = palette.blue, style = { "bold" } },
            FidgetNotificationAnnoteError = { fg = palette.red, style = { "bold" } },
            FidgetNotificationAnnoteInfo = { fg = palette.green, style = { "bold" } },
            FidgetNotificationAnnoteWarn = { fg = palette.yellow, style = { "bold" } },
            FidgetProgressDone = { fg = palette.text },
            FidgetProgressGroup = { fg = palette.teal, style = { "bold" } },
            FidgetProgressIcon = { fg = palette.teal, style = { "bold" } },
            FloatBorder = { fg = palette.peach, bg = palette.none },
            HeirlineBuflineBuf = { fg = palette.text, style = { "bold" } },
            HeirlineBuflineBufNC = { fg = palette.surface2 },
            NonText = { fg = palette.surface0 },
            NormalFloat = { fg = palette.text, bg = palette.none },
            Pmenu = { fg = palette.text, bg = palette.none },
            PmenuSbar = { bg = palette.surface0 },
            PmenuSel = { bg = palette.surface0 },
            PmenuThumb = { bg = palette.peach },
            StatusLine = { fg = palette.crust, bg = palette.base },
            StatusLineNC = { fg = palette.crust, bg = palette.base },
            TabLine = { bg = palette.base },
            TabLineFill = { bg = palette.base },
            TelescopePromptPrefix = { fg = palette.green },
            TelescopeSelection = { fg = palette.text, bg = palette.surface0 },
            TelescopeSelectionCaret = { fg = palette.blue, bg = palette.surface0 },
            TreesitterContextBottom = { style = {} },
            TreesitterContextLineNumber = { fg = palette.surface1, bg = palette.base },
            TreesitterContextSeparator = { fg = palette.surface0 },
            VertSplit = { fg = palette.crust },
            WinBar = { fg = palette.text, style = { "bold" } },
            WinBarNC = { fg = palette.surface2 },
            YankHighlight = {
              bg = catppuccin_utils_colors.darken(palette.rosewater, 0.5, palette.base),
            },
          }
        end,
      },
    })

    vim.cmd("colorscheme catppuccin")
  end,
}
