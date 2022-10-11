local toggleterm = require("toggleterm")
local Terminal = require("toggleterm/terminal").Terminal
local keymap = require("utils").keymap

-- See: https://github.com/akinsho/toggleterm.nvim#setup
toggleterm.setup({
  size = 80,
  shade_terminals = false,
  start_in_insert = false,
})

local term_v = Terminal:new({
  hidden = true,
  direction = "horizontal",
})

keymap("n", "<Leader>tv", function() term_v:toggle() end)

local term_v2 = Terminal:new({
  hidden = true,
  direction = "horizontal",
})

keymap("n", "<Leader>th", function() term_v2:toggle() end)

local term_f = Terminal:new({
  hidden = true,
  direction = "float",
})

keymap("n", "<Leader>tt", function() term_f:toggle() end)
