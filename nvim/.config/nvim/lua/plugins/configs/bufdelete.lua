local bufdelete = require("bufdelete")
local keymap = require("utils").keymap

-- See: https://github.com/famiu/bufdelete.nvim#usage
keymap("n", "<Leader>bx", function() bufdelete.bufwipeout(0) end)
keymap("n", "<Leader>bX", function() bufdelete.bufwipeout(0, true) end)
