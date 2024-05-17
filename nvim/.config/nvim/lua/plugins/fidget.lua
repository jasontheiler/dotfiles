-- See: https://github.com/j-hui/fidget.nvim
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
          normal_hl = "FidgetBase",
        },
        view = { group_separator = "" },
        configs = {
          default = {
            name = false,
            icon = false,
            ttl = 8,
            debug_annote = "DEBUG",
            debug_style = "FidgetAnnoteDebug",
            info_annote = " INFO",
            info_style = "FidgetAnnoteInfo",
            warn_annote = " WARN",
            warn_style = "FidgetAnnoteWarn",
            error_annote = "ERROR",
            error_style = "FidgetAnnoteError",
          },
        },
      },
      progress = {
        display = {
          render_limit = false,
          done_icon = "",
          done_style = "FidgetDone",
          group_style = "FidgetGroup",
          icon_style = "FidgetIcon",
          progress_style = "FidgetProgress",
          overrides = {},
          format_message = function(data)
            return string.format(
              "%s%s",
              data.message or (data.done and "Completed" or "In progress…"),
              data.percentage and string.format(" (%s%%)", data.percentage) or ""
            )
          end,
          format_group_name = function(group_name)
            return "LSP: " .. group_name
          end,
        }
      },
    })

    vim.notify = function(msg, level, opts)
      fidget.notify(msg, level or vim.log.levels.INFO, opts)
    end
  end,
}
