local utils = require("utils")

utils.keymap("t", "<Esc>", "<C-\\><C-n>", "Exit terminal mode")
utils.keymap({ "n", "v" }, "<leader>p", "\"_dP", "Paste (without yank)")

utils.keymap("n", "<leader>ww", "<C-w>w", "Move cursor to window above (wrap)")
utils.keymap("n", "<leader>wW", "<C-w><C-w>", "Move cursor to window below (wrap)")
utils.keymap("n", "<leader>wx", "<C-w>q", "Close current")

utils.keymap("n", "[d", vim.diagnostic.goto_prev, "Diagnostic")
utils.keymap("n", "]d", vim.diagnostic.goto_next, "Diagnostic")
utils.keymap("n", "<leader>d", vim.diagnostic.open_float, "Diagnostics")

utils.keymap("n", "<leader>n", ":e ${HOME}/notes.md<CR>", "Notes")

utils.keymap("n", "<leader>rh", function()
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
end, "Hexadecimal string")
utils.keymap("n", "<leader>ru", function()
  if vim.fn.executable("uuidgen") == 0 then
    utils.print("`uuidgen` not found")
    return
  end
  local uuid = vim.fn.systemlist("uuidgen")[1]
  vim.fn.setreg("+", uuid, "c")
  utils.print("Copied to clipboard: " .. uuid)
end, "UUID")
