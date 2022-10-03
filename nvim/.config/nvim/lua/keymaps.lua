local keymap = require("utils").keymap

keymap("n", "<C-s>", ":w<CR>")
keymap("n", { "<C-q><C-q>", "<C-q>q" }, ":q<CR>")
keymap("n", { "<C-q><C-a>", "<C-q>a" }, ":qa<CR>")

keymap("i", "<C-h>", "<Left>")
keymap("i", "<C-j>", "<Down>")
keymap("i", "<C-k>", "<Up>")
keymap("i", "<C-l>", "<Right>")
