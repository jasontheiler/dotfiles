local feline = require("feline")
local with_pad_seps = require("plugins/configs/feline/utils").with_pad_seps
local vi_mode = require("plugins/configs/feline/providers/vi-mode")
local lsp_status = require("plugins/configs/feline/providers/lsp-status")

-- See: https://github.com/feline-nvim/feline.nvim/blob/master/USAGE.md
feline.setup({
  components = {
    active = {
      -- left
      {
        with_pad_seps({
          provider = vi_mode.provider,
          hl = vi_mode.hl,
          right_sep = { str = "right_filled", hl = vi_mode.sep_hl },
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
            opts = { type = "unique", file_readonly_icon = " " },
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
          provider = lsp_status.provider,
          hl = "FelineSLLSP",
          left_sep = {
            str = "left_filled",
            hl = "FelineSLLSPToBg",
            always_visible = true,
          },
        }),
        with_pad_seps({
          provider = "diagnostic_errors",
          icon = " ",
          hl = "FelineSLDiagErrors",
          left_sep = {
            str = "left_filled",
            hl = "FelineSLDiagErrorsToLSP",
            always_visible = true,
          },
        }),
        with_pad_seps({
          provider = "diagnostic_warnings",
          icon = " ",
          hl = "FelineSLDiagWarnings",
          left_sep = {
            str = "left_filled",
            hl = "FelineSLDiagWarningsToDiagErrors",
            always_visible = true,
          },
        }),
        with_pad_seps({
          provider = "diagnostic_info",
          icon = " ",
          hl = "FelineSLDiagInfo",
          left_sep = {
            str = "left_filled",
            hl = "FelineSLDiagInfoToDiagWarnings",
            always_visible = true,
          },
        }),
        with_pad_seps({
          provider = "diagnostic_hints",
          icon = " ",
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
          hl = vi_mode.hl,
          left_sep = { str = "left_filled", hl = vi_mode.sep_hl },
        }),
        with_pad_seps({
          provider = "line_percentage",
          hl = vi_mode.hl,
          left_sep = { str = "left", hl = vi_mode.hl },
        }),
      },
    },
  },
})

