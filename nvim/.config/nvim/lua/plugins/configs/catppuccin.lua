local catppuccin = require("catppuccin")

-- See: https://github.com/catppuccin/nvim#configuration
catppuccin.setup({
  flavour = "mocha",
  styles = {
    conditionals = {},
  },
  highlight_overrides = {
    mocha = function(palette)
      return {
        ["@namespace"] = { style = {} },
        ["@parameter"] = { style = {} },
        ["@tag.attribute"] = { style = {} },

        CmpCompletionBorder = { fg = palette.lavender },
        CmpDocumentationBorder = { fg = palette.lavender },
        CmpItemAbbr = { fg = palette.text },
        CmpItemAbbrMatch = { fg = palette.blue },

        DiagnosticUnderlineError = { style = { "undercurl" }, sp = palette.red },
        DiagnosticUnderlineWarn = { style = { "undercurl" }, sp = palette.yellow },
        DiagnosticUnderlineInfo = { style = { "undercurl" }, sp = palette.sky },
        DiagnosticUnderlineHint = { style = { "undercurl" }, sp = palette.teal },

        FelineSLBg = { bg = palette.base },
        FelineSLSeg0 = { fg = palette.subtext0, bg = palette.mantle },
        FelineSLSeg0ToSeg1 = { fg = palette.mantle, bg = palette.surface0 },
        FelineSLSeg1 = { fg = palette.text, bg = palette.surface0 },
        FelineSLViModeNormal = { fg = palette.base, bg = palette.blue },
        FelineSLViModeNormalToSeg0 = { fg = palette.blue, bg = palette.mantle },
        FelineSLViModeInsert = { fg = palette.base, bg = palette.green },
        FelineSLViModeInsertToSeg0 = { fg = palette.green, bg = palette.mantle },
        FelineSLViModeReplace = { fg = palette.base, bg = palette.red },
        FelineSLViModeReplaceToSeg0 = { fg = palette.red, bg = palette.mantle },
        FelineSLViModeVisual = { fg = palette.base, bg = palette.pink },
        FelineSLViModeVisualToSeg0 = { fg = palette.pink, bg = palette.mantle },
        FelineSLViModeCommand = { fg = palette.base, bg = palette.peach },
        FelineSLViModeCommandToSeg0 = { fg = palette.peach, bg = palette.mantle },
        FelineSLSeg1ToGitAdded = { fg = palette.surface0, bg = palette.green },
        FelineSLGitAdded = { fg = palette.base, bg = palette.green },
        FelineSLGitAddedToGitChanged = { fg = palette.green, bg = palette.yellow },
        FelineSLGitChanged = { fg = palette.base, bg = palette.yellow },
        FelineSLGitChangedToGitRemoved = { fg = palette.yellow, bg = palette.red },
        FelineSLGitRemoved = { fg = palette.base, bg = palette.red },
        FelineSLGitRemovedToBg = { fg = palette.red, bg = palette.base },
        FelineSLLSPToBg = { fg = palette.pink, bg = palette.base },
        FelineSLLSP = { fg = palette.base, bg = palette.pink },
        FelineSLDiagErrorsToLSP = { fg = palette.red, bg = palette.pink },
        FelineSLDiagErrors = { fg = palette.base, bg = palette.red },
        FelineSLDiagWarningsToDiagErrors = { fg = palette.yellow, bg = palette.red },
        FelineSLDiagWarnings = { fg = palette.base, bg = palette.yellow },
        FelineSLDiagInfoToDiagWarnings = { fg = palette.sky, bg = palette.yellow },
        FelineSLDiagInfo = { fg = palette.base, bg = palette.sky },
        FelineSLDiagHintsToDiagInfo = { fg = palette.teal, bg = palette.sky },
        FelineSLDiagHints = { fg = palette.base, bg = palette.teal },
        FelineSLSeg1ToDiagHints = { fg = palette.surface0, bg = palette.teal },
        FelineWBSeg0 = { fg = palette.text, bg = palette.base },
        FelineWBISeg0 = { fg = palette.surface2, bg = palette.base },

        FidgetTitle = { fg = palette.teal },

        FloatBorder = { fg = palette.lavender },

        Pmenu = { fg = palette.text, bg = palette.base },
        PmenuSbar = { bg = palette.surface0 },
        PmenuSel = { fg = palette.base, bg = palette.lavender },
        PmenuThumb = { bg = palette.lavender },

        ScrollbarHandle = { bg = palette.surface0 },
        ScrollbarError = { fg = palette.red },
        ScrollbarErrorHandle = { fg = palette.red, bg = palette.surface0 },
        ScrollbarWarn = { fg = palette.yellow },
        ScrollbarWarnHandle = { fg = palette.yellow, bg = palette.surface0 },
        ScrollbarInfo = { fg = palette.sky },
        ScrollbarInfoHandle = { fg = palette.sky, bg = palette.surface0 },
        ScrollbarHint = { fg = palette.teal },
        ScrollbarHintHandle = { fg = palette.teal, bg = palette.surface0 },

        TelescopeBorder = { fg = palette.lavender },
        TelescopePromptTitle = { fg = palette.flamingo },
        TelescopeSelectionCaret = { bg = palette.surface0 },
      }
    end,
  },
})

vim.cmd("colorscheme catppuccin")