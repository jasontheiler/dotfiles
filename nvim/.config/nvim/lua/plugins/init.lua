local cmd = vim.cmd
local fn = vim.fn

local is_installed, packer = pcall(require, "packer")

if not is_installed then
  fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    fn.stdpath("data").."/site/pack/packer/start/packer.nvim",
  })
  cmd([[packadd packer.nvim]])
  packer = require("packer")
end

packer.startup(function(use)
  -- See: https://github.com/wbthomason/packer.nvim
  use("wbthomason/packer.nvim")

  -- See: https://github.com/nvim-lua/plenary.nvim
  use("nvim-lua/plenary.nvim")

  -- See: https://github.com/nvim-treesitter/nvim-treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function() require("nvim-treesitter.install").update({ with_sync = true }) end,
    config = function() require("plugins/configs/treesitter") end,
  })

  -- See: https://github.com/lukas-reineke/indent-blankline.nvim
  use({
    "lukas-reineke/indent-blankline.nvim",
    config = function() require("plugins/configs/indent_blankline") end,
  })

  -- See: https://github.com/kyazdani42/nvim-web-devicons
  use("kyazdani42/nvim-web-devicons")

  -- See: https://github.com/nvim-lualine/lualine.nvim
  use({
    "nvim-lualine/lualine.nvim",
    config = function() require("plugins/configs/lualine") end,
  })

  -- See: https://github.com/lewis6991/gitsigns.nvim
  use({
    "lewis6991/gitsigns.nvim",
    config = function() require("plugins/configs/gitsigns") end,
  })

  -- See: https://github.com/kyazdani42/nvim-tree.lua
  use({
    "kyazdani42/nvim-tree.lua",
    config = function() require("plugins/configs/nvim-tree") end,
  })

  -- See: https://github.com/nvim-telescope/telescope.nvim
  use({
    "nvim-telescope/telescope.nvim",
    config = function() require("plugins/configs/telescope") end,
  })

  if not is_installed then
    packer.sync()
  end
end)

cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source $MYVIMRC | PackerCompile
  augroup end
]])
