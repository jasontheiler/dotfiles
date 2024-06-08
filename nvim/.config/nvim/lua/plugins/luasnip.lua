-- See: https://github.com/L3MON4D3/LuaSnip
return {
  "L3MON4D3/LuaSnip",
  event = { "InsertEnter" },
  config = function()
    local luasnip = require("luasnip")

    local s = luasnip.snippet
    local t = luasnip.text_node
    local i = luasnip.insert_node

    luasnip.add_snippets("go", {
      s("if err != nil", {
        t({ "if err != nil {", "\t" }),
        i(1, "return err"),
        t({ "", "}" }),
      })
    })
  end,
}
