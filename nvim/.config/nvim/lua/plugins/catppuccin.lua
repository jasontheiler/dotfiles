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
        mocha = {            -- Ocean Foam
          green = "#73E9CD", -- terminal green, terminal bright green
        },
        -- mocha = {                -- Cocoa
        --   rosewater = "#DAA992", --
        --   flamingo = "#DAA992",  --
        --   pink = "#C386BB",      -- terminal magenta, terminal bright magenta
        --   mauve = "#C386BB",     --
        --   red = "#EA6962",       -- terminal red, terminal bright red
        --   maroon = "#D3869B",    --
        --   peach = "#DD7F4E",     --
        --   yellow = "#E8C677",    -- terminal yellow, terminal bright yellow
        --   green = "#A9B665",     -- terminal green, terminal bright green
        --   teal = "#89B482",      -- terminal cyan, terminal bright cyan
        --   sky = "#89B482",       --
        --   sapphire = "#89B482",  --
        --   blue = "#7DAEB3",      -- terminal blue, terminal bright blue
        --   lavender = "#BDAEC3",  --
        --   text = "#E4CEA8",      -- terminal white, terminal bright white, terminal foreground, terminal cursor
        --   subtext1 = "#DCC6A0",  --
        --   subtext0 = "#D4BE98",  --
        --   overlay2 = "#877360",  -- punctuation, brackets
        --   overlay1 = "#7D6C60",  --
        --   overlay0 = "#75615B",  -- comments
        --   surface2 = "#615556",  --
        --   surface1 = "#534747",  -- line numbers, selection, terminal black, terminal bright black
        --   surface0 = "#433737",  --
        --   base = "#211D1D",      -- terminal background
        --   mantle = "#191414",    --
        --   crust = "#110D0D",     --
        -- },
        -- mocha = {                -- Neo
        --   rosewater = "#FFCDCD", --
        --   flamingo = "#FFCDCD",  --
        --   pink = "#E3AAFF",      -- terminal magenta, terminal bright magenta
        --   mauve = "#E3AAFF",     --
        --   red = "#fF87BC",       -- terminal red, terminal bright red
        --   maroon = "#F394B8",    --
        --   peach = "#FFB7AB",     --
        --   yellow = "#F9E6C0",    -- terminal yellow, terminal bright yellow
        --   green = "#B3F6C0",     -- terminal green, terminal bright green
        --   teal = "#8CF8F7",      -- terminal cyan, terminal bright cyan
        --   sky = "#8CF8F7",       --
        --   sapphire = "#8CF8F7",  --
        --   blue = "#A6DBFF",      -- terminal blue, terminal bright blue
        --   lavender = "#C4BEFF",  --
        --   text = "#E0E2EA",      -- terminal white, terminal bright white, terminal foreground, terminal cursor
        --   subtext1 = "#B9BCC7",  --
        --   subtext0 = "#A5A8B5",  --
        --   overlay2 = "#9295A4",  -- punctuation, brackets
        --   overlay1 = "#7E8192",  --
        --   overlay0 = "#6B6D81",  -- comments
        --   surface2 = "#585A6F",  --
        --   surface1 = "#45475D",  -- line numbers, selection, terminal black, terminal bright black
        --   surface0 = "#32334B",  --
        --   base = "#14161B",      -- terminal background
        --   mantle = "#0C0E13",    --
        --   crust = "#04060B",     --
        -- },
      },
      highlight_overrides = {
        mocha = function(palette)
          return {
            ["@module"] = { style = {} },
            ["@namespace"] = { style = {} },
            ["@parameter"] = { style = {} },
            ["@tag.attribute"] = { style = {} },
            BlinkCmpLabel = { link = "Pmenu" },
            BlinkCmpLabelDeprecated = { fg = palette.surface1 },
            BlinkCmpLabelMatch = { fg = palette.blue },
            BlinkCmpMenuBorder = { link = "Pmenu" },
            BlinkCmpScrollBarGutter = { link = "PmenuSbar" },
            BlinkCmpScrollBarThumb = { link = "PmenuThumb" },
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
            FloatBorder = { fg = palette.text, bg = palette.none },
            FloatTitle = { fg = palette.text, bg = palette.none },
            HeirlineBuflineBuf = { fg = palette.text, style = { "bold" } },
            HeirlineBuflineBufNC = { fg = palette.surface1 },
            NonText = { fg = palette.surface1 },
            NormalFloat = { fg = palette.text, bg = palette.none },
            Pmenu = { fg = palette.text, bg = palette.none },
            PmenuSbar = { bg = palette.text },
            PmenuSel = { bg = palette.surface1, style = { "bold" } },
            PmenuThumb = { bg = palette.text },
            StatusLine = { fg = palette.surface1, bg = palette.base },
            StatusLineNC = { fg = palette.surface1, bg = palette.base },
            TabLine = { bg = palette.base },
            TabLineFill = { bg = palette.base },
            TelescopePromptPrefix = { fg = palette.green },
            TelescopeSelection = { fg = palette.text, bg = palette.surface1 },
            TelescopeSelectionCaret = { fg = palette.blue, bg = palette.surface1 },
            TreesitterContextBottom = { style = {} },
            TreesitterContextLineNumber = { fg = palette.surface1, bg = palette.base },
            TreesitterContextSeparator = { fg = palette.surface1 },
            VertSplit = { fg = palette.surface1 },
            WhichKeyDesc = { fg = palette.text },
            WhichKeyGroup = { fg = palette.green },
            WhichKeySeparator = { fg = palette.surface1, style = {} },
            WinBar = { fg = palette.text, style = { "bold" } },
            WinBarNC = { fg = palette.surface1 },
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
