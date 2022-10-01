local fn = vim.fn

local is_installed, bufferline = pcall(require, "bufferline")

if not is_installed then
  return
end

-- See: https://github.com/akinsho/bufferline.nvim#usage
bufferline.setup({
  options = {
    show_buffer_close_icons = false,
    show_close_icon = false,
    right_mouse_command = nil,
    middle_mouse_command = "bdelete! %d",
    offsets = {
      {
        filetype = "NvimTree",
        text = function()
          return fn.fnamemodify(fn.getcwd(), ":t")
        end,
      },
    },
  },
})

local keymap = require("utils").keymap

keymap("n", "<Tab>", function() bufferline.cycle(1) end)
keymap("n", "<S-Tab>", function() bufferline.cycle(-1) end)
keymap("n", { "<C-w><C-x>", "<C-w>x" }, ":bd<CR>")
