local M = {}

M.opts = function()
  local conf = require "plugins.configs.cmp"
  local cmp = require "cmp"

  local confirm = function(fallback)
    if cmp.visible() then
      cmp.confirm()
    elseif require("luasnip").expand_or_jumpable() then
      vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
    else
      fallback()
    end
  end
  table.insert(conf.sources, { name = "crates" })

  conf.mapping["<C-e>"] = cmp.mapping.abort()
  conf.mapping["<Tab>"] = cmp.mapping(confirm, {
    "i",
    "s",
  })
  conf.mapping["<S-Tab>"] = cmp.mapping(confirm, {
    "i",
    "s",
  })

  conf.sorting = {
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  }

  return conf
end

return M
