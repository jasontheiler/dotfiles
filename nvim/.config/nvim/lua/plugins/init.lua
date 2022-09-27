local cmd = vim.cmd
local fn = vim.fn

local packer_install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
local is_packer_installed = fn.empty(fn.glob(packer_install_path)) <= 0

if not is_packer_installed then
  fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    packer_install_path,
  })
  cmd([[packadd packer.nvim]])
end

local packer = require("packer")

packer.startup(function(use)
  -- See: https://github.com/wbthomason/packer.nvim
  use("wbthomason/packer.nvim")

  -- See: https://github.com/nvim-treesitter/nvim-treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function() require("nvim-treesitter.install").update({ with_sync = true }) end,
  })

  -- See: https://github.com/nvim-lualine/lualine.nvim
  use("nvim-lualine/lualine.nvim")

  -- See: https://github.com/nvim-telescope/telescope.nvim
  use({
    "nvim-telescope/telescope.nvim",
    requires = { "nvim-lua/plenary.nvim" },
  })

  if not is_packer_installed then
    packer.sync()
  end
end)

cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
