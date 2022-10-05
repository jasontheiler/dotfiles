local nightfox = require("nightfox")

-- See: https://github.com/EdenEast/nightfox.nvim#configuration
nightfox.setup({
  groups = {
    all = {
      FelineSLBg = { bg = "palette.bg1" },

      FelineSLSeg0 = { fg = "palette.fg2", bg = "palette.bg0" },
      FelineSLSeg0ToSeg1 = { fg = "palette.bg0", bg = "palette.bg2" },
      FelineSLSeg1 = { fg = "palette.fg1", bg = "palette.bg2" },

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

vim.cmd("colorscheme carbonfox")
