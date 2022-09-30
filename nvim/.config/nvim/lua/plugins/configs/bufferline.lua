local api = vim.api
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

api.nvim_set_keymap("n", "<Tab>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
api.nvim_set_keymap("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
