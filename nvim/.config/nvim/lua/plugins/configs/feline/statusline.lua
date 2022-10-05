local feline = require("feline")

-- See: https://github.com/feline-nvim/feline.nvim/blob/master/USAGE.md
feline.setup({
  components = {
    active = {
      -- left
      {
        {
          provider = "vi_mode",
          icon = "",
          left_sep = { str = " ", hl = "FelineSLSeg0" },
          right_sep = {
            { str = " ", hl = "FelineSLSeg0" },
            { str = "right_filled", hl = "FelineSLSeg0ToSeg1", always_visible = true },
          },
        },
        {
          provider = "git_branch",
          icon = " ",
          hl = "FelineSLSeg0",
          left_sep = { str = " ", hl = "FelineSLSeg0" },
          right_sep = {
            { str = " ", hl = "FelineSLSeg0" },
            { str = "right_filled", hl = "FelineSLSeg0ToSeg1", always_visible = true },
          },
        },
        {
          provider = {
            name = "file_info",
            opts = { type = "unique" },
          },
          hl = "FelineSLSeg1",
          left_sep = { str = " ", hl = "FelineSLSeg1" },
          right_sep = {
            { str = " ", hl = "FelineSLSeg1" },
            { str = "right_filled", hl = "FelineSLSeg1ToGitAdded", always_visible = true },
          },
        },
        {
          provider = "git_diff_added",
          icon = "+",
          hl = "FelineSLGitAdded",
          left_sep = { str = " ", hl = "FelineSLGitAdded" },
          right_sep = {
            { str = " ", hl = "FelineSLGitAdded" },
            { str = "right_filled", hl = "FelineSLGitAddedToGitChanged", always_visible = true },
          },
        },
        {
          provider = "git_diff_changed",
          icon = "~",
          hl = "FelineSLGitChanged",
          left_sep = { str = " ", hl = "FelineSLGitChanged" },
          right_sep = {
            { str = " ", hl = "FelineSLGitChanged" },
            { str = "right_filled", hl = "FelineSLGitChangedToGitRemoved", always_visible = true },
          },
        },
        {
          provider = "git_diff_removed",
          icon = "-",
          hl = "FelineSLGitRemoved",
          left_sep = { str = " ", hl = "FelineSLGitRemoved" },
          right_sep = {
            { str = " ", hl = "FelineSLGitRemoved" },
            { str = "right_filled", hl = "FelineSLGitRemovedToBg", always_visible = true },
          },
        },
        {
          hl = "FelineSLBg",
        },
      },
      -- right
      {
        {
          provider = "lsp_client_names",
          hl = "FelineSLLSP",
          left_sep = {
            { str = "left_filled", hl = "FelineSLLSPToBg", always_visible = true },
            { str = " ", hl = "FelineSLLSP" },
          },
          right_sep = { str = " ", hl = "FelineSLLSP" },
        },
        {
          provider = "diagnostic_errors",
          hl = "FelineSLDiagErrors",
          left_sep = {
            { str = "left_filled", hl = "FelineSLDiagErrorsToLSP", always_visible = true},
            { str = " ", hl = "FelineSLDiagErrors" },
          },
          right_sep = { str = " ", hl = "FelineSLDiagErrors" },
        },
        {
          provider = "diagnostic_warnings",
          hl = "FelineSLDiagWarnings",
          left_sep = {
            { str = "left_filled", hl = "FelineSLDiagWarningsToDiagErrors", always_visible = true },
            { str = " ", hl = "FelineSLDiagWarnings" },
          },
          right_sep = { str = " ", hl = "FelineSLDiagWarnings" },
        },
        {
          provider = "diagnostic_info",
          hl = "FelineSLDiagInfo",
          left_sep = {
            { str = "left_filled", hl = "FelineSLDiagInfoToDiagWarnings", always_visible = true },
            { str = " ", hl = "FelineSLDiagInfo" },
          },
          right_sep = { str = " ", hl = "FelineSLDiagInfo" },
        },
        {
          provider = "diagnostic_hints",
          hl = "FelineSLDiagHints",
          left_sep = {
            { str = "left_filled", hl = "FelineSLDiagHintsToDiagInfo", always_visible = true },
            { str = " ", hl = "FelineSLDiagHints" },
          },
          right_sep = { str = " ", hl = "FelineSLDiagHints" },
        },
        {
          provider = {
            name = "file_type",
            opts = { case = "lowercase" },
          },
          hl = "FelineSLSeg1",
          left_sep = {
            { str = "left_filled", hl = "FelineSLSeg1toDiagHints", always_visible = true },
            { str = " ", hl = "FelineSLSeg1" },
          },
          right_sep = { str = " ", hl = "FelineSLSeg1" },
        },
        {
          provider = function() return "Tab: " .. vim.bo.tabstop end,
          hl = "FelineSLSeg0",
          left_sep = {
            { str = "left_filled", hl = "FelineSLSeg0toSeg1", always_visible = true },
            { str = " ", hl = "FelineSLSeg0" },
          },
          right_sep = { str = " ", hl = "FelineSLSeg0" },
        },
        {
          provider = "file_encoding",
          hl = "FelineSLSeg0",
          left_sep = {
            { str = "left", hl = "FelineSLSeg0", always_visible = true },
            { str = " ", hl = "FelineSLSeg0" },
          },
          right_sep = { str = " ", hl = "FelineSLSeg0" },
        },
        {
          provider = "position",
          left_sep = {
            { str = "left_filled" },
            { str = " " },
          },
          right_sep = { str = " " },
        },
        {
          provider = "line_percentage",
          left_sep = {
            { str = "left_filled" },
            { str = " " },
          },
          right_sep = { str = " " },
        },
      },
    },
  },
})

