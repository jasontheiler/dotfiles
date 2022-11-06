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

keymap("n", "<Leader>b1", function() bufferline.go_to_buffer(1, true) end)
keymap("n", "<Leader>b2", function() bufferline.go_to_buffer(2, true) end)
keymap("n", "<Leader>b3", function() bufferline.go_to_buffer(3, true) end)
keymap("n", "<Leader>b4", function() bufferline.go_to_buffer(4, true) end)
keymap("n", "<Leader>b5", function() bufferline.go_to_buffer(5, true) end)
keymap("n", "<Leader>b6", function() bufferline.go_to_buffer(6, true) end)
keymap("n", "<Leader>b7", function() bufferline.go_to_buffer(7, true) end)
keymap("n", "<Leader>b8", function() bufferline.go_to_buffer(8, true) end)
keymap("n", "<Leader>b9", function() bufferline.go_to_buffer(9, true) end)

keymap("n", "<Tab>", function() bufferline.cycle(1) end)
keymap("n", "<S-Tab>", function() bufferline.cycle(-1) end)
