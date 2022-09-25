local fn = vim.fn
local packer_install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
local is_packer_installed = fn.empty(fn.glob(packer_install_path)) > 0

if not is_packer_installed then
  fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    packer_install_path
  })
  vim.cmd([[packadd packer.nvim]])
end

local packer = require("packer")

packer.startup(function(use)
  use("wbthomason/packer.nvim")

  if not is_packer_installed then
    packer.sync()
  end
end)

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
