-- Special thanks to TJ DeVries and ThePrimeagen for improving the Neovim
-- experience and helping to grow an awesome community around it.

if not vim.fn.has("nvim-0.10") then
  vim.notify("The loaded configuration requires Neovim >= 0.10", vim.log.levels.WARN)
end

require("opts")
require("keymaps")
require("user-commands")
require("autocmds")

local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazy_path) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    "https://github.com/folke/lazy.nvim.git",
    lazy_path
  })
end

vim.opt.rtp:prepend(lazy_path)

-- See: https://github.com/folke/lazy.nvim
require("lazy").setup("plugins")
