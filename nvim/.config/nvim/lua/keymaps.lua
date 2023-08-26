local utils = require("utils")

utils.keymap({ "n", "v" }, "<Space>", "<Nop>")
utils.keymap({ "n", "v" }, "K", "<Nop>")

utils.keymap("n", "<Leader>s", ":w<CR>")
utils.keymap("x", "<Leader>p", "\"_dP")

utils.keymap("n", "<Leader>w", "<C-w>")
utils.keymap("n", { "<C-w>x", "<Leader>wx" }, "<C-w>q")
utils.keymap("n", { "<C-w><C-h>", "<Leader>w<C-h>" }, "<C-w><")
utils.keymap("n", { "<C-w><C-j>", "<Leader>w<C-j>" }, "<C-w>+")
utils.keymap("n", { "<C-w><C-k>", "<Leader>w<C-k>" }, "<C-w>-")
utils.keymap("n", { "<C-w><C-l>", "<Leader>w<C-l>" }, "<C-w>>")

utils.keymap("n", "[d", vim.diagnostic.goto_prev)
utils.keymap("n", "]d", vim.diagnostic.goto_next)
utils.keymap("n", "<Leader>d", vim.diagnostic.open_float)

utils.keymap("n", "<Leader>n", ":e ${HOME}/notes.md<CR>")
utils.keymap("n", "<Leader>u", function()
  local cursor = vim.api.nvim_win_get_cursor(0)
  local row, col = cursor[1], cursor[2]
  local char = vim.api.nvim_buf_get_text(0, row - 1, col, row - 1, col + 1, {})[1]
  local col_offset = 1
  if char == "" then
    col_offset = 0
  end
  local uuid = vim.fn.systemlist("uuidgen")[1]
  vim.api.nvim_buf_set_text(0, row - 1, col + col_offset, row - 1, col + col_offset, { uuid })
end)

utils.keymap("t", "<Esc>", "<C-\\><C-n>")
