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

    -- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
    local lsp_servers = {
      clangd = { filetypes = { "c", "cpp", "objc", "objcpp", "cuda" } },
      cssls = {},
      -- See:
      --   - https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#denols
      --   - https://docs.deno.com/runtime/getting_started/setup_your_environment/#neovim-0.6%2B-using-the-built-in-language-server
      denols = { root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc") },
      dockerls = {},
      -- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#gopls
      gopls = {
        settings = {
          gopls = {
            staticcheck = true,
            -- See:
            --   - https://github.com/golang/tools/blob/master/gopls/doc/analyzers.md
            --   - https://staticcheck.dev/docs/checks/
            analyses = {
              SA9003 = true,
              ST1003 = true,
              ST1016 = true,
              ST1020 = true,
              ST1021 = true,
              ST1022 = true,
              ST1023 = true,
            },
          },
        },
      },
      html = { filetypes = { "html" } },
      -- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#lua_ls
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
      pbls = {},
      pylsp = {},
      -- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#rust_analyzer
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
      --   - https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#ts_ls
      --   - https://github.com/vuejs/language-tools#hybrid-mode-configuration-requires-vuelanguage-server-version-200
      --   - https://docs.deno.com/runtime/getting_started/setup_your_environment/#neovim-0.6%2B-using-the-built-in-language-server
      ts_ls = function()
        local config = {
          init_options = { plugins = {} },
          filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
          root_dir = lspconfig.util.root_pattern("package.json"),
          single_file_support = false,
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
      -- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#yamlls
      yamlls = {
        settings = {
          yaml = { keyOrdering = false },
        },
      },
    }

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

    local on_attach = function(_, buffer)
      local opts = { buffer = buffer }

      utils.keymap("n", "<leader>h", vim.lsp.buf.hover, "Hover", opts)
      utils.keymap("n", "<leader>la", vim.lsp.buf.code_action, "Code actions", opts)
      utils.keymap("n", "<leader>lr", vim.lsp.buf.rename, "Rename", opts)
      utils.keymap("n", "<leader>lf", vim.lsp.buf.signature_help, "Signature", opts)
    end

    -- See: https://github.com/williamboman/mason-lspconfig.nvim#configuration
    mason_lspconfig.setup({
      ensure_installed = vim.tbl_keys(lsp_servers),
      handlers = {
        function(lsp_server_name)
          local lsp_server_config = lsp_servers[lsp_server_name] or {}
          if type(lsp_server_config) == "function" then
            lsp_server_config = lsp_server_config()
          end
          lsp_server_config = vim.tbl_extend(
            "force",
            { capabilities = capabilities, on_attach = on_attach },
            lsp_server_config
          )
          lspconfig[lsp_server_name].setup(lsp_server_config)
        end,
      },
    })
  end,
}
