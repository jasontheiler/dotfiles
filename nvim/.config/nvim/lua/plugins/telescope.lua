--- See: https://github.com/nvim-telescope/telescope.nvim
---
--- @type LazyPluginSpec
return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    -- See: https://github.com/nvim-lua/plenary.nvim
    "nvim-lua/plenary.nvim",
  },
  event = "VeryLazy",
  config = function()
    local telescope = require("telescope")
    local telescope_actions = require("telescope.actions")
    local telescope_builtin = require("telescope.builtin")

    -- See: https://github.com/nvim-telescope/telescope.nvim#customization
    telescope.setup({
      defaults = {
        prompt_prefix = "  ",
        selection_caret = "❯ ",
        get_status_text = function(picker)
          local stat_processed = picker.stats.processed or 0
          local stat_filtered = picker.stats.filtered or 0
          return string.format(" %d/%d ", stat_processed - stat_filtered, stat_processed)
        end,
        preview = { filesize_limit = 0.1 },
        layout_strategy = "flex",
        layout_config = {
          flex = { flip_columns = 120 },
          horizontal = { preview_cutoff = 0 },
          vertical = {
            preview_height = 0.33,
            preview_cutoff = 0,
          },
          cursor = {
            width = 80,
            height = 10,
          },
        },
        mappings = {
          i = {
            ["<Esc>"] = telescope_actions.close,
          },
        },
      },
      pickers = {
        find_files = {
          find_command = {
            "rg",
            "--files",
            "--hidden",
            "--glob", "!*/.git/*",
            "--glob", "!.git/*",
            "--glob", "!*.lock",
            "--glob", "!*/package-lock.json",
            "--glob", "!*/pnpm-lock.yaml",
          },
        },
        live_grep = {
          additional_args = function() return { "--hidden" } end,
          glob_pattern = {
            "!*/.git/*",
            "!.git/*",
            "!*.lock",
            "!*/package-lock.json",
            "!*/pnpm-lock.yaml",
          },
        },
        oldfiles = { cwd_only = true },
      },
    })

    local function keymap_picker(lhs, picker, keymap_opts, picker_opts)
      local default_picker_opts = {
        prompt_title = (keymap_opts or {}).desc,
        results_title = "Results",
        preview_title = "Preview",
      }
      picker_opts = vim.tbl_extend("force", default_picker_opts, picker_opts or {})
      vim.keymap.set("n", lhs, function() picker(picker_opts) end, keymap_opts)
    end

    keymap_picker("<Leader>sh", telescope_builtin.help_tags, { desc = "Help" })
    keymap_picker("<Leader>sf", telescope_builtin.find_files, { desc = "Files" })
    keymap_picker("<Leader>sa", telescope_builtin.find_files, { desc = "All files" }, { no_ignore = true })
    keymap_picker("<Leader>sp", telescope_builtin.oldfiles, { desc = "Previous files" })
    keymap_picker("<Leader>sb", telescope_builtin.buffers, { desc = "Buffers" })
    keymap_picker("<Leader>s/", telescope_builtin.live_grep, { desc = "Search" })
    keymap_picker("<Leader>sd", telescope_builtin.diagnostics, { desc = "Diagnostics" })
    keymap_picker("<Leader>gc", telescope_builtin.git_bcommits, { desc = "Buffer commits" })

    local augroup_telescope = vim.api.nvim_create_augroup("user_telescope", {})

    vim.api.nvim_create_autocmd({ "LspAttach" }, {
      group = augroup_telescope,
      callback = function(event)
        keymap_picker("<Leader>ls", telescope_builtin.lsp_document_symbols, {
          desc = "Document symbols",
          buffer = event.buf,
        })
        keymap_picker("<Leader>lS", telescope_builtin.lsp_workspace_symbols, {
          desc = "Workspace symbols",
          buffer = event.buf,
        })
        keymap_picker("<Leader>ld", telescope_builtin.lsp_definitions, {
          desc = "Definitions",
          buffer = event.buf,
        })
        keymap_picker("<Leader>lt", telescope_builtin.lsp_type_definitions, {
          desc = "Type definitions",
          buffer = event.buf,
        })
        keymap_picker("<Leader>li", telescope_builtin.lsp_implementations, {
          desc = "Implementations",
          buffer = event.buf,
        })
        keymap_picker("<Leader>lR", telescope_builtin.lsp_references, {
          desc = "References",
          buffer = event.buf,
        })
      end,
    })
  end,
}
