local nightfox = require("nightfox")
local shade = require("nightfox/lib/shade")

-- See: https://github.com/EdenEast/nightfox.nvim#configuration
nightfox.setup({
  palettes = {
    terafox = {
      bg0 = "#0b0d0f",
      bg1 = "#111316",
      bg2 = "#191d22",
      bg3 = "#222b30",
      green = shade.new("#6ab4af", "#82beb9", "#579c98"),
    },
  },
  groups = {
    all = {
      DiagnosticUnderlineError = { style = "undercurl", bg = "diag_bg.error", sp = "diag.error" },
      DiagnosticUnderlineWarn = { style = "undercurl", bg = "diag_bg.warn", sp = "diag.warn" },
      DiagnosticUnderlineInfo = { style = "undercurl", bg = "diag_bg.info", sp = "diag.info" },
      DiagnosticUnderlineHint = { style = "undercurl", bg = "diag_bg.hint", sp = "diag.hint" },

      FelineSLBg = { bg = "palette.bg1" },

      FelineSLSeg0 = { fg = "palette.fg2", bg = "palette.bg0" },
      FelineSLSeg0ToSeg1 = { fg = "palette.bg0", bg = "palette.bg2" },
      FelineSLSeg1 = { fg = "palette.fg1", bg = "palette.bg2" },

      FelineSLViModeRed = { fg = "palette.bg0", bg = "palette.red" },
      FelineSLViModeRedToSeg0 = { fg = "palette.red", bg = "palette.bg0" },
      FelineSLViModeGreen = { fg = "palette.bg0", bg = "palette.green" },
      FelineSLViModeGreenToSeg0 = { fg = "palette.green", bg = "palette.bg0" },
      FelineSLViModeYellow = { fg = "palette.bg0", bg = "palette.yellow" },
      FelineSLViModeYellowToSeg0 = { fg = "palette.yellow", bg = "palette.bg0" },
      FelineSLViModeBlue = { fg = "palette.bg0", bg = "palette.blue" },
      FelineSLViModeBlueToSeg0 = { fg = "palette.blue", bg = "palette.bg0" },
      FelineSLViModeMagenta = { fg = "palette.bg0", bg = "palette.magenta" },
      FelineSLViModeMagentaToSeg0 = { fg = "palette.magenta", bg = "palette.bg0" },
      FelineSLViModeCyan = { fg = "palette.bg0", bg = "palette.cyan" },
      FelineSLViModeCyanToSeg0 = { fg = "palette.cyan", bg = "palette.bg0" },
      FelineSLViModeWhite = { fg ="palette.black", bg = "palette.white" },
      FelineSLViModeWhiteToSeg0 = { fg ="palette.white", bg = "palette.bg0" },
      FelineSLViModeOrange = { fg ="palette.black", bg = "palette.orange" },
      FelineSLViModeOrangeToSeg0 = { fg ="palette.orange", bg = "palette.bg0" },
      FelineSLViModePink = { fg ="palette.black", bg = "palette.pink" },
      FelineSLViModePinkToSeg0 = { fg ="palette.pink", bg = "palette.bg0" },

      FelineSLSeg1ToGitAdded = { fg = "palette.bg2", bg = "git.add" },
      FelineSLGitAdded = { fg = "palette.bg0", bg = "git.add" },
      FelineSLGitAddedToGitChanged = { fg = "git.add", bg = "git.changed" },
      FelineSLGitChanged = { fg = "palette.bg0", bg = "git.changed" },
      FelineSLGitChangedToGitRemoved = { fg = "git.changed", bg = "git.removed" },
      FelineSLGitRemoved = { fg = "palette.bg0", bg = "git.removed" },
      FelineSLGitRemovedToBg = { fg = "git.removed", bg = "palette.bg1" },

      FelineSLLSPToBg = { fg = "palette.white", bg = "palette.bg1" },
      FelineSLLSP = { fg = "palette.black", bg = "palette.white" },
      FelineSLDiagErrorsToLSP = { fg = "diag.error", bg = "palette.white" },
      FelineSLDiagErrors = { fg = "palette.bg0", bg = "diag.error" },
      FelineSLDiagWarningsToDiagErrors = { fg = "diag.warn", bg = "diag.error" },
      FelineSLDiagWarnings = { fg = "palette.bg0", bg = "diag.warn" },
      FelineSLDiagInfoToDiagWarnings = { fg = "diag.info", bg = "diag.warn" },
      FelineSLDiagInfo = { fg = "palette.bg0", bg = "diag.info" },
      FelineSLDiagHintsToDiagInfo = { fg = "diag.hint", bg = "diag.info" },
      FelineSLDiagHints = { fg = "palette.bg0", bg = "diag.hint" },
      FelineSLSeg1ToDiagHints = { fg = "palette.bg2", bg = "diag.hint" },

      FelineWBSeg0 = { fg = "palette.fg2", bg = "palette.bg1" },
      FelineWBISeg0 = { fg = "palette.fg3", bg = "palette.bg1" },
    },
  },
})

vim.cmd("colorscheme terafox")
