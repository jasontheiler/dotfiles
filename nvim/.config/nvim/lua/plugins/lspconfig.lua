local utils = require("utils")

-- See: https://github.com/neovim/nvim-lspconfig
return {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- See: https://github.com/williamboman/mason.nvim
    "williamboman/mason.nvim",
    -- See: https://github.com/williamboman/mason-lspconfig.nvim
    "williamboman/mason-lspconfig.nvim",
    -- See: https://github.com/hrsh7th/cmp-nvim-lsp
    "hrsh7th/cmp-nvim-lsp",
  },
  event = "VeryLazy",
  config = function()
    local lspconfig = require("lspconfig")
    local mason_registry = require("mason-registry")
    local mason_lspconfig = require("mason-lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    -- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    local lsp_servers = {
      clangd = {},
      cssls = {},
      dockerls = {},
      gopls = {},
      html = { filetypes = { "html" } },
      -- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#lua_ls
      lua_ls = {
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            workspace = {
              checkThirdParty = false,
              library = { "${3rd}/luv/library", unpack(vim.api.nvim_get_runtime_file("", true)) },
            },
          },
        },
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
      },
      sqlls = {},
      taplo = {},
      templ = {},
      -- See:
      --   - https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tsserver
      --   - https://github.com/vuejs/language-tools#hybrid-mode-configuration-requires-vuelanguage-server-version-200
      tsserver = function()
        local config = {
          init_options = { plugins = {} },
          filetypes = {
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "vue",
          },
        }

        local is_vue_language_server_installed, vue_language_server = pcall(
          mason_registry.get_package,
          "vue-language-server"
        )
        if is_vue_language_server_installed then
          table.insert(config.init_options.plugins, {
            name = "@vue/typescript-plugin",
            location = vue_language_server:get_install_path()
                .. "/node_modules/@vue/language-server",
            languages = { "vue" },
          })
        end

        return config
      end,
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

      utils.keymap("n", "<leader>h", vim.lsp.buf.hover, "Hover", opts)
      utils.keymap("n", "<leader>la", vim.lsp.buf.code_action, "Code actions", opts)
      utils.keymap("n", "<leader>lr", vim.lsp.buf.rename, "Rename", opts)
      utils.keymap("n", "<leader>lS", vim.lsp.buf.signature_help, "Signature", opts)

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
        local lsp_server_config = lsp_servers[lsp_server_name]
        -- See: https://github.com/neovim/nvim-lspconfig/pull/3232#issuecomment-2331025714
        if lsp_server_name == "tsserver" then
          lsp_server_name = "ts_ls"
        end
        if type(lsp_server_config) == "function" then
          lsp_server_config = lsp_server_config()
        end
        lspconfig[lsp_server_name].setup(vim.tbl_extend(
          "force",
          { capabilities = capabilities, on_attach = on_attach },
          lsp_server_config
        ))
      end,
    })
  end,
}
