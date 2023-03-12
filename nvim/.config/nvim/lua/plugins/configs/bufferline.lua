local bufferline = require("bufferline")
local utils = require("utils")

-- See: https://github.com/akinsho/bufferline.nvim#usage
bufferline.setup({
  options = {
    indicator = { style = 'none' },
    numbers = function(opts)
      return string.format("%s", opts.ordinal)
    end,
    separator_style = { '' },
    show_buffer_close_icons = false,
    show_close_icon = false,
    right_mouse_command = nil,
    custom_filter = function(buf)
      return vim.fn.bufname(buf) ~= ""
    end,
  },
})

utils.keymap("n", "<Leader>1", function() bufferline.go_to(1, true) end)
utils.keymap("n", "<Leader>2", function() bufferline.go_to(2, true) end)
utils.keymap("n", "<Leader>3", function() bufferline.go_to(3, true) end)
utils.keymap("n", "<Leader>4", function() bufferline.go_to(4, true) end)
utils.keymap("n", "<Leader>5", function() bufferline.go_to(5, true) end)
utils.keymap("n", "<Leader>6", function() bufferline.go_to(6, true) end)
utils.keymap("n", "<Leader>7", function() bufferline.go_to(7, true) end)
utils.keymap("n", "<Leader>8", function() bufferline.go_to(8, true) end)
utils.keymap("n", "<Leader>9", function() bufferline.go_to(9, true) end)

local move_to = function(new_idx)
  local current_elements = bufferline.get_elements().elements
  local current_idx = nil

  for idx, element in pairs(current_elements) do
    if element.path == vim.api.nvim_buf_get_name(0) then
      current_idx = idx
    end
  end

  if current_idx ~= nil then
    bufferline.move(math.min(new_idx - current_idx, #current_elements - current_idx))
  end
end

utils.keymap("n", "<Leadier>b1", function() move_to(1) end)
utils.keymap("n", "<Leader>b2", function() move_to(2) end)
utils.keymap("n", "<Leader>b3", function() move_to(3) end)
utils.keymap("n", "<Leader>b4", function() move_to(4) end)
utils.keymap("n", "<Leader>b5", function() move_to(5) end)
utils.keymap("n", "<Leader>b6", function() move_to(6) end)
utils.keymap("n", "<Leader>b7", function() move_to(7) end)
utils.keymap("n", "<Leader>b8", function() move_to(8) end)
utils.keymap("n", "<Leader>b9", function() move_to(9) end)
