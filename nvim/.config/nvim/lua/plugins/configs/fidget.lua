local fidget = require("fidget")

-- See: https://github.com/j-hui/fidget.nvim/blob/main/doc/fidget.md
fidget.setup({
    text = {
        spinner = "dots",
        done = "",
        commenced = "started",
        completed = "completed",
    },
    fmt = {
        stack_upwards = false,
        task = function(task, msg, percentage)
          return string.format(
                  "%s: %s%s",
                  task,
                  msg,
                  percentage and string.format(" (%s%%)", percentage) or ""
              )
        end,
    },
    window = {
        border = { " ", " ", " ", " ", " ", " ", " ", " " },
        blend = 0,
    },
})
