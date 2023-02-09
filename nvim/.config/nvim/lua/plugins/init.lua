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
  use({ "wbthomason/packer.nvim" })

  -- See: https://github.com/nvim-lua/plenary.nvim
  use({ "nvim-lua/plenary.nvim" })

  -- See: https://github.com/catppuccin/nvim
  use({
      "catppuccin/nvim",
      as = "catppuccin",
      config = function() require("plugins/configs/catppuccin") end,
  })

  -- See: https://github.com/nvim-treesitter/nvim-treesitter
  use({
      "nvim-treesitter/nvim-treesitter",
      config = function() require("plugins/configs/treesitter") end,
  })

  -- See: https://github.com/nvim-treesitter/nvim-treesitter-context
  use({
      "nvim-treesitter/nvim-treesitter-context",
      after = {
          "nvim-treesitter",
      },
      config = function() require("plugins/configs/treesitter-context") end,
  })

  -- See: https://github.com/windwp/nvim-autopairs
  use({
      "windwp/nvim-autopairs",
      config = function() require("plugins/configs/autopairs") end,
  })

  -- See: https://github.com/L3MON4D3/LuaSnip
  use({ "L3MON4D3/LuaSnip" })

  -- See: https://github.com/saadparwaiz1/cmp_luasnip
  use({ "saadparwaiz1/cmp_luasnip" })

  -- See: https://github.com/hrsh7th/cmp-nvim-lsp
  use({ "hrsh7th/cmp-nvim-lsp" })

  -- See: https://github.com/hrsh7th/cmp-nvim-lsp-signature-help
  use({ "hrsh7th/cmp-nvim-lsp-signature-help" })

  -- See: https://github.com/hrsh7th/cmp-buffer
  use({ "hrsh7th/cmp-buffer" })

  -- See: https://github.com/hrsh7th/cmp-path
  use({ "hrsh7th/cmp-path" })

  -- See: https://github.com/hrsh7th/cmp-cmdline
  use({ "hrsh7th/cmp-cmdline" })

  -- See: https://github.com/hrsh7th/nvim-cmp
  use({
      "hrsh7th/nvim-cmp",
      config = function() require("plugins/configs/cmp") end,
  })

  -- See: https://github.com/williamboman/mason.nvim
  use({
      "williamboman/mason.nvim",
      config = function() require("plugins/configs/mason") end,
  })

  -- See: https://github.com/neovim/nvim-lspconfig
  use({ "neovim/nvim-lspconfig" })

  -- See: https://github.com/williamboman/mason-lspconfig.nvim
  use({
      "williamboman/mason-lspconfig.nvim",
      after = {
          "cmp-nvim-lsp",
          "mason.nvim",
          "nvim-lspconfig",
      },
      config = function() require("plugins/configs/mason-lspconfig") end,
  })

  -- See: https://github.com/jose-elias-alvarez/null-ls.nvim
  use({ "jose-elias-alvarez/null-ls.nvim" })

  -- See: https://github.com/jayp0521/mason-null-ls.nvim
  use({
      "jayp0521/mason-null-ls.nvim",
      after = {
          "mason.nvim",
          "null-ls.nvim",
      },
      config = function() require("plugins/configs/mason-null-ls") end,
  })

  -- See: https://github.com/j-hui/fidget.nvim
  use({
      "j-hui/fidget.nvim",
      config = function() require("plugins/configs/fidget") end,
  })

  -- See: https://github.com/lukas-reineke/indent-blankline.nvim
  -- use({
  --     "lukas-reineke/indent-blankline.nvim",
  --     config = function() require("plugins/configs/indent-blankline") end,
  -- })

  -- See: https://github.com/kyazdani42/nvim-web-devicons
  use({
      "kyazdani42/nvim-web-devicons",
      config = function() require("plugins/configs/web-devicons") end,
  })

  -- See: https://github.com/lewis6991/gitsigns.nvim
  use({
      "lewis6991/gitsigns.nvim",
      config = function() require("plugins/configs/gitsigns") end,
  })

  -- See: https://github.com/feline-nvim/feline.nvim
  use({
      "feline-nvim/feline.nvim",
      after = {
          "plenary.nvim",
          "catppuccin",
          "gitsigns.nvim",
      },
      config = function() require("plugins/configs/feline") end,
  })

  -- See: https://github.com/nvim-telescope/telescope.nvim
  use({
      "nvim-telescope/telescope.nvim",
      branch = "0.1.x",
      after = {
          "nvim-web-devicons",
      },
      config = function() require("plugins/configs/telescope") end,
  })

  -- See: https://github.com/famiu/bufdelete.nvim
  use({
      "famiu/bufdelete.nvim",
      config = function() require("plugins/configs/bufdelete") end,
  })

  -- See: https://github.com/akinsho/bufferline.nvim
  use({
      "akinsho/bufferline.nvim",
      after = {
          "nvim-web-devicons",
      },
      config = function() require("plugins/configs/bufferline") end,
  })

  if not is_installed then
    packer.sync()
  end
end)
