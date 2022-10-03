local is_installed, packer = pcall(require, "packer")

if not is_installed then
  vim.fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim",
  })
  vim.cmd("packadd packer.nvim")
  packer = require("packer")
end

packer.startup(function(use)
  -- See: https://github.com/wbthomason/packer.nvim
  use("wbthomason/packer.nvim")

  -- See: https://github.com/nvim-lua/plenary.nvim
  use("nvim-lua/plenary.nvim")

  -- See: https://github.com/EdenEast/nightfox.nvim
  use({
    "EdenEast/nightfox.nvim",
    config = function() require("plugins/configs/nightfox") end,
  })

  -- See: https://github.com/nvim-treesitter/nvim-treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    config = function() require("plugins/configs/treesitter") end,
  })

  -- See: https://github.com/nvim-treesitter/nvim-treesitter-context
  use({
    "nvim-treesitter/nvim-treesitter-context",
    after = "nvim-treesitter",
    config = function() require("plugins/configs/treesitter-context") end,
  })

  -- See: https://github.com/hrsh7th/nvim-cmp
  use({
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-buffer",
    "hrsh7th/nvim-cmp",
    config = function() require("plugins/configs/cmp") end,
  })

  -- See: https://github.com/williamboman/mason.nvim
  use({
    "williamboman/mason.nvim",
    config = function() require("plugins/configs/mason") end,
  })

  -- See: https://github.com/neovim/nvim-lspconfig
  use({
    "neovim/nvim-lspconfig",
    after = "mason.nvim",
  })

  -- See: https://github.com/williamboman/mason-lspconfig.nvim
  use({
    "williamboman/mason-lspconfig.nvim",
    after = { "cmp-nvim-lsp", "nvim-lspconfig" },
    config = function() require("plugins/configs/mason-lspconfig") end,
  })

  -- See: https://github.com/lukas-reineke/indent-blankline.nvim
  use({
    "lukas-reineke/indent-blankline.nvim",
    config = function() require("plugins/configs/indent-blankline") end,
  })

  -- See: https://github.com/kyazdani42/nvim-web-devicons
  use({
    "kyazdani42/nvim-web-devicons",
    config = function() require("plugins/configs/web-devicons") end,
  })

  -- See: https://github.com/feline-nvim/feline.nvim
  use({
    "feline-nvim/feline.nvim",
    config = function() require("plugins/configs/feline") end,
  })

  -- See: https://github.com/nvim-telescope/telescope.nvim
  use({
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    config = function() require("plugins/configs/telescope") end,
  })

  -- See: https://github.com/lewis6991/gitsigns.nvim
  use({
    "lewis6991/gitsigns.nvim",
    config = function() require("plugins/configs/gitsigns") end,
  })

  -- See: https://github.com/akinsho/bufferline.nvim
  use({
    "akinsho/bufferline.nvim",
    config = function() require("plugins/configs/bufferline") end,
  })

  -- See: https://github.com/kyazdani42/nvim-tree.lua
  use({
    "kyazdani42/nvim-tree.lua",
    config = function() require("plugins/configs/tree") end,
  })

  if not is_installed then
    packer.sync()
  end
end)
