-- Special thanks to TJ DeVries and ThePrimeagen for improving the Neovim
-- experience and helping to grow an awesome community around it.

if vim.fn.has("nvim-0.11") == 0 then
  error("The loaded configuration requires Neovim >= 0.11")
end

require("config.opts")
require("config.keymaps")
require("config.user-commands")
require("config.autocmds")
require("config.bufs")
require("config.lazy")
