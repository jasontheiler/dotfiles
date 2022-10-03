local cmp = require("cmp")
local luasnip = require("luasnip")

-- See: https://github.com/hrsh7th/nvim-cmp#setup
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
  },
  mapping = {
    ["<C-Space>"] = cmp.mapping.complete(),
  },
})

vim.opt.completeopt = "menu,menuone,noselect"
