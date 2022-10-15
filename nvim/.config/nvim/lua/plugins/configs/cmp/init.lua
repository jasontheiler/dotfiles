local cmp = require("cmp")
local luasnip = require("luasnip")
local icons = require("plugins/configs/cmp/icons")

-- See: https://github.com/hrsh7th/nvim-cmp#setup
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  formatting = {
    format = function(_, item)
      item.kind = string.format(" %s %s", (icons[item.kind] or "?"), item.kind)
      item.menu = nil
      return item
    end,
  },
  window = {
    completion = {
      scrolloff = 4,
    },
  },
  sources = {
    { name = "luasnip" },
    { name = "nvim_lsp" },
    { name = "nvim_lsp_signature_help" },
    { name = "buffer" },
  },
  mapping = {
    ["<C-Space>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.close()
      else
        cmp.complete()
      end
    end, { "i", "s" }),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.expand_or_jumpable(-1) then
        luasnip.expand_or_jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<C-d>"] = cmp.mapping.scroll_docs(4),
    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
  },
})

cmp.setup.cmdline({ "/", "?" }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

-- See: https://github.com/hrsh7th/cmp-cmdline/issues/24#issuecomment-1094896592
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    {
      name = "path",
      option = {
        trailing_slash = true,
      },
    },
    { name = "cmdline" },
  },
})

vim.opt.completeopt = { "menu", "menuone", "noinsert" }
