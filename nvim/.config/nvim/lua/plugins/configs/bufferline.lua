local bufferline = require("bufferline")
local keymap = require("utils").keymap

-- See: https://github.com/akinsho/bufferline.nvim#usage
bufferline.setup({
  options = {
    numbers = function(opts)
      return string.format("%s:", opts.ordinal)
    end,
    show_buffer_close_icons = false,
    show_close_icon = false,
    right_mouse_command = nil,
    middle_mouse_command = "bdelete! %d",
  },
})

keymap("n", "<Leader>bh", function() bufferline.move(-1) end)
keymap("n", "<Leader>bl", function() bufferline.move(1) end)

keymap("n", "<Tab>", function() bufferline.cycle(1) end)
keymap("n", "<S-Tab>", function() bufferline.cycle(-1) end)
