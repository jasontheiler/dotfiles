local cmp = require("cmp")
local luasnip = require("luasnip")
local mappings = require("plugins/configs/cmp/mappings")

-- See: https://github.com/hrsh7th/nvim-cmp#setup
cmp.setup({
  snippet = {
    expand = function(args) luasnip.lsp_expand(args.body) end,
  },
  formatting = {
    format = function(_, item)
      local filetype_labels = mappings.filetype_labels[vim.bo.filetype]
      item.kind = string.format(
        " %s %s",
        mappings.icons[item.kind] or "?",
        filetype_labels and filetype_labels[item.kind] or item.kind
      )
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
