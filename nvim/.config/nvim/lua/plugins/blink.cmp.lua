--- See: https://cmp.saghen.dev/
---
--- @type LazyPluginSpec
return {
  "Saghen/blink.cmp",
  version = "1.*",
  event = "VeryLazy",
  --- See: https://cmp.saghen.dev/configuration/general.html
  ---
  --- @type blink.cmp.Config
  opts = {
    completion = {
      ghost_text = { enabled = true },
      menu = {
        draw = {
          columns = { { "kind_icon", "label", gap = 1 } },
        },
      },
      list = {
        selection = { auto_insert = false },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 0,
      },
    },
    keymap = {
      ["<C-Space>"] = { "show", "hide" },
      ["<C-u>"] = { "scroll_documentation_up", "fallback" },
      ["<C-d>"] = { "scroll_documentation_down", "fallback" },
      ["<CR>"] = { "accept", "fallback" },
      ["<Tab>"] = {
        function(cmp)
          if not cmp.is_visible() then
            return false
          end
          cmp.insert_next()
          cmp.insert_prev()
          cmp.hide()
          return true
        end,
        "fallback",
      },
    },
    cmdline = {
      completion = {
        ghost_text = { enabled = true },
        menu = { auto_show = true },
        list = {
          selection = {
            preselect = false,
            auto_insert = false,
          },
        },
      },
      keymap = {
        ["<C-Space>"] = { "show", "hide" },
        ["<CR>"] = { "accept_and_enter", "fallback" },
        ["<Tab>"] = { "accept", "fallback" },
      },
    },
  },
}
