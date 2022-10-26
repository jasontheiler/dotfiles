local catppuccin = require("catppuccin")

-- See: https://github.com/catppuccin/nvim#configuration
catppuccin.setup({
  flavour = "mocha",
  styles = {
    conditionals = {},
  },
  highlight_overrides = {
    mocha = function(mocha)
      return {
        ["@namespace"] = { style = {} },
        ["@parameter"] = { style = {} },
        ["@tag.attribute"] = { style = {} },

        CmpCompletionBorder = { fg = mocha.lavender },
        CmpDocumentationBorder = { fg = mocha.lavender },
        CmpItemAbbr = { fg = mocha.text },
        CmpItemAbbrMatch = { fg = mocha.blue },

        DiagnosticUnderlineError = { style = { "undercurl" }, sp = mocha.red },
        DiagnosticUnderlineWarn = { style = { "undercurl" }, sp = mocha.yellow },
        DiagnosticUnderlineInfo = { style = { "undercurl" }, sp = mocha.sky },
        DiagnosticUnderlineHint = { style = { "undercurl" }, sp = mocha.teal },

        FelineSLBg = { bg = mocha.base },
        FelineSLSeg0 = { fg = mocha.subtext0, bg = mocha.mantle },
        FelineSLSeg0ToSeg1 = { fg = mocha.mantle, bg = mocha.surface0 },
        FelineSLSeg1 = { fg = mocha.text, bg = mocha.surface0 },
        FelineSLViModeNormal = { fg = mocha.base, bg = mocha.blue },
        FelineSLViModeNormalToSeg0 = { fg = mocha.blue, bg = mocha.mantle },
        FelineSLViModeInsert = { fg = mocha.base, bg = mocha.green },
        FelineSLViModeInsertToSeg0 = { fg = mocha.green, bg = mocha.mantle },
        FelineSLViModeReplace = { fg = mocha.base, bg = mocha.red },
        FelineSLViModeReplaceToSeg0 = { fg = mocha.red, bg = mocha.mantle },
        FelineSLViModeVisual = { fg = mocha.base, bg = mocha.pink },
        FelineSLViModeVisualToSeg0 = { fg = mocha.pink, bg = mocha.mantle },
        FelineSLViModeCommand = { fg = mocha.base, bg = mocha.peach },
        FelineSLViModeCommandToSeg0 = { fg = mocha.peach, bg = mocha.mantle },
        FelineSLSeg1ToGitAdded = { fg = mocha.surface0, bg = mocha.green },
        FelineSLGitAdded = { fg = mocha.base, bg = mocha.green },
        FelineSLGitAddedToGitChanged = { fg = mocha.green, bg = mocha.yellow },
        FelineSLGitChanged = { fg = mocha.base, bg = mocha.yellow },
        FelineSLGitChangedToGitRemoved = { fg = mocha.yellow, bg = mocha.red },
        FelineSLGitRemoved = { fg = mocha.base, bg = mocha.red },
        FelineSLGitRemovedToBg = { fg = mocha.red, bg = mocha.base },
        FelineSLLSPToBg = { fg = mocha.pink, bg = mocha.base },
        FelineSLLSP = { fg = mocha.base, bg = mocha.pink },
        FelineSLDiagErrorsToLSP = { fg = mocha.red, bg = mocha.pink },
        FelineSLDiagErrors = { fg = mocha.base, bg = mocha.red },
        FelineSLDiagWarningsToDiagErrors = { fg = mocha.yellow, bg = mocha.red },
        FelineSLDiagWarnings = { fg = mocha.base, bg = mocha.yellow },
        FelineSLDiagInfoToDiagWarnings = { fg = mocha.sky, bg = mocha.yellow },
        FelineSLDiagInfo = { fg = mocha.base, bg = mocha.sky },
        FelineSLDiagHintsToDiagInfo = { fg = mocha.teal, bg = mocha.sky },
        FelineSLDiagHints = { fg = mocha.base, bg = mocha.teal },
        FelineSLSeg1ToDiagHints = { fg = mocha.surface0, bg = mocha.teal },
        FelineWBSeg0 = { fg = mocha.text, bg = mocha.base },
        FelineWBISeg0 = { fg = mocha.surface2, bg = mocha.base },

        FidgetTitle = { fg = mocha.teal },

        FloatBorder = { fg = mocha.lavender },

        Pmenu = { fg = mocha.text, bg = mocha.base },
        PmenuSbar = { bg = mocha.surface0 },
        PmenuSel = { fg = mocha.base, bg = mocha.lavender },
        PmenuThumb = { bg = mocha.lavender },

        TelescopeBorder = { fg = mocha.lavender },
        TelescopePromptTitle = { fg = mocha.flamingo },
        TelescopeSelectionCaret = { bg = mocha.surface0 },
      }
    end,
  },
})

vim.cmd("colorscheme catppuccin")
