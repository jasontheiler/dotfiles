-- Special thanks to TJ DeVries and ThePrimeagen for improving the Neovim
-- experience and helping to grow an awesome community around it.

if not vim.fn.has("nvim-0.11") then
  vim.notify("The loaded configuration requires Neovim >= 0.11", vim.log.levels.WARN)
end

require("config.opts")
require("config.keymaps")
require("config.user-commands")
require("config.autocmds")
require("config.lazy")
