-- See: https://github.com/catppuccin/nvim
return {
  "catppuccin/nvim",
  lazy = false,
  priority = math.huge,
  config = function()
    local catppuccin = require("catppuccin")
    local color_utils = require("catppuccin.utils.colors")

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
        -- mocha = {                -- Warm
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
        mocha = {                -- Neo
          rosewater = "#FFCDCD", --
          flamingo = "#FFCDCD",  --
          pink = "#E3AAFF",      -- terminal magenta, terminal bright magenta
          mauve = "#E3AAFF",     --
          red = "#FB7FB4",       -- terminal red, terminal bright red
          maroon = "#F394B8",    --
          peach = "#FFB79B",     --
          yellow = "#F9E6B8",    -- terminal yellow, terminal bright yellow
          green = "#B3F6C0",     -- terminal green, terminal bright green
          teal = "#8CF8F7",      -- terminal cyan, terminal bright cyan
          sky = "#8CF8F7",       --
          sapphire = "#8CF8F7",  --
          blue = "#A6DBFF",      -- terminal blue, terminal bright blue
          lavender = "#C4BEFF",  --
          text = "#E0E2EA",      -- terminal white, terminal bright white, terminal foreground, terminal cursor
          subtext1 = "#B9BCC7",  --
          subtext0 = "#A5A8B5",  --
          overlay2 = "#9295A4",  -- punctuation, brackets
          overlay1 = "#7E8192",  --
          overlay0 = "#6B6D81",  -- comments
          surface2 = "#585A6F",  --
          surface1 = "#45475D",  -- line numbers, selection, terminal black, terminal bright black
          surface0 = "#32334B",  --
          base = "#14161B",      -- terminal background
          mantle = "#0C0E13",    --
          crust = "#04060B",     --
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
            FloatBorder = { fg = palette.lavender, bg = palette.none },
            HeirlineBuflineBuf = { fg = palette.text, style = { "bold" } },
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
  end,
}
