return {
  keys = {
    {
      "<s-tab>",
      mode = { "i" },
      false,
    },
    {
      "<c-s-tab>",
      function()
        require("luasnip").jump(-1)
      end,
      mode = { "i", "s" },
    },
  },
}
