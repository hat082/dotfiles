return {
  "L3MON4D3/LuaSnip",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("luasnip.loaders.from_snipmate").load({ paths = "~/.config/nvim/snippets/" })
    local ls = require("luasnip")
    local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node
    ls.add_snippets("lua", {
      s("hello", {
        t('print("hello world")')
      })
    })
  end
}
