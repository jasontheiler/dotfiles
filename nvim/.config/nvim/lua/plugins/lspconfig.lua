--- See: https://github.com/neovim/nvim-lspconfig
---
--- @type LazyPluginSpec
return {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- See: https://github.com/mason-org/mason.nvim
    "mason-org/mason.nvim",
    -- See: https://github.com/mason-org/mason-lspconfig.nvim
    "mason-org/mason-lspconfig.nvim",
  },
  event = "VeryLazy",
  config = function()
    local mason_lspconfig = require("mason-lspconfig")

    -- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#clangd
    vim.lsp.config("clangd", { filetypes = { "c", "cpp", "objc", "objcpp", "cuda" } })

    -- See:
    --   - https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#denols
    --   - https://docs.deno.com/runtime/getting_started/setup_your_environment/#neovim-0.6%2B-using-the-built-in-language-server
    vim.lsp.config("denols", {
      root_dir = function(_, cb)
        local cwd = vim.fn.getcwd()
        for _, suffix in ipairs({ "/deno.json", "/deno.jsonc" }) do
          if vim.uv.fs_stat(cwd .. suffix) then
            cb(cwd)
          end
        end
      end,
    })

    -- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#gopls
    vim.lsp.config("gopls", {
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
    })

    -- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#html
    vim.lsp.config("html", { filetypes = { "html" } })

    -- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#lua_ls
    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          runtime = { version = "LuaJIT" },
          workspace = {
            checkThirdParty = false,
            library = { "${3rd}/luv/library", unpack(vim.api.nvim_get_runtime_file("", true)) },
          },
        },
      },
    })

    -- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#rust_analyzer
    vim.lsp.config("rust_analyzer", {
      settings = {
        ["rust-analyzer"] = {
          cargo = { features = "all" },
          check = { command = "clippy" },
        },
      },
    })

    -- See:
    --   - https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#ts_ls
    --   - https://github.com/vuejs/language-tools#hybrid-mode-configuration-requires-vuelanguage-server-version-200
    --   - https://docs.deno.com/runtime/getting_started/setup_your_environment/#neovim-0.6%2B-using-the-built-in-language-server
    vim.lsp.config("ts_ls", {
      init_options = {
        plugins = {
          {
            name = "@vue/typescript-plugin",
            location = vim.fn.expand("$MASON/packages/vue-language-server/node_modules/@vue/language-server/"),
            languages = { "vue" },
          },
        },
      },
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
      root_dir = function(_, cb)
        local cwd = vim.fn.getcwd()
        for _, suffix in ipairs({ "/package.json", "/tsconfig.json" }) do
          if vim.uv.fs_stat(cwd .. suffix) then
            cb(cwd)
          end
        end
      end,
      single_file_support = false,
    })

    -- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#yamlls
    vim.lsp.config("yamlls", {
      settings = {
        yaml = { keyOrdering = false },
      },
    })

    local augroup_lsp = vim.api.nvim_create_augroup("user_lsp", {})

    vim.api.nvim_create_autocmd("LspAttach", {
      group = augroup_lsp,
      callback = function(event)
        vim.keymap.set("n", "<Leader>la", vim.lsp.buf.code_action, {
          desc = "Code actions",
          buffer = event.buf,
        })
        vim.keymap.set("n", "<Leader>lr", vim.lsp.buf.rename, {
          desc = "Rename",
          buffer = event.buf,
        })
        vim.keymap.set("n", "<Leader>lf", vim.lsp.buf.signature_help, {
          desc = "Signature",
          buffer = event.buf,
        })
      end,
    })

    -- See: https://github.com/mason-org/mason-lspconfig.nvim#configuration
    mason_lspconfig.setup({
      ensure_installed = {
        "buf_ls",
        "clangd",
        "cssls",
        "denols",
        "dockerls",
        "html",
        "lua_ls",
        "marksman",
        "pylsp",
        "rust_analyzer",
        "sqlls",
        "taplo",
        "templ",
        "vue_ls",
        "yamlls",
      },
      automatic_enable = true,
    })
  end,
}
