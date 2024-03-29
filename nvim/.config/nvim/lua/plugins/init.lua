local is_installed, lazy = pcall(require, "lazy")
if not is_installed then
  local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    "https://github.com/folke/lazy.nvim.git",
    lazy_path
  })
  vim.opt.rtp:prepend(lazy_path)
  lazy = require("lazy")
end

-- See: https://github.com/folke/lazy.nvim
lazy.setup({
  -- See: https://github.com/nvim-lua/plenary.nvim
  {
    "nvim-lua/plenary.nvim",
    event = "VeryLazy",
  },

  -- See: https://github.com/catppuccin/nvim
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function() require("plugins/configs/catppuccin") end,
  },

  -- See: https://github.com/nvim-treesitter/nvim-treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    config = function() require("plugins/configs/treesitter") end,
  },

  -- See: https://github.com/nvim-treesitter/nvim-treesitter-context
  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = {
      -- See: https://github.com/nvim-treesitter/nvim-treesitter
      "nvim-treesitter/nvim-treesitter",
    },
    event = "VeryLazy",
    -- See: https://github.com/nvim-treesitter/nvim-treesitter-context#configuration
    opts = {
      multiline_threshold = 1,
      separator = "─",
    },
  },

  -- See: https://github.com/tpope/vim-sleuth
  "tpope/vim-sleuth",

  -- See: https://github.com/windwp/nvim-autopairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    -- See: https://github.com/windwp/nvim-autopairs#override-default-values
    opts = {},
  },

  -- See: https://github.com/hrsh7th/nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      -- See: https://github.com/hrsh7th/cmp-buffer
      "hrsh7th/cmp-buffer",
      -- See: https://github.com/hrsh7th/cmp-cmdline
      "hrsh7th/cmp-cmdline",
      -- See: https://github.com/hrsh7th/cmp-path
      "hrsh7th/cmp-path",
      -- See: https://github.com/hrsh7th/cmp-nvim-lsp
      "hrsh7th/cmp-nvim-lsp",
      -- See: https://github.com/hrsh7th/cmp-nvim-lsp-signature-help
      "hrsh7th/cmp-nvim-lsp-signature-help",
      -- See: https://github.com/L3MON4D3/LuaSnip
      "L3MON4D3/LuaSnip",
      -- See: https://github.com/saadparwaiz1/cmp_luasnip
      "saadparwaiz1/cmp_luasnip",
    },
    event = { "CmdlineEnter", "InsertEnter" },
    config = function() require("plugins/configs/cmp") end,
  },

  -- See: https://github.com/williamboman/mason.nvim
  {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    -- See: https://github.com/williamboman/mason.nvim#configuration
    opts = {},
  },

  -- See: https://github.com/williamboman/mason-lspconfig.nvim
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      -- See: https://github.com/williamboman/mason.nvim
      "williamboman/mason.nvim",
      -- See: https://github.com/neovim/nvim-lspconfig
      "neovim/nvim-lspconfig",
      -- See: https://github.com/hrsh7th/cmp-nvim-lsp
      "hrsh7th/cmp-nvim-lsp",
    },
    event = "VeryLazy",
    config = function() require("plugins/configs/mason-lspconfig") end,
  },

  -- See: https://github.com/jayp0521/mason-null-ls.nvim
  {
    "jayp0521/mason-null-ls.nvim",
    dependencies = {
      -- See: https://github.com/williamboman/mason.nvim
      "williamboman/mason.nvim",
      -- See: https://github.com/jose-elias-alvarez/null-ls.nvim
      "jose-elias-alvarez/null-ls.nvim",
    },
    event = "VeryLazy",
    config = function() require("plugins/configs/mason-null-ls") end,
  },

  -- See: https://github.com/j-hui/fidget.nvim
  {
    "j-hui/fidget.nvim",
    event = "VeryLazy",
    config = function() require("plugins/configs/fidget") end,
  },

  -- See: https://github.com/lewis6991/gitsigns.nvim
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    config = function() require("plugins/configs/gitsigns") end,
  },

  -- See: https://github.com/lukas-reineke/virt-column.nvim
  {
    "lukas-reineke/virt-column.nvim",
    event = "VeryLazy",
    -- See: https://github.com/lukas-reineke/virt-column.nvim#setup
    opts = {
      char = "│",
      highlight = "VirtColumn",
    },
  },

  -- See: https://github.com/rebelot/heirline.nvim
  {
    "rebelot/heirline.nvim",
    dependencies = {
      -- See: https://github.com/catppuccin/nvim
      "catppuccin",
    },
    config = function() require("plugins/configs/heirline") end,
  },

  -- See: https://github.com/folke/which-key.nvim
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function() require("plugins/configs/which-key") end,
  },

  -- See: https://github.com/nvim-telescope/telescope.nvim
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    event = "VeryLazy",
    config = function() require("plugins/configs/telescope") end,
  },
})
