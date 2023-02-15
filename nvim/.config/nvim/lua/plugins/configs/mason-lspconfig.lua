local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local utils = require("utils")

-- See: https://github.com/williamboman/mason-lspconfig.nvim#configuration
mason_lspconfig.setup({
    -- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    ensure_installed = {
        "cssls",
        "dockerls",
        "html",
        "lua_ls",
        "marksman",
        "rust_analyzer",
        "taplo",
        "tsserver",
        "yamlls",
    },
})

-- See: https://github.com/neovim/nvim-lspconfig#suggested-configuration
local on_attach = function(_, buffer)
  local opts = { buffer = buffer }

  utils.keymap("n", { "K", "<Leader>h" }, vim.lsp.buf.hover, opts)
  utils.keymap("n", "gd", vim.lsp.buf.definition, opts)
  utils.keymap("n", "gD", vim.lsp.buf.declaration, opts)
  utils.keymap("n", "gi", vim.lsp.buf.implementation, opts)
  utils.keymap("n", "gr", vim.lsp.buf.references, opts)
  utils.keymap("n", "gs", vim.lsp.buf.signature_help, opts)
  utils.keymap("n", "gt", vim.lsp.buf.type_definition, opts)
  utils.keymap("n", "cr", vim.lsp.buf.rename, opts)
  utils.keymap({ "n", "v" }, "<Leader>f", function()
    vim.lsp.buf.format({
        async = true,
        filter = function(lsp) return lsp.name ~= "volar" end,
    })
  end, opts)
end

-- See: https://github.com/hrsh7th/cmp-nvim-lsp#setup
local capabilities = cmp_nvim_lsp.default_capabilities()

local default_setup_config = {
    on_attach = on_attach,
    capabilities = capabilities,
}

mason_lspconfig.setup_handlers({
    function(lsp) lspconfig[lsp].setup(default_setup_config) end,
    -- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
    ["rust_analyzer"] = function()
      lspconfig.rust_analyzer.setup(vim.tbl_extend("force", default_setup_config, {
          settings = {
              ["rust-analyzer"] = {
                  check = {
                      command = "clippy",
                  },
              },
          },
      }))
    end,
    -- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#lua_ls
    ["lua_ls"] = function()
      lspconfig.lua_ls.setup(vim.tbl_extend("force", default_setup_config, {
          settings = {
              Lua = {
                  diagnostics = {
                      globals = { "vim" },
                  },
              },
          },
      }))
    end,
    -- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#volar
    ["volar"] = function()
      lspconfig.volar.setup(vim.tbl_extend("force", default_setup_config, {
          filetypes = {
              "typescript",
              "javascript",
              "typescriptreact",
              "javascriptreact",
              "vue",
              "json",
          },
      }))
    end,
})
