local feline = require("feline")
local with_pad_seps = require("plugins/configs/feline/utils").with_pad_seps
local vi_mode = require("plugins/configs/feline/providers/vi-mode")
local git_status = require("plugins/configs/feline/providers/git-status")
local lsp_status = require("plugins/configs/feline/providers/lsp-status")

-- See: https://github.com/feline-nvim/feline.nvim/blob/master/USAGE.md
feline.setup({
  components = {
    active = {
      -- left
      {
        {
          left_sep = {
            str = "left_rounded",
            hl = vi_mode.hl_to_bg,
            always_visible = true,
          },
        },
        with_pad_seps({
          priority = 9,
          provider = vi_mode.provider,
          short_provider = "",
          hl = vi_mode.hl,
          right_sep = {
            str = "right_filled",
            hl = vi_mode.hl_to_seg0,
            always_visible = true,
          },
        }),
        with_pad_seps({
          priority = 6,
          provider = git_status.provider,
          short_provider = "",
          icon = " ",
          hl = "FelineSLSeg0",
          right_sep = {
            str = "right_filled",
            hl = "FelineSLSeg0ToSeg1",
            always_visible = true,
          },
        }),
        with_pad_seps({
          priority = 7,
          provider = {
            name = "file_info",
            opts = { type = "unique", file_readonly_icon = " " },
          },
          short_provider = "",
          hl = "FelineSLSeg1",
          right_sep = {
            str = "right_filled",
            hl = "FelineSLSeg1ToGitAdded",
            always_visible = true,
          },
        }),
        with_pad_seps({
          priority = 8,
          provider = "git_diff_added",
          short_provider = "",
          icon = "+",
          hl = "FelineSLGitAdded",
          right_sep = {
            str = "right_filled",
            hl = "FelineSLGitAddedToGitChanged",
            always_visible = true,
          },
        }),
        with_pad_seps({
          priority = 8,
          provider = "git_diff_changed",
          short_provider = "",
          icon = "~",
          hl = "FelineSLGitChanged",
          right_sep = {
            str = "right_filled",
            hl = "FelineSLGitChangedToGitRemoved",
            always_visible = true,
          },
        }),
        with_pad_seps({
          priority = 8,
          provider = "git_diff_removed",
          short_provider = "",
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
          priority = 5,
          provider = function() return lsp_status.provider("left") end,
          short_provider = "",
          hl = "FelineSLLSP",
          left_sep = {
            str = "left_filled",
            hl = "FelineSLLSPToBg",
            always_visible = true,
          },
        }),
        with_pad_seps({
          priority = 8,
          provider = "diagnostic_errors",
          short_provider = "",
          icon = " ",
          hl = "FelineSLDiagErrors",
          left_sep = {
            str = "left_filled",
            hl = "FelineSLDiagErrorsToLSP",
            always_visible = true,
          },
        }),
        with_pad_seps({
          priority = 8,
          provider = "diagnostic_warnings",
          short_provider = "",
          icon = " ",
          hl = "FelineSLDiagWarnings",
          left_sep = {
            str = "left_filled",
            hl = "FelineSLDiagWarningsToDiagErrors",
            always_visible = true,
          },
        }),
        with_pad_seps({
          priority = 8,
          provider = "diagnostic_info",
          short_provider = "",
          icon = " ",
          hl = "FelineSLDiagInfo",
          left_sep = {
            str = "left_filled",
            hl = "FelineSLDiagInfoToDiagWarnings",
            always_visible = true,
          },
        }),
        with_pad_seps({
          priority = 8,
          provider = "diagnostic_hints",
          short_provider = "",
          icon = " ",
          hl = "FelineSLDiagHints",
          left_sep = {
            str = "left_filled",
            hl = "FelineSLDiagHintsToDiagInfo",
            always_visible = true,
          },
        }),
        with_pad_seps({
          priority = 4,
          provider = {
            name = "file_type",
            opts = { case = "lowercase" },
          },
          short_provider = "",
          hl = "FelineSLSeg1",
          left_sep = {
            str = "left_filled",
            hl = "FelineSLSeg1toDiagHints",
            always_visible = true,
          },
        }),
        with_pad_seps({
          priority = 2,
          provider = function() return "Tab: " .. vim.bo.tabstop end,
          short_provider = "",
          hl = "FelineSLSeg0",
          left_sep = {
            str = "left_filled",
            hl = "FelineSLSeg0toSeg1",
            always_visible = true,
          },
        }),
        with_pad_seps({
          priority = 1,
          provider = "file_encoding",
          short_provider = "",
          hl = "FelineSLSeg0",
          left_sep = { str = "left", hl = "FelineSLSeg0" },
        }),
        with_pad_seps({
          priority = 9,
          provider = "position",
          short_provider = "",
          hl = vi_mode.hl,
          left_sep = {
            str = "left_filled",
            hl = vi_mode.hl_to_seg0,
            always_visible = true
          },
        }),
        with_pad_seps({
          priority = 3,
          provider = "line_percentage",
          short_provider = "",
          hl = vi_mode.hl,
          left_sep = { str = "left", hl = vi_mode.hl },
        }),
        {
          right_sep = {
            str = "right_rounded",
            hl = vi_mode.hl_to_bg,
            always_visible = true,
          },
        },
      },
    },
    inactive = {
      -- left
      {},
      -- right
      {},
    },
  },
})
