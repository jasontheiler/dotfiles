local keymap = require("utils").keymap

keymap("n", "<C-s>", ":w<CR>")

keymap("i", "<C-h>", "<Left>")
keymap("i", "<C-j>", "<Down>")
keymap("i", "<C-k>", "<Up>")
keymap("i", "<C-l>", "<Right>")
