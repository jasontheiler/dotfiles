local utils = require("utils")

utils.keymap({ "n", "v" }, "K", "<Nop>")
utils.keymap("t", "<Esc>", "<C-\\><C-n>")

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
utils.keymap({ "n", "v" }, "<Leader>yr", function()
  if vim.fn.executable("openssl") == 0 then
    utils.print("`openssl` not found")
    return
  end
  local input = vim.fn.input("Number of bytes: ")
  local length = tonumber(input)
  if length == nil or length % 1 ~= 0 then
    utils.print(input .. " is not a valid integer")
    return
  end
  local rand = vim.fn.systemlist("openssl rand -hex " .. length)[1]
  vim.fn.setreg("+", rand, "c")
  utils.print("Copied to clipboard: " .. rand)
end)
utils.keymap({ "n", "v" }, "<Leader>yu", function()
  if vim.fn.executable("uuidgen") == 0 then
    utils.print("`uuidgen` not found")
    return
  end
  local uuid = vim.fn.systemlist("uuidgen")[1]
  vim.fn.setreg("+", uuid, "c")
  utils.print("Copied to clipboard: " .. uuid)
end)
