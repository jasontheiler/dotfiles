local bufferline = require("bufferline")
local utils = require("utils")

-- See: https://github.com/akinsho/bufferline.nvim#usage
bufferline.setup({
  options = {
    indicator = { style = "none" },
    numbers = function(opts) return opts.ordinal end,
    separator_style = { "" },
    show_buffer_close_icons = false,
    show_close_icon = false,
    right_mouse_command = nil,
    custom_filter = function(buf) return vim.fn.bufname(buf) ~= "" end,
  },
})

for i = 1, 9 do
  utils.keymap("n", "<leader>" .. i, function() bufferline.go_to(i, true) end, "which_key_ignore")
end

local move_to = function(new_index)
  local current_elements = bufferline.get_elements().elements
  local current_index = nil

  for i, element in pairs(current_elements) do
    if element.path == vim.api.nvim_buf_get_name(0) then
      current_index = i
    end
  end

  if current_index ~= nil then
    bufferline.move(math.min(new_index - current_index, #current_elements - current_index))
  end
end

for i = 1, 9 do
  utils.keymap("n", "<Leader>b" .. i, function() move_to(i) end, "which_key_ignore")
end
