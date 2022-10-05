local feline = require("feline")
local with_pad_seps = require("plugins/configs/feline/utils").with_pad_seps

-- See: https://github.com/feline-nvim/feline.nvim/blob/master/USAGE.md
feline.setup({
  components = {
    active = {
      -- left
      {
        with_pad_seps({
          provider = "vi_mode",
          icon = "",
          right_sep = { str = "right_filled", hl = "FelineSLSeg0ToSeg1" },
        }),
        with_pad_seps({
          provider = "git_branch",
          icon = " ",
          hl = "FelineSLSeg0",
          right_sep = {
            str = "right_filled",
            hl = "FelineSLSeg0ToSeg1",
            always_visible = true,
          },
        }),
        with_pad_seps({
          provider = {
            name = "file_info",
            opts = { type = "unique" },
          },
          hl = "FelineSLSeg1",
          right_sep = { str = "right_filled", hl = "FelineSLSeg1ToGitAdded" },
        }),
        with_pad_seps({
          provider = "git_diff_added",
          icon = "+",
          hl = "FelineSLGitAdded",
          right_sep = {
            str = "right_filled",
            hl = "FelineSLGitAddedToGitChanged",
            always_visible = true,
          },
        }),
        with_pad_seps({
          provider = "git_diff_changed",
          icon = "~",
          hl = "FelineSLGitChanged",
          right_sep = {
            str = "right_filled",
            hl = "FelineSLGitChangedToGitRemoved",
            always_visible = true,
          },
        }),
        with_pad_seps({
          provider = "git_diff_removed",
          icon = "-",
          hl = "FelineSLGitRemoved",
          right_sep = {
            str = "right_filled",
            hl = "FelineSLGitRemovedToBg",
            always_visible = true,
          },
        }),
        { hl = "FelineSLBg" },
      },
      -- right
      {
        with_pad_seps({
          provider = "lsp_client_names",
          hl = "FelineSLLSP",
          left_sep = {
            str = "left_filled",
            hl = "FelineSLLSPToBg",
            always_visible = true,
          },
        }),
        with_pad_seps({
          provider = "diagnostic_errors",
          hl = "FelineSLDiagErrors",
          left_sep = {
            str = "left_filled",
            hl = "FelineSLDiagErrorsToLSP",
            always_visible = true,
          },
        }),
        with_pad_seps({
          provider = "diagnostic_warnings",
          hl = "FelineSLDiagWarnings",
          left_sep = {
            str = "left_filled",
            hl = "FelineSLDiagWarningsToDiagErrors",
            always_visible = true,
          },
        }),
        with_pad_seps({
          provider = "diagnostic_info",
          hl = "FelineSLDiagInfo",
          left_sep = {
            str = "left_filled",
            hl = "FelineSLDiagInfoToDiagWarnings",
            always_visible = true,
          },
        }),
        with_pad_seps({
          provider = "diagnostic_hints",
          hl = "FelineSLDiagHints",
          left_sep = {
            str = "left_filled",
            hl = "FelineSLDiagHintsToDiagInfo",
            always_visible = true,
          },
        }),
        with_pad_seps({
          provider = {
            name = "file_type",
            opts = { case = "lowercase" },
          },
          hl = "FelineSLSeg1",
          left_sep = {
            str = "left_filled",
            hl = "FelineSLSeg1toDiagHints",
            always_visible = true,
          },
        }),
        with_pad_seps({
          provider = function() return "Tab: " .. vim.bo.tabstop end,
          hl = "FelineSLSeg0",
          left_sep = { str = "left_filled", hl = "FelineSLSeg0toSeg1" },
        }),
        with_pad_seps({
          provider = "file_encoding",
          hl = "FelineSLSeg0",
          left_sep = { str = "left", hl = "FelineSLSeg0" },
        }),
        with_pad_seps({
          provider = "position",
          left_sep = { str = "left_filled" },
        }),
        with_pad_seps({
          provider = "line_percentage",
          left_sep = { str = "left" },
        }),
      },
    },
  },
})

