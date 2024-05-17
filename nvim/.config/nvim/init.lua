-- Special thanks to TJ DeVries and ThePrimeagen for improving the Neovim
-- experience and helping to grow an awesome community around it.

require("opts")
require("keymaps")
require("user-commands")
require("autocmds")
require("plugins")

if not vim.fn.has("nvim-0.10") then
  vim.notify(
    "The loaded configuration requires Neovim >= 0.10",
    vim.log.levels.WARN
  )
end
