--- See: https://github.com/j-hui/fidget.nvim
---
--- @type LazyPluginSpec
return {
  "j-hui/fidget.nvim",
  event = "VeryLazy",
  config = function()
    local fidget = require("fidget")

    -- See: https://github.com/j-hui/fidget.nvim#options
    fidget.setup({
      notification = {
        filter = vim.log.levels.DEBUG,
        window = {
          winblend = 0,
          normal_hl = "FidgetNormal",
        },
        view = { group_separator = "───" },
        configs = {
          default = {
            name = false,
            icon = false,
            ttl = 8,
            error_annote = "ERROR",
            error_style = "FidgetNotificationAnnoteError",
            warn_annote = " WARN",
            warn_style = "FidgetNotificationAnnoteWarn",
            info_annote = " INFO",
            info_style = "FidgetNotificationAnnoteInfo",
            debug_annote = "DEBUG",
            debug_style = "FidgetNotificationAnnoteDebug",
          },
        },
      },
      progress = {
        display = {
          render_limit = false,
          done_icon = "",
          done_style = "FidgetProgressDone",
          group_style = "FidgetProgressGroup",
          icon_style = "FidgetProgressIcon",
          progress_style = "FidgetProgressProgress",
          overrides = {},
          format_message = function(data)
            return string.format(
              "%s%s",
              data.message or (data.done and "Completed" or "In progress…"),
              data.percentage and string.format(" (%s%%)", data.percentage) or ""
            )
          end,
        }
      },
    })

    vim.notify = function(msg, level, opts)
      fidget.notify(msg, level or vim.log.levels.INFO, opts)
    end
  end,
}
