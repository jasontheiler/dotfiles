local bufdelete = require("bufdelete")
local utils = require("utils")

-- See: https://github.com/famiu/bufdelete.nvim#usage
utils.keymap("n", "<Leader>bx", function()
  if vim.bo.filetype == "" then
    bufdelete.bufdelete(0, true)
  else
    bufdelete.bufdelete(0)
  end
end)
