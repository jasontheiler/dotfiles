-- See: https://lazy.folke.io/

local lazy_repo_url = "https://github.com/folke/lazy.nvim.git"
local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazy_path) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    lazy_repo_url,
    lazy_path,
  })
end

vim.opt.rtp:prepend(lazy_path)

local lazy = require("lazy")

-- See: https://lazy.folke.io/configuration
lazy.setup({
  spec = {
    { import = "plugins" },
  },
  ui = {
    border = "rounded",
    backdrop = 100,
  },
})
