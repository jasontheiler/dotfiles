local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local utils = require("utils")

-- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local lsp_servers = {
  cssls = {},
  dockerls = {},
  html = {},
  -- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#lua_ls
  lua_ls = {
    settings = {
      Lua = {
        runtime = {
          version = "LuaJIT",
        },
        diagnostics = {
          globals = { "vim" },
        },
      },
    },
    format = true,
  },
  marksman = {},
  -- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
  rust_analyzer = {
    settings = {
      ["rust-analyzer"] = {
        cargo = {
          features = "all",
        },
        check = {
          command = "clippy",
        },
      },
    },
    format = true,
  },
  sqlls = {},
  taplo = {},
  tsserver = {},
  -- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#volar
  volar = {
    filetypes = {
      "typescript",
      "javascript",
      "typescriptreact",
      "javascriptreact",
      "vue",
      "json",
    },
  },
  -- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#yamlls
  yamlls = {
    settings = {
      yaml = {
        keyOrdering = false,
      },
    },
  },
}

-- See: https://github.com/williamboman/mason-lspconfig.nvim#configuration
mason_lspconfig.setup({ ensure_installed = vim.tbl_keys(lsp_servers) })

-- See: https://github.com/hrsh7th/cmp-nvim-lsp#setup
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

-- See: https://github.com/neovim/nvim-lspconfig#suggested-configuration
local on_attach = function(_, buffer)
  local opts = { buffer = buffer }

  utils.keymap("n", "cr", vim.lsp.buf.rename, opts)
  utils.keymap("n", "<Leader>lS", vim.lsp.buf.signature_help, opts)
  utils.keymap({ "n", "v" }, "<Leader>h", vim.lsp.buf.hover, opts)
  utils.keymap({ "n", "v" }, "<Leader>la", vim.lsp.buf.code_action, opts)
  utils.keymap({ "n", "v" }, "<Leader>f", function()
    vim.lsp.buf.format({
      async = true,
      filter = function(lsp)
        return lsp.name == "null-ls" or lsp_servers[lsp.name].format
      end
    })
  end, opts)
end

mason_lspconfig.setup_handlers({
  function(lsp_server_name)
    lspconfig[lsp_server_name].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = lsp_servers[lsp_server_name].settings,
      filetypes = lsp_servers[lsp_server_name].filetypes,
    })
  end,
})
