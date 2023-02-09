local bufdelete = require("bufdelete")
local utils = require("utils")

-- See: https://github.com/famiu/bufdelete.nvim#usage
utils.keymap("n", "<Leader>bx", function() bufdelete.bufdelete(0) end)
