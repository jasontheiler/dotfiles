local utils = require("utils")

-- See: https://github.com/williamboman/mason-lspconfig.nvim
return {
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
  config = function()
    local mason_lspconfig = require("mason-lspconfig")
    local mason_registry = require("mason-registry")
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    -- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    local lsp_servers = {
      cssls = {},
      dockerls = {},
      gopls = {},
      html = {},
      -- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#lua_ls
      lua_ls = {
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            workspace = {
              checkThirdParty = false,
              library = {
                "${3rd}/luv/library",
                unpack(vim.api.nvim_get_runtime_file("", true)),
              },
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
            cargo = { features = "all" },
            check = { command = "clippy" },
          },
        },
        format = true,
      },
      sqlls = {},
      taplo = {},
      templ = {},
      -- See:
      --   - https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tsserver
      --   - https://github.com/vuejs/language-tools#hybrid-mode-configuration-requires-vuelanguage-server-version-200
      tsserver = {
        init_options = {
          plugins = {
            {
              name = "@vue/typescript-plugin",
              location = mason_registry.get_package("vue-language-server"):get_install_path() ..
                  "/node_modules/@vue/language-server",
              languages = { "vue" },
            }
          },
        },
        filetypes = {
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
          "vue",
        },
      },
      -- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#volar
      volar = {},
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
    local on_attach = function(client, buffer)
      local opts = { buffer = buffer }

      utils.keymap("n", "<leader>la", vim.lsp.buf.code_action, "Code actions", opts)
      utils.keymap("n", "<leader>lr", vim.lsp.buf.rename, "Rename", opts)
      utils.keymap("n", "<leader>lS", vim.lsp.buf.signature_help, "Signature", opts)
      utils.keymap("n", "<leader>h", vim.lsp.buf.hover, "Hover", opts)
      utils.keymap("n", "<leader>f", function()
        vim.lsp.buf.format({
          async = true,
          filter = function(lsp) return lsp.name == "null-ls" or lsp_servers[lsp.name].format end
        })
      end, "Format", opts)

      if client.name == "tsserver" or client.name == "volar" then
        return
      end

      if client.server_capabilities.documentHighlightProvider then
        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
          buffer = buffer,
          callback = function()
            vim.lsp.buf.clear_references()
            vim.lsp.buf.document_highlight()
          end,
        })

        vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI", "TextYankPost" }, {
          buffer = buffer,
          callback = vim.lsp.buf.clear_references,
        })
      end
    end

    mason_lspconfig.setup_handlers({
      function(lsp_server_name)
        lspconfig[lsp_server_name].setup(vim.tbl_extend("force", {
          capabilities = capabilities,
          on_attach = on_attach,
        }, lsp_servers[lsp_server_name]))
      end,
    })
  end,
}
