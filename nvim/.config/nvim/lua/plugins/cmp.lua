-- See: https://github.com/hrsh7th/nvim-cmp
return {
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
    -- See: https://github.com/hrsh7th/cmp-calc
    "hrsh7th/cmp-calc",
    -- See: https://github.com/L3MON4D3/LuaSnip
    "L3MON4D3/LuaSnip",
    -- See: https://github.com/saadparwaiz1/cmp_luasnip
    "saadparwaiz1/cmp_luasnip",
  },
  event = { "CmdlineEnter", "InsertEnter" },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local mappings = require("plugins.cmp.mappings")

    -- See: https://github.com/hrsh7th/nvim-cmp#setup
    cmp.setup({
      snippet = {
        expand = function(args) luasnip.lsp_expand(args.body) end,
      },
      formatting = {
        format = function(entry, item)
          local filetype_icons = mappings.filetype_icons[vim.bo.filetype]
          local filetype_labels = mappings.filetype_labels[vim.bo.filetype]
          local source_icons = mappings.source_icons[entry.source.name]
          local source_labels = mappings.source_labels[entry.source.name]

          local icon = filetype_icons and filetype_icons[item.kind]
              or source_icons and source_icons[item.kind]
              or mappings.icons[item.kind] or "?"
          local label = filetype_labels and filetype_labels[item.kind]
              or source_labels and source_labels[item.kind]
              or item.kind

          item.kind = string.format(" %s %s", icon, label)
          item.menu = nil

          return item
        end,
      },
      window = {
        completion = {
          border = {
            { "┌", "CmpCompletionBorder" },
            { "─", "CmpCompletionBorder" },
            { "┐", "CmpCompletionBorder" },
            { "│", "CmpCompletionBorder" },
            { "┘", "CmpCompletionBorder" },
            { "─", "CmpCompletionBorder" },
            { "└", "CmpCompletionBorder" },
            { "│", "CmpCompletionBorder" },
          },
          scrolloff = 4,
        },
        documentation = {
          border = {
            { "┌", "CmpDocumentationBorder" },
            { "─", "CmpDocumentationBorder" },
            { "┐", "CmpDocumentationBorder" },
            { "│", "CmpDocumentationBorder" },
            { "┘", "CmpDocumentationBorder" },
            { "─", "CmpDocumentationBorder" },
            { "└", "CmpDocumentationBorder" },
            { "│", "CmpDocumentationBorder" },
          },
        }
      },
      sources = {
        { name = "nvim_lsp_signature_help" },
        { name = "nvim_lsp" },
        { name = 'calc' },
        { name = "buffer" },
      },
      mapping = {
        ["<C-Space>"] = cmp.mapping(function()
          if cmp.visible() then
            cmp.abort()
          else
            cmp.complete()
          end
        end, { "i", "s" }),
        ["<CR>"] = cmp.mapping.confirm({
          select = true,
          behavior = cmp.ConfirmBehavior.Replace
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s", "c" }),
        ["<C-j>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s", "c" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.expand_or_locally_jumpable(-1) then
            luasnip.expand_or_jump(-1)
          else
            fallback()
          end
        end, { "i", "s", "c" }),
        ["<C-k>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.expand_or_locally_jumpable(-1) then
            luasnip.expand_or_jump(-1)
          else
            fallback()
          end
        end, { "i", "s", "c" }),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
      },
    })

    cmp.setup.cmdline({ "/", "?" }, {
      sources = {
        { name = "buffer" },
      },
      mapping = cmp.mapping.preset.cmdline(),
    })

    cmp.setup.cmdline(":", {
      sources = {
        { name = "cmdline" },
        {
          name = "path",
          option = { trailing_slash = true },
        },
      },
      mapping = cmp.mapping.preset.cmdline(),
    })
  end,
}
